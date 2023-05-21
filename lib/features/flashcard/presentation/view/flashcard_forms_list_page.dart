import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/presentation/viewmodel/flashcard_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlashcardFormsListPage extends ConsumerStatefulWidget {
  static const String routeName = '/flashcards';

  final String title;
  final List<Flashcard>? flashcards;

  const FlashcardFormsListPage({
    super.key,
    required this.title,
    this.flashcards,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FlashcardFormsListPageState();
}

class _FlashcardFormsListPageState extends ConsumerState<FlashcardFormsListPage> {
  final _flashcardListProvider = flashcardListViewModelStateNotifierProvider;

  _FlashcardFormsListPageState();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await _checkForUnsavedProgress(ref, context),
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(widget.title),
                    // background: ??
                  ),
                  actions: widget.flashcards != null ? _buildAppBarActionButtons(context) : [],
                ),
                if (widget.flashcards != null)
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        // START TRAINING
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: const Text('Start training'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // hack? put the IconButton at the end of the ListView instead of a flashcard form
                      if (index == ref.read(_flashcardListProvider).length) {
                        return _buildFlashcardAddButton(context, ref);
                      } else {
                        return _buildFlashcardFormWidget(context, ref, index);
                      }
                    },
                    // required by hack above
                    childCount: ref.watch(_flashcardListProvider).length + 1, 
                  ),
                ),
              ],
            ),
            // TODO: make this button show up on scroll down and disappear on scroll up
            _buildDoneButton(context, ref),
          ]
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
        builder: (context) => _buildWillOnPopAlertDialog(context)
      );
    } else {
      // dismiss.
      return true;
    }
  }

  /// Helper method for building the will on pop alert dialog.
  Widget _buildWillOnPopAlertDialog(BuildContext context) {
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

  List<Widget> _buildAppBarActionButtons(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.share),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
      ),
    ];
  }

  /// Helper method for building the 'Done' button.
  Widget _buildDoneButton(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('DONE'),
          ),
        ),
      ),
    );
  }

  /// Builds the add button for adding new flashcard.
  Widget _buildFlashcardAddButton(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: IconButton(
        onPressed: () {
          ref.read(_flashcardListProvider.notifier).appendEmpty();
        },
        icon: const Icon(Icons.add_circle),
        color: Colors.green,
      ),
    );
  }

  /// Builds single flashcard form widget.
  Widget _buildFlashcardFormWidget(BuildContext context, WidgetRef ref, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 4.0),
              child: Column(
                children: [
                  TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Front Text'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 4.0, right: 16.0, bottom: 24.0),
              child: Column(
                children: [
                  TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Back Text'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
