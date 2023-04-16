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
