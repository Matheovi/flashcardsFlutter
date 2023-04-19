import 'package:flashcards/features/new_flashcard/widgets/multi_select_bottom_sheet.dart';
import 'package:flutter/material.dart';

class NewFlashcard extends StatelessWidget {
  const NewFlashcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Front Page",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Back Page",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Decks:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dummy 1, Dummy 2, Dummy 3',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => showMultiSelectBottomSheet(
                    context: context
                  ),
                  child: const Text('Add to decks'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
