import 'package:flashcards/features/new_flashcard/widgets/new_flashcard.dart';
import 'package:flutter/material.dart';

class NewFlashcardScreen extends StatelessWidget {
  static const String routeName = '/new-flashcard';

  const NewFlashcardScreen({super.key});

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: NewFlashcard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{navigateBack(context)},
        backgroundColor: Colors.blue,
        child: const Center(
          child: Icon(Icons.arrow_right_sharp, size: 40,),
        ),
      ),
    );
  }
}

