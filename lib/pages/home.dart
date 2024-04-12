import 'package:flutter/material.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: Container(),
    );
  }
}
