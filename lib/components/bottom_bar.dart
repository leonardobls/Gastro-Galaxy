import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/pages/menu.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.secondaryColor,
          border: const Border(
            top: BorderSide(
              color: Color(0xFFd9d9d9),
            ),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 80,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name != "/") {
                      Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/home.svg",
                        width: 30,
                        height: 30,
                        color: ModalRoute.of(context)!.settings.name == "/" ? AppStyles.primaryColor : Colors.white,
                      ),
                      Text(
                        "HOME",
                        style: TextStyle(
                          color: ModalRoute.of(context)!.settings.name == "/" ? AppStyles.primaryColor : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name != "/ingredients") {
                      Navigator.pushNamed(
                        context,
                        '/ingredients',
                      );
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/ingredientes.svg",
                        width: 30,
                        height: 30,
                        color: ModalRoute.of(context)!.settings.name == "/ingredients" ? AppStyles.primaryColor : Colors.white,
                      ),
                      Text(
                        "INGREDIENTES",
                        style: TextStyle(
                          color: ModalRoute.of(context)!.settings.name == "/ingredients" ? AppStyles.primaryColor : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name != "/recipes") {
                      Navigator.pushNamed(
                        context,
                        '/recipes',
                      );
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/receitas.svg",
                        width: 30,
                        height: 30,
                        color: ModalRoute.of(context)!.settings.name == "/recipes" ? AppStyles.primaryColor : Colors.white,
                      ),
                      Text(
                        "RECEITAS",
                        style: TextStyle(
                          color: ModalRoute.of(context)!.settings.name == "/recipes" ? AppStyles.primaryColor : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => const Menu(),
                        transitionDuration: const Duration(milliseconds: 200),
                        reverseTransitionDuration: const Duration(milliseconds: 200),
                        transitionsBuilder: (context, animation1, animation2, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0), // Da direita para a esquerda
                              end: Offset.zero,
                            ).animate(animation1),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/menu.svg",
                        width: 30,
                        height: 30,
                        color: ModalRoute.of(context)!.settings.name == "/menu" ? AppStyles.primaryColor : Colors.white,
                      ),
                      Text(
                        "MENU",
                        style: TextStyle(
                          color: ModalRoute.of(context)!.settings.name == "/menu" ? AppStyles.primaryColor : Colors.white,
                          fontWeight: FontWeight.bold,
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
