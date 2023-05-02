import 'package:flashcards/features/flashcard/presentation/view/flashcard_forms_list_page.dart';
import 'package:flashcards/features/home/presentation/widget/deck_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void navigateToNewFlashcardScreen(BuildContext context) {
    Navigator.pushNamed(context, FlashcardFormsListPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DeckView(
                children: List.generate(
                  10, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Center(
                        child: Text('Dummy ${index + 1}')
                      ),
                    ),
                  )
                ),
              ),
            ],
          ), 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToNewFlashcardScreen(context),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}