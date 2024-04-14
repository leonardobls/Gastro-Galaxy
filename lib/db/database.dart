import 'dart:async';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/pages/ingredients.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class Repository {
  
  static const dbFile = "gastro_galaxy.db";
  static const version = 1;

  static late Database _db;

  initDb() async {
    String dbPath = await getDatabasesPath();
    String path = p.join(dbPath, dbFile);

    _db = await openDatabase(path,
        version: version, 
        onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await _db.execute('''
    CREATE TABLE Recipe (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    ) 
    ''');

    await _db.execute('''
    CREATE TABLE Ingredient(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
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

  Future<int> insertIngredient (Map<String, dynamic> row) async {
    await initDb();
    return await _db.insert('Ingredint', row);
  }

  Future<int> updateIngredientAvailability (Ingredient ingredient) async {
    await initDb();

    return await _db.update('Ingredient', ingredient.toJson(), where: 'id = ?', whereArgs: [ingredient.id]);
  }
}
