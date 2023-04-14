import 'package:flashcards/features/home/widgets/deck_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DeckView(
                children: List.generate(
                  10, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Center(
                        child: Text('Dummy ${index + 1}')
                      ),
                    ),
                  )
                ),
              ),
            ],
          ), 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}