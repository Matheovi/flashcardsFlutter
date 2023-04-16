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
      body: Center(
        child: Padding(
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
                      onPressed: () => {},
                      child: const Text('Add to decks'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{navigateBack(context)},
        backgroundColor: Colors.blue,
        child: const Center(
          child: Icon(Icons.arrow_right_sharp, size: 40,),
        ),
      ),
    );
  }
}
