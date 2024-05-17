import 'dart:convert';
import 'dart:developer';

import 'package:gastro_galaxy/config/app_config.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecipeService {
  Map<String, String> headers = {'Content-Type': 'application/json'};

  // Future<Ingredient> getIngredient(int id) async {
  //   var response = http.get(Uri.parse(AppConfig.url + "/get-ingredient"));
  // }

  Future<Response?> createRecipe(Recipe recipe) async {
    try {
      Response response = await http.post(
        Uri.parse("${AppConfig.url}recipe"),
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
