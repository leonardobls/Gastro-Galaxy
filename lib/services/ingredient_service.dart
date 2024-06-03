import 'dart:convert';
import 'dart:developer';

import 'package:gastro_galaxy/config/app_config.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class IngredientService {
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<List<Ingredient>?> getIngredients() async {
    try {
      var response = await http.get(Uri.parse("${AppConfig.url}/ingredients"));

      if (response.statusCode == 200) {
        var decodedList = json.decode(response.body) as List;
        List<Ingredient> ingredients = List<Ingredient>.from(decodedList.map((r) => Ingredient.fromJson(r)));
        return ingredients;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Response?> createIngredient(Ingredient ingredient) async {
    try {
      Response response = await http.post(
        Uri.parse("${AppConfig.url}/ingredient"),
        headers: headers,
        body: json.encode(ingredient),
      );
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
