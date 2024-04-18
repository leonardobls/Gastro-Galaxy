import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';

class Menu extends StatefulWidget {
  const Menu({
    super.key,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppStyles.primaryColor,
        title: const Text(
          "MENU",
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
                  InkWell(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                            "assets/icons/profile.svg",
                            width: 30,
                            height: 30,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Meu Perfil",
                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppStyles.primaryColor,
                  ),
                  InkWell(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                            "assets/icons/contact.svg",
                            width: 30,
                            height: 30,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Entre em Contato",
                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppStyles.primaryColor,
                  ),
                  InkWell(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                            "assets/icons/info.svg",
                            width: 30,
                            height: 30,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Sobre Nós",
                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppStyles.primaryColor,
                  ),
                  InkWell(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                            "assets/icons/logout.svg",
                            width: 30,
                            height: 30,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Sair do App",
                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppStyles.primaryColor,
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
