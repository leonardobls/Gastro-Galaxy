import 'package:flutter/material.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/db/database.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/pages/home.dart';
import 'package:gastro_galaxy/pages/ingredients.dart';
import 'package:gastro_galaxy/pages/recipes.dart';
import 'package:gastro_galaxy/pages/recipes_detail.dart';
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
    scaffoldBackgroundColor: AppStyles.primaryColor,
  );

  // Future<void> testInsertData() async {

  //   var testIngredient = new Ingredient(id: 1, name: 'testIngredient', isAvailable: true);
  //   var testRecipe = new Recipe(
  //     id: 1,
  //     name: 'testRecipe',
  //     description: 'test recipe description',
  //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKa6Hhp32o0Ojwb9MhVYCVfGfMUQs5cAOO2Vjqt22ACA&s'
  //   );

  //   var iId = await db.insertIngredient(testIngredient.toJson());
  //   print("Ingrediente criado");
  //   var rId = await db.insertRecipe(testRecipe.toJson());

  //   await db.linkIngredientToRecipe(iId, rId);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const Home(),
          );
        } else if (settings.name == "/ingredients") {
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const Ingredients(),
          );
        }
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const Home(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      },
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
    // testInsertData();
  }
}
