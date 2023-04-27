import 'package:flashcards/features/new_flashcard/screens/new_flashcard_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NewFlashcardScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => NewFlashcardScreen(),
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