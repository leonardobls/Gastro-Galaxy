import 'package:flutter/material.dart';

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
