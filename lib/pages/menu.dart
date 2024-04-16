import 'package:flutter/material.dart';
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
        backgroundColor: AppStyles.primaryColor,
        title: const Text("Menu"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(),
    );
  }
}
