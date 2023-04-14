import 'package:flashcards/features/new_flashcard/new_flashcard_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NewFlashcardScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const NewFlashcardScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text(
              'This page doesn\'t exist'
            ),
          )
        )
      );
  }
}