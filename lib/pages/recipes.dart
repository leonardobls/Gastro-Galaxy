// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/db/database.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/pages/recipes_detail.dart';

class Recipes extends StatefulWidget {
  const Recipes({
    super.key,
  });

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  GlobalKey<FormState> recipesFormKey = GlobalKey<FormState>();
  TextEditingController recipesNameController = TextEditingController();
  TextEditingController recipesDescriptionController = TextEditingController();
  TextEditingController recipesImageController = TextEditingController();
  bool isChecked = false;

  var bdHelper = Repository();
  final List<Recipe> _recipes = [];

  void insertRecipe(Recipe recipe, List<int> ingredientsIdList) async {
    Map<String, dynamic> row = {
      "name": recipe.name,
      "description": recipe.description,
      "imageUrl": recipe.imageUrl,
      "cId": recipe.cId,
    };
    var recipeId = await bdHelper.insertRecipe(row);

    for (var ingredientId in ingredientsIdList) {
      await bdHelper.linkIngredientToRecipe(ingredientId, recipeId);
    }

    getAllRecipes();
  }

  void getAllRecipes() async {
    var recipeResponse = await bdHelper.getAllRecipes();
    setState(() {
      _recipes.clear();
      _recipes.addAll(recipeResponse);
    });
  }

  void editRecipe(Recipe recipe, List<int> ingredientsIdList) async {
    Map<String, dynamic> row = {
      "id": recipe.id,
      "name": recipe.name,
      "description": recipe.description,
      "imageUrl": recipe.imageUrl,
    };

    var recipeId = await bdHelper.updateRecipe(row);

    await bdHelper.removeAllRecipesIngredientsRelated(recipe.id!);

    for (var ingredientId in ingredientsIdList) {
      await bdHelper.linkIngredientToRecipe(ingredientId, recipeId);
    }

    getAllRecipes();
  }

  void removeRecipe(int recipeId, List<int> ingredientsIdList) async {
    await bdHelper.removeAllRecipesIngredientsRelated(recipeId);
    await bdHelper.deleteRecipe(recipeId);

    getAllRecipes();
  }

  void cleanRecipeForm() {
    recipesNameController.clear();
    recipesDescriptionController.clear();
    recipesImageController.clear();
    isChecked = false;
  }

  @override
  void initState() {
    super.initState();
    getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppStyles.primaryColor,
        title: Row(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  "RECEITAS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   useRootNavigator: true,
                //   shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(20),
                //       topRight: Radius.circular(20),
                //     ),
                //   ),
                //   backgroundColor: AppStyles.primaryColor,
                //   builder: (BuildContext context) {
                //     return editModal(null);
                //   },
                // );
              },
              child: SvgPicture.asset(
                "assets/icons/add.svg",
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: AppStyles.primaryColor,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: _recipes.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _recipes.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                // height: 120,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RecipesDetail(id: _recipes[index].id!),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                                        child: SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Image.network(
                                            _recipes[index].imageUrl,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RecipesDetail(id: _recipes[index].id!),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _recipes[index].name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _recipes[index].description,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          useRootNavigator: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          backgroundColor: AppStyles.primaryColor,
                                          builder: (BuildContext context) {
                                            return editModal(_recipes[index]);
                                          },
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        "assets/icons/edit.svg",
                                        width: 25,
                                        height: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: AppStyles.primaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text("Nenhuma receita foi cadastrada."),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget editModal(Recipe? existingRecipe) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        if (existingRecipe != null) {
          setState(() {
            recipesNameController.text = existingRecipe.name;
            recipesDescriptionController.text = existingRecipe.description;
            recipesImageController.text = existingRecipe.imageUrl;
          });
        } else {
          cleanRecipeForm();
        }
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 50,
                  ),
                  child: Text(
                    existingRecipe != null ? "Editar Receita" : "Adicionar Receita",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  key: recipesFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nome da Receita",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: recipesNameController,
                          cursorColor: Colors.white,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Insira o nome do ingrediente",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, .4),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 0,
                              height: 0,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Descrição Curta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: recipesDescriptionController,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            hintText: "Insira a quantidade no estoque",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, .4),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 0,
                              height: 0,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Imagem",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: recipesImageController,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            hintText: "Insira a url da imagem",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, .4),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 0,
                              height: 0,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (existingRecipe == null) {
                                  //TODO
                                  insertRecipe(Recipe(name: "teste", description: "teste", imageUrl: "https://i.postimg.cc/rmCrg2jW/images-5.jpg", cId: 1), [1, 2, 3]);
                                } else {
                                  //TODO
                                  editRecipe(Recipe(name: "teste", description: "teste", imageUrl: "https://i.postimg.cc/rmCrg2jW/images-5.jpg", cId: 1), [1, 2, 3]);
                                }
                                //TODO
                                // cleanIngredientForm();
                                Navigator.pop(context);
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(200),
                                ),
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                  child: const Text(
                                    "SALVAR",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (existingRecipe != null)
                              InkWell(
                                onTap: () {
                                  removeRecipe(existingRecipe.id!, [1, 2, 3]);
                                  cleanRecipeForm();
                                  Navigator.pop(context);
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(200),
                                  ),
                                  child: Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                    child: const Text(
                                      "DELETAR",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
