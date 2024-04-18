import 'package:flutter/material.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/db/database.dart';
import 'package:gastro_galaxy/models/ingredient.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({
    super.key,
  });

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  var bdHelper = Repository();
  final List<Ingredient> _ingredients = [];

  void insertIngredient(Ingredient ingredient) async {
    var ingredientResponse = await bdHelper.insertIngredient(ingredient);
  }

  // void getAllIngredients(Ingredient ingredient) async {
  //   var ingredientResponse = await bdHelper.ingred(ingredient);
  //   setState(() {
  //     _ingredients.clear();
  //     _ingredients.addAll(ingredientResponse);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppStyles.primaryColor,
        title: const Text(
          "INGREDIENTES",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
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
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    children: [
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-arroz.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ARROZ",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "1 KG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-feijao.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "FEIJÃO",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "1 KG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-farinha.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "FARINHA",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "1 KG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-tomate.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "TOMATE",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "10 U",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-leite.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LEITE",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "5 L",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-pao.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "PÃO",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "10 U",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-queijo.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "QUEIJO",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "10 KG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/ing-massa.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "MASSAS",
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "10 U",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
