import 'package:flutter/material.dart';

class NewFlashcardScreen extends StatelessWidget {
  static const String routeName = '/new-flashcard';

  const NewFlashcardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'NewFlashcardScreen'
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}