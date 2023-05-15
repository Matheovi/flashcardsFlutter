import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/presentation/viewmodel/flashcard_forms_list_viewmodel.dart';
import 'package:flashcards/features/flashcard/presentation/widget/multi_select_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//final itemCountProvider = StateProvider<int>((ref) => 1);

class FlashcardFormsListPage extends ConsumerWidget {
  static const String routeName = '/new-flashcard';

  final _flashcardFormsListProvider =
      flashcardFormsListViewModelStateNotifierProvider;

  FlashcardFormsListPage({super.key});

  Widget _buildFlashcardFormWidget(
      BuildContext context, WidgetRef ref, int index) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                    onChanged: (text) {
                      ref
                          .read(_flashcardFormsListProvider.notifier)
                          .updateFlashcard(index, front: text);
                      debugPrint("${index.toString()} -- front $text");
                    },

                    //controller: widget._frontTextController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: ref
                        .read(_flashcardFormsListProvider.notifier)
                        .getFlashcards()[index]
                        .front,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Front",
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (text) {
                    ref
                        .read(_flashcardFormsListProvider.notifier)
                        .updateFlashcard(index, back: text);
                    debugPrint("${index.toString()} -- back $text");
                  },
                  //controller: widget._backTextController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  initialValue: ref
                      .read(_flashcardFormsListProvider.notifier)
                      .getFlashcards()[index]
                      .back,
                  decoration: InputDecoration(
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
                    onPressed: () =>
                        showMultiSelectBottomSheet(context: context),
                    child: const Text('Select decks'),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildFlashcardAddButton(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        var front = ref
            .read(_flashcardFormsListProvider.notifier)
            .getFlashcards()
            .last
            .front;

        var back = ref
            .read(_flashcardFormsListProvider.notifier)
            .getFlashcards()
            .last
            .back;

        if (front.trim().isEmpty || back.trim().isEmpty) {
          ref.read(_flashcardFormsListProvider.notifier).addFlashcard("", "");
        }
      },
      icon: const Icon(Icons.add_circle),
      color: Colors.green,
    );
  }

  Widget _buildFlashcardOneFormWidget(BuildContext context, WidgetRef ref,
      final List<Flashcard> flashcardList) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFlashcardFormWidget(context, ref, 0),
          _buildFlashcardAddButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildFlashcardFormsListWidget(BuildContext context, WidgetRef ref,
      final List<Flashcard> flashcardList) {
    return Expanded(
        child: ListView.builder(
      itemCount: ref.watch(_flashcardFormsListProvider).length + 1,
      itemBuilder: (context, index) {
        // put IconButton at the end of ListView instead of a Flashcard Form
        if (index == ref.read(_flashcardFormsListProvider).length) {
          return _buildFlashcardAddButton(context, ref);
        }
        return _buildFlashcardFormWidget(context, ref, index);
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
              onPressed: () => Navigator.pop(context),
              child: const Text('Done')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return await _canPopFormsPage(ref, context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              if (1 == ref.read(_flashcardFormsListProvider).length)
                _buildFlashcardOneFormWidget(
                    context, ref, ref.watch(_flashcardFormsListProvider))
              else
                _buildFlashcardFormsListWidget(
                    context, ref, ref.watch(_flashcardFormsListProvider)),
              // ref.watch(flashcardListProvider).maybeWhen(
              /*success: (flashcardList) =>*/
              // error: (_) => _buildErrorWidget()
              // loading: () => const Expanded(
              //   child: Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
              _buildDoneButton(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _canPopFormsPage(WidgetRef ref, BuildContext context) async {
    bool canPop = true;
    List<Flashcard> flashcards =
        ref.read(_flashcardFormsListProvider.notifier).getFlashcards();
    for (var flashcard in flashcards) {
      if (flashcard.front.trim().isNotEmpty ||
          flashcard.back.trim().isNotEmpty) {
        canPop = false;
      }
    }
    if (!canPop) {
      return await showDialog(
          context: context,
          builder: (context) => _buildWillOnPopAlertDialog(context, ref));
    } else {
      return true;
    }
  }

  Widget _buildWillOnPopAlertDialog(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('You have unsaved flashcards'),
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
}
