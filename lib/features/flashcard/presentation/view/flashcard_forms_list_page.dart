import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/presentation/viewmodel/flashcard_list_viewmodel.dart';
import 'package:flashcards/features/flashcard/presentation/widget/multi_select_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlashcardFormsListPage extends ConsumerWidget {
  static const String routeName = '/new-flashcard';

  final _flashcardListProvider =
      flashcardListViewModelStateNotifierProvider;

  FlashcardFormsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => await _checkForUnsavedProgress(ref, context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              // If there's only 1 flashcard, then put it in a column instead of ListView.
              // This is done in order to center vertically the only flashcard on the screen.
              if (1 == ref.read(_flashcardListProvider).length)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFlashcardFormWidget(context, ref, 0),
                      _buildFlashcardAddButton(context, ref),
                    ],
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: ref.watch(_flashcardListProvider).length + 1, // required by hack below
                    itemBuilder: (context, index) {
                      // hack? put the IconButton at the end of the ListView instead of a flashcard form
                      if (index == ref.read(_flashcardListProvider).length) {
                        return _buildFlashcardAddButton(context, ref);
                      } else {
                        return _buildFlashcardFormWidget(context, ref, index);
                      }
                    },
                  )
                )
              ,
              _buildDoneButton(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  /// Checks if any [Flashcard] has non-empty field and if so, shows an [AlertDialog]
  /// and asks whether pop the [FlashcardFormsListPage] of the screen or not.
  Future<bool> _checkForUnsavedProgress(WidgetRef ref, BuildContext context) async {
    bool isAnyFieldNotEmpty = false;
    for (var flashcard in ref.read(_flashcardListProvider)) {
      if (flashcard.frontText.trim().isNotEmpty || flashcard.backText.trim().isNotEmpty) {
        isAnyFieldNotEmpty = true;
      }
    }
    if (isAnyFieldNotEmpty) {
      // unsaved progress, proceed?
      return await showDialog(
        context: context,
        builder: (context) => _buildWillOnPopAlertDialog(context, ref)
      );
    } else {
      // dismiss.
      return true;
    }
  }

  /// Helper method for building the will on pop alert dialog.
  Widget _buildWillOnPopAlertDialog(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('You have unsaved progress'),
      content: const Text('Do you really want to quit?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Yes'),
        ),
      ],
    );
  }

  /// Helper method for building the 'Done' button.
  Widget _buildDoneButton(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done')),
        ),
      ),
    );
  }

  /// Builds the add button for adding new flashcard.
  Widget _buildFlashcardAddButton(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(_flashcardListProvider.notifier).add("", "");
      },
      icon: const Icon(Icons.add_circle),
      color: Colors.green,
    );
  }

  /// Builds single flashcard form widget.
  Widget _buildFlashcardFormWidget(BuildContext context, WidgetRef ref, int index) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                    onChanged: (text) {
                      ref
                          .read(_flashcardListProvider.notifier)
                          .updateAt(index, frontText: text);
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: ref
                        .read(_flashcardListProvider)
                        [index]
                        .frontText,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Front Text",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (text) {
                    ref
                        .read(_flashcardListProvider.notifier)
                        .updateAt(index, backText: text);
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  initialValue: ref
                      .read(_flashcardListProvider)
                      [index]
                      .backText,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Back Text",
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
                    onPressed: () => _showDecksSelection(context, ref, index),
                    child: const Text('Select decks'),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  /// Helper method for showing [MultiSelectBottomSheet] in order to select flashcard's decks.
  void _showDecksSelection(BuildContext context, WidgetRef ref, int index) async {
    return await showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const MultiSelectBottomSheet(
          items: [
            "Apple",
            "Banana",
            "Orange",
            "Watermelon",
          ]
        );
      }
    );
  }
}
