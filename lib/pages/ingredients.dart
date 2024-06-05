import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/stores/ingredient_store.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({
    super.key,
  });

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  final IngredientStore ingredientStore = IngredientStore();

  @override
  void initState() {
    super.initState();
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
                  "INGREDIENTES",
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
                    return editModal(null);
                  },
                );
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
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: FutureBuilder(
                future: ingredientStore.load(),
                builder: (buildContext, snapshot) => snapshot.hasData
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
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
                                return editModal(snapshot.data![index]);
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 130,
                                child: Stack(
                                  children: [
                                    Image.network(
                                      snapshot.data![index].imageUrl,
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
                                    SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data![index].name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data![index].amount,
                                            style: const TextStyle(
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
                          ),
                        ),
                      )
                    : CircularProgressIndicator(),
              ),
            )),
          ),
        ),
      ),
    );
  }

  Widget editModal(Ingredient? existingIngredient) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        if (existingIngredient != null) {
          setState(() {
            ingredientStore.ingredientNameController.text = existingIngredient.name;
            ingredientStore.ingredientQuantityController.text = existingIngredient.amount;
            ingredientStore.ingredientImageController.text = existingIngredient.imageUrl;
            ingredientStore.isChecked = existingIngredient.isAvailable;
          });
        }
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 50),
                  child: Text(
                    existingIngredient != null ? "Editar Ingrediente" : "Adicionar Ingrediente",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  key: ingredientStore.ingredientFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nome do Ingrediente",
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
                          controller: ingredientStore.ingredientNameController,
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
                          "Quantidade",
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
                          controller: ingredientStore.ingredientQuantityController,
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
                          controller: ingredientStore.ingredientImageController,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Este ingrediente está disponível?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Checkbox(
                              value: ingredientStore.isChecked,
                              side: const BorderSide(color: Colors.white),
                              onChanged: (newValue) {
                                setState(() {
                                  if (existingIngredient != null) {
                                    existingIngredient.isAvailable = newValue!;
                                  }

                                  ingredientStore.isChecked = newValue!;
                                });
                              },
                            )
                          ],
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
                                if (existingIngredient == null) {
                                  ingredientStore.insertIngredient(
                                    Ingredient(
                                      name: ingredientStore.ingredientNameController.text,
                                      amount: ingredientStore.ingredientQuantityController.text,
                                      imageUrl: ingredientStore.ingredientImageController.text,
                                      isAvailable: ingredientStore.isChecked,
                                    ),
                                  );
                                } else {
                                  ingredientStore.editIngredient(
                                    Ingredient(
                                      id: existingIngredient.id,
                                      name: ingredientStore.ingredientNameController.text,
                                      amount: ingredientStore.ingredientQuantityController.text,
                                      imageUrl: ingredientStore.ingredientImageController.text,
                                      isAvailable: ingredientStore.isChecked,
                                    ),
                                  );
                                }
                                ingredientStore.cleanIngredientForm();
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
                            if (existingIngredient != null)
                              InkWell(
                                onTap: () {
                                  ingredientStore.removeIngredient(
                                    Ingredient(
                                      id: existingIngredient.id,
                                      name: ingredientStore.ingredientNameController.text,
                                      amount: ingredientStore.ingredientQuantityController.text,
                                      imageUrl: ingredientStore.ingredientImageController.text,
                                      isAvailable: ingredientStore.isChecked,
                                    ),
                                  );
                                  ingredientStore.cleanIngredientForm();
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
