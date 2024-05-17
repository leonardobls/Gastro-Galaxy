import 'package:flutter/material.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/services/recipe_service.dart';
import 'package:http/http.dart';

class RecipeStore {
  final RecipeService _service = RecipeService();

  GlobalKey<FormState> recipesFormKey = GlobalKey<FormState>();
  TextEditingController recipesNameController = TextEditingController();
  TextEditingController recipesDescriptionController = TextEditingController();
  TextEditingController recipesImageController = TextEditingController();
  final List<Recipe> recipes = [];

  bool isAdding = false;

  Future<bool> insertRecipe() async {
    try {
      Response? response = await _service.createRecipe(
        Recipe(
          name: recipesNameController.text,
          description: recipesDescriptionController.text,
          url: recipesImageController.text,
          categoryId: 1,
        ),
      );

      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
