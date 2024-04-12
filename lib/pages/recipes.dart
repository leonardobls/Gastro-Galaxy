import 'package:flutter/material.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Recipes Page",
        ),
      ),
      body: Container(),
    );
  }
}
