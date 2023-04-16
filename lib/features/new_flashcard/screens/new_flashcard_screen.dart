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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: NewFlashcard()
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => navigateBack(context),
                    child: const Text('Done')
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

