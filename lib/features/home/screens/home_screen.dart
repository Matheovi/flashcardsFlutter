import 'package:flashcards/features/home/controllers/home_controller.dart';
import 'package:flashcards/features/home/widgets/deck_view.dart';
import 'package:flashcards/features/new_flashcard/screens/new_flashcard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/model.dart';



class HomeScreen extends ConsumerWidget{


  const HomeScreen({super.key});
  void navigateToNewFlashcardScreen(BuildContext context) {
    Navigator.pushNamed(context, NewFlashcardScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DeckView(
                children: FutureBuilder<List<Widget>>(
              future: generateChildren(ref.read(flashcardControllerProvider).flashcards()),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                    return Card(child: Center(
                                 child: Text('Dummy ${index + 1}')
                               ),);
                  },

          )

                // children: List.generate(
                //   10, (index) => Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Card(
                //       child: Center(
                //         child: Text('Dummy ${index + 1}')
                //       ),
                //     ),
                //   )
                // ),
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


  Future<List<Widget>> generateChildren(List<Flashcard> flashcards)async{
    List<Widget> children = [];
    for(var item in flashcards){
      children.add(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Center(
                  child: Text("${item.frontPage} \n ${item.backPage}")
                ),
              ),
      )
      );
    }
    return children;
  }
}