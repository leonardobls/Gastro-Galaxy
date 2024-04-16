import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Image.asset(
          "assets/images/logo.png",
          width: 300,
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
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 0.85,
                  ),
                  items: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/banner-image.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.2,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: AppStyles.primaryColor,
                              ),
                            ),
                            Center(
                              child: Text(
                                "QUE TAL EXPERIMENTAR RECEITAS DELICIOSAS?",
                                style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(200),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            color: AppStyles.secondaryColor,
                            child: const Center(
                              child: Text(
                                "PIZZAS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(200),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            color: AppStyles.secondaryColor,
                            child: const Center(
                              child: Text(
                                "HAMBURGERS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(200),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            color: AppStyles.secondaryColor,
                            child: const Center(
                              child: Text(
                                "MASSAS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(200),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            color: AppStyles.secondaryColor,
                            child: const Center(
                              child: Text(
                                "BOLOS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(200),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            color: AppStyles.secondaryColor,
                            child: const Center(
                              child: Text(
                                "PIZZA",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(200),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            color: AppStyles.secondaryColor,
                            child: const Center(
                              child: Text(
                                "PIZZA",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.blue,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/receitas.png",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: AppStyles.primaryColor,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Receitas",
                              style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.blue,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/ingredientes.png",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: AppStyles.primaryColor,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Ingredientes",
                              style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
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
