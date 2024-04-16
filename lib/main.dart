import 'package:flutter/material.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/db/database.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/pages/home.dart';
import 'package:gastro_galaxy/pages/ingredients.dart';
import 'package:gastro_galaxy/pages/recipes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  var db = Repository();

  final ThemeData myTheme = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    scaffoldBackgroundColor: AppStyles.backgroundColor,
  );

  Future<void> testInsertData() async {

    var testIngredient = new Ingredient(id: 1, name: 'testIngredient', isAvailable: true);
    var testRecipe = new Recipe(id: 1, name: 'testRecipe');

    var iId = await db.insertIngredient(testIngredient.toJson());
    print("Ingrediente criado");
    var rId = await db.insertRecipe(testRecipe.toJson());


    await db.linkIngredientToRecipe(iId, rId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (contex) => const Home(),
        '/ingredients': (contex) => const Ingredients(),
        '/recipes': (contex) => const Recipes(),
      },
      initialRoute: '/',
    );
  }
  
  @override
  void initState() {
    super.initState();
    testInsertData();
  }
}
