import 'package:flashcards/features/create_flashcard/presentation/view/flashcard_forms_list_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case FlashcardFormsListPage.routeName:
      return MaterialPageRoute(
        builder: (context) => FlashcardFormsListPage(),
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