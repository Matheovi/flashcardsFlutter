import 'package:flashcards/features/new_flashcard/widgets/new_flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemCountProvider = StateProvider<int>((ref) => 1);

class NewFlashcardScreen extends ConsumerWidget {
  static const String routeName = '/new-flashcard';

  NewFlashcardScreen({super.key});

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
              itemCount: ref.watch(itemCountProvider) + 1,
              itemBuilder: (context, index) {
                //if last index
                if (index == ref.read(itemCountProvider)) {
                  return IconButton(
                    onPressed: () {
                      ref
                          .read(itemCountProvider.notifier)
                          .update((state) => state + 1);
                    },
                    icon: Icon(Icons.add_circle),
                    color: Colors.green,
                  );
                }
                return const NewFlashcard();
              },
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(itemCountProvider.notifier)
                            .update((state) => 1);
                        navigateBack(context);
                      },
                      child: const Text('Done')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
