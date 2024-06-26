import 'package:flutter/material.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/services/ingredient_service.dart';
import 'package:http/http.dart';

class IngredientStore {
  final IngredientService _service = IngredientService();

  GlobalKey<FormState> ingredientFormKey = GlobalKey<FormState>();
  TextEditingController ingredientNameController = TextEditingController();
  TextEditingController ingredientQuantityController = TextEditingController();
  TextEditingController ingredientImageController = TextEditingController();
  bool isChecked = false;
  bool isLoading = false;
  late List<Ingredient>? ingredients = [];

  bool isAdding = false;

  Future<List<Ingredient>?> load() async {
    isLoading = true;
    ingredients = await _service.getIngredients();
    isLoading = false;

    return ingredients;
  }

  Future<bool> insertIngredient(Ingredient ingredient) async {
    try {
      Response? response = await _service.createIngredient(
        Ingredient(
          name: ingredientNameController.text,
          amount: ingredientQuantityController.text,
          imageUrl: ingredientImageController.text,
          isAvailable: isChecked,
        ),
      );

      if (response != null && response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> editIngredient(Ingredient ingredient) async {
    // try {
    //   Response? response = await _service.editIngredient(
    //     Ingredient(
    //       name: ingredientNameController.text,
    //       amount: ingredientQuantityController.text,
    //       imageUrl: ingredientImageController.text,
    //       isAvailable: isChecked,
    //     ),
    //   );

    //   if (response != null && response.statusCode == 200) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } catch (e) {
    //   return false;
    // }
  }

  Future removeIngredient(int ingredientId) async {
    // return await _service.deleteIngredient(ingredientId);
  }

  Future<void> cleanIngredientForm() async {
    ingredientNameController.clear();
    ingredientQuantityController.clear();
    ingredientImageController.clear();
    isChecked = false;
  }
}
