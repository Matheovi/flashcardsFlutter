import 'package:flashcards/features/flashcard/presentation/widget/multi_select_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemCountProvider = StateProvider<int>((ref) => 1);

class FlashcardFormsListPage extends ConsumerWidget {
  static const String routeName = '/new-flashcard';

  FlashcardFormsListPage({super.key});

  Widget _buildFlashcardCardWidget(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                //controller: widget._frontTextController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Front",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                //controller: widget._backTextController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Back",
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
                  child: const Text('Select decks'),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buildFlashcardFormsListWidget(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
      itemCount: ref.watch(itemCountProvider) + 1,
      itemBuilder: (context, index) {
        // put IconButton at the end of ListView instead of NewFlashcard
        if (index == ref.read(itemCountProvider)) {
          return IconButton(
            onPressed: () {
              ref
                  .read(itemCountProvider.notifier)
                  .update((state) => state + 1);
            },
            icon: const Icon(Icons.add_circle),
            color: Colors.green,
          );
        }
        return _buildFlashcardCardWidget(context, ref);
      },
    ));
  }

  Widget _buildDoneButton(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => {},
              //   ref
              //       .read(itemCountProvider.notifier)
              //       .update((state) => 1);
              //   navigateBack(context);
              // },
              child: const Text('Done')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildFlashcardFormsListWidget(context, ref),
            _buildDoneButton(context, ref),
          ],
        ),
      ),
    );
  }
}
