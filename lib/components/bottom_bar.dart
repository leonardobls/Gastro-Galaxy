import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFd9d9d9),
            ),
          ),
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/home.svg",
                    width: 30,
                    height: 30,
                  ),
                  const Text(
                    "HOME",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/ingredients');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/ingredientes.svg",
                    width: 30,
                    height: 30,
                  ),
                  const Text(
                    "INGREDIENTES",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/recipes');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/receitas.svg",
                    width: 30,
                    height: 30,
                  ),
                  const Text(
                    "RECEITAS",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
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
