import 'package:flashcards/features/flashcard/presentation/view/flashcard_forms_list_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case FlashcardFormsListPage.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      final title = args['title'];
      final flashcards = args['flashcards'];
      return MaterialPageRoute(
        builder: (context) => FlashcardFormsListPage(
          title: title,
          flashcards: flashcards,
        ),
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