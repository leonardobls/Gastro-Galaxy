import 'package:flutter/material.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({
    super.key,
  });

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
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
          "Ingredients Page",
        ),
      ),
      body: Container(),
    );
  }
}
