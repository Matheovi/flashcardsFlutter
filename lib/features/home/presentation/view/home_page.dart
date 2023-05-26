import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/presentation/view/flashcard_forms_list_page.dart';
import 'package:flashcards/features/home/presentation/widget/deck_view.dart';
import 'package:flashcards/features/training/presentation/view/training_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TrainingScreen();
    // return Scaffold(
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           DeckView(
    //             children: List.generate(
    //                 10,
    //                 (index) => Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: GestureDetector(
    //                         onTap: () => navigateToBrowseDeckScreen(
    //                             context, 'Dummy ${index + 1}'),
    //                         child: Card(
    //                           child: Center(child: Text('Dummy ${index + 1}')),
    //                         ),
    //                       ),
    //                     )),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () => navigateToNewDeckScreen(context),
    //     backgroundColor: Colors.green,
    //     child: const Icon(Icons.add),
    //   ),
    // );(use-package yasnippet
  }

  /// Navigates to existing deck screen.
  void navigateToBrowseDeckScreen(BuildContext context, final String title) {
    var args = {
      'title': title,
      'flashcards': const [
        Flashcard(
          frontText: 'FrontTest',
          backText: 'BackTest',
        )
      ],
    };
    Navigator.pushNamed(context, FlashcardFormsListPage.routeName,
        arguments: args);
  }

  /// Navigates to 'New deck' screen.
  void navigateToNewDeckScreen(BuildContext context) {
    var args = {
      'title': 'New deck',
    };
    Navigator.pushNamed(context, FlashcardFormsListPage.routeName,
        arguments: args);
  }
}
