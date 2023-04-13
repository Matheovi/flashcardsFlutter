import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}