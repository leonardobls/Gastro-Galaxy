import 'dart:convert';
import 'dart:developer';

import 'package:gastro_galaxy/config/app_config.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecipeService {
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<List<Recipe>?> getRecipes() async {
    try {
      var response = await http.get(Uri.parse("${AppConfig.url}/recipes"));

      if (response.statusCode == 200) {
        var decodedList = json.decode(response.body) as List;
        List<Recipe> recipes = List<Recipe>.from(decodedList.map((r) => Recipe.fromJson(r)));
        return recipes;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Recipe?> getRecipe(int id) async {
    try {
      var response = await http.get(Uri.parse("${AppConfig.url}/recipe/$id"));

      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        Recipe recipe = Recipe.fromJson(decoded["Recipe"]);
        if (decoded["Ingredients"] != null) {
          recipe.ingredients = List<Ingredient>.from(decoded["Ingredients"].map((r) => Ingredient.fromJson(r)));
        }
        return recipe;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Response?> createRecipe(Recipe recipe) async {
    try {
      Response response = await http.post(
        Uri.parse("${AppConfig.url}/recipe"),
        headers: headers,
        body: json.encode(recipe),
      );
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
