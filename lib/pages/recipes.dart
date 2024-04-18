import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';

class Recipes extends StatefulWidget {
  const Recipes({
    super.key,
  });

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppStyles.primaryColor,
        title: const Text(
          "RECEITAS",
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/recipes/{slug}');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/hamburguer.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receita Deliciosa da Vovó",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sabe aquela receita que somente as vovós sabem fazer? Aprenda agora a como preparar!"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
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
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/pizza.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receita Deliciosa da Vovó",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sabe aquela receita que somente as vovós sabem fazer? Aprenda agora a como preparar!"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
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
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/peixe.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receita Deliciosa da Vovó",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sabe aquela receita que somente as vovós sabem fazer? Aprenda agora a como preparar!"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
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
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/carne.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receita Deliciosa da Vovó",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sabe aquela receita que somente as vovós sabem fazer? Aprenda agora a como preparar!"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
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
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/sobremesa.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receita Deliciosa da Vovó",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sabe aquela receita que somente as vovós sabem fazer? Aprenda agora a como preparar!"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
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
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/hamburguer.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receita Deliciosa da Vovó",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sabe aquela receita que somente as vovós sabem fazer? Aprenda agora a como preparar!"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
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
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      // height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/hamburguer.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receita Deliciosa da Vovó",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sabe aquela receita que somente as vovós sabem fazer? Aprenda agora a como preparar!"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            width: 25,
                            height: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
