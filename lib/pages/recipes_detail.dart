import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';

class RecipesDetail extends StatefulWidget {
  const RecipesDetail({
    super.key,
  });

  @override
  State<RecipesDetail> createState() => _RecipesDetailState();
}

class _RecipesDetailState extends State<RecipesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4f4f4f),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF4f4f4f),
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/hamburguer.png",
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
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Receita\nDeliciosa\nda Vovó",
                        style: TextStyle(
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
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 60),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
