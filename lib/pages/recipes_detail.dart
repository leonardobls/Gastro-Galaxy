import 'package:flutter/material.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/stores/recipe_store.dart';

class RecipesDetail extends StatefulWidget {
  final int id;

  const RecipesDetail({
    super.key,
    required this.id,
  });

  @override
  State<RecipesDetail> createState() => _RecipesDetailState();
}

class _RecipesDetailState extends State<RecipesDetail> {
  final RecipeStore recipeStore = RecipeStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4f4f4f),
      bottomNavigationBar: const BottomBar(),
      body: FutureBuilder(
        future: recipeStore.load(widget.id),
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    color: const Color(0xFF4f4f4f),
                  ),
                  Stack(
                    children: [
                      snapshot.data!.url != null && snapshot.data!.url!.isNotEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: double.infinity,
                              child: Image.network(
                                snapshot.data!.url ?? "",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: double.infinity,
                              child: Image.asset(
                                "assets/images/default.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 0.9],
                            colors: [
                              Colors.transparent,
                              Color(0xFF4f4f4f),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              snapshot.data!.name ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ingredientes",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.ingredients != null ? snapshot.data!.ingredients!.length : 0,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      color: AppStyles.primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data!.ingredients![index].name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!.ingredients![index].isAvailable ? "Disponível" : "Em Falta",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 60),
                          child: Text(
                            snapshot.data!.longDescription ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
