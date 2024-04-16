import 'dart:async';
import 'package:gastro_galaxy/models/category.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/models/user.dart';
import 'package:gastro_galaxy/pages/ingredients.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class Repository {
  
  static const dbFile = "gastro_galaxy.db";
  static const version = 1;

  static late Database _db;
  static const devMode = true;

  initDb() async {
    String dbPath = await getDatabasesPath();
    String path = p.join(dbPath, dbFile);

    _db = await openDatabase(path,
        version: version, 
        onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    if (devMode) {
      await db.execute('DROP TABLE IF EXISTS Category');
      await db.execute('DROP TABLE IF EXISTS IngredientRecipe');
      await db.execute('DROP TABLE IF EXISTS Recipe');
      await db.execute('DROP TABLE IF EXISTS Ingredient');
    }

    await db.execute('''CREATE TABLE Category (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    )
    ''');

    await db.execute('INSERT INTO Category VALUES (1, Pizzas)');
    await db.execute('INSERT INTO Category VALUES (2, Hamburgers)');
    await db.execute('INSERT INTO Category VALUES (3, Massas)');
    await db.execute('INSERT INTO Category VALUES (4, Bolos)');

    await db.execute('''
    CREATE TABLE Recipe (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      cId INTEGER,
      FOREIGN KEY (cId) REFERENCES Category(id) 
    ) 
    ''');

    await db.execute('''
    CREATE TABLE Ingredient(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      isAvailable BOOLEAN
    )
    ''');

    await db.execute('''
      CREATE TABLE IngredientRecipe (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        iId INTEGER,
        rId INTEGER,
        FOREIGN KEY (iId) REFERENCES Ingredient(id),
        FOREIGN KEY (rId) REFERENCES Recipe(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE User (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        isLogedIn BOOLEAN
      )
    ''');
  }

  Future<int> linkIngredientToRecipe(int iId, int rId) async {
    await initDb();
    int res = await _db.insert('IngredientRecipe', {'iId': iId, 'rId': rId});
    return res;
  }

  Future<int> insertRecipe (Map<String, dynamic> row) async {
    await initDb();
    return await _db.insert('Recipe', row);
  }

  Future<int> deleteAllRecipes() async {
    await initDb();
    return await _db.delete('Recipe');
  }

  Future<Map<Recipe, List<Ingredient>>?> getRecipeWithIngredients(int recipeId) async {
    await initDb();
    List<Map> result = await _db.rawQuery('''
      SELECT Recipe.id AS rId, Recipe.name AS rName,
             Ingredient.id AS iId, Ingredient.name AS iName, 
             Ingredient.isAvailable AS iIsAvailable
      FROM Recipe
      LEFT JOIN IngredientRecipe ON Recipe.id = IngredientRecipe.rId
      LEFT JOIN Ingredient ON IngredientRecipe.iId = Ingredient.id
      WHERE Recipe.id = ?
    ''', [recipeId]);

    if (result.isNotEmpty) {
      Map<Recipe, List<Ingredient>> recipesWithIngredients = {};
      Recipe? recipe;
      List<Ingredient> ingredients = [];

      for (var row in result) {
        recipe ??= Recipe(
            id: row['rId'],
            name: row['rName'],
          );

        if (row['iId'] != null) {
          ingredients.add(Ingredient(
            id: row['itemId'],
            name: row['itemName'],
            isAvailable: row['isAvailable']
          ));
        } else {
          recipesWithIngredients[recipe] = ingredients;
        }
      }

      return recipesWithIngredients;
    } else {
      return null;
    }
  }

  Future<List<Category>> getCategories() async {
    await initDb();

    final List<Map<String, Object?>> categories = await _db.query('Category');

    return [
      for (final {
        'id': id as int,
        'name': name as String,
      } in categories) Category(id: id, name: name)
    ];
  }
  
  Future<List<Ingredient>> getIngredients() async {
    await initDb();

    final List<Map<String, Object?>> ingredients = await _db.query('Category');

    return [
      for (final {
        'id': id as int,
        'name': name as String,
        'isAvailable': isAvailable as bool
      } in ingredients) Ingredient(id: id, name: name, isAvailable: isAvailable)
    ];
  }

  Future<Map<String, List<Recipe>>> getRecipesByCategory() async {
    await initDb();
    List<Map> result = await _db.rawQuery('''
      SELECT Recipe.id AS rId, Recipe.name AS rName, Recipe.cId AS cId,
             Category.name AS cName
      FROM Recipe
      INNER JOIN Category ON Recipe.cId = Category.id
    ''');

    Map<String, List<Recipe>> recipesByCategory = {};

    if (result.isNotEmpty) {
      for (var row in result) {
        String categoryName = row['cName'];
        Recipe recipe = Recipe(
          id: row['rId'],
          name: row['rName']
        );

        if (recipesByCategory.containsKey(categoryName)) {
          recipesByCategory[categoryName]?.add(recipe);
        } else {
          recipesByCategory[categoryName] = [recipe];
        }
      }
    }
    return recipesByCategory;
  }

  Future<int> insertIngredient (Map<String, dynamic> row) async {
    await initDb();
    return await _db.insert('Ingredient', row);
  }

  Future<int> updateIngredientAvailability (Ingredient ingredient) async {
    await initDb();

    return await _db.update('Ingredient', ingredient.toJson(), where: 'id = ?', whereArgs: [ingredient.id]);
  }

  Future<int> insertUser (Map<String, dynamic> row) async {
    await initDb();
    return await _db.insert('User', row);
  }

  Future<int> updateIsLogedIn (User user) async {
    await initDb();
    return await _db.update('User', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  }
}
