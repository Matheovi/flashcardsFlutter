import 'package:flutter/material.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/training/presentation/widget/training_flashcard.dart';

import '../widget/interactive_training_flashcard.dart';

class TrainingScreen extends StatefulWidget {
  TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final List<Flashcard> flashcards = [
    const Flashcard(frontText: "sumpcak", backText: "kejuhc"),
    const Flashcard(frontText: "pies", backText: "dog"),
    const Flashcard(frontText: "kot", backText: "cat"),
    const Flashcard(frontText: "szczur", backText: "rat"),
    const Flashcard(frontText: "kaczka", backText: "duck"),
    const Flashcard(frontText: "ziemniak", backText: "potato"),
    const Flashcard(frontText: "pomidor", backText: "tomato"),
  ];

  final List<bool> interactive = [true, false, true, false, true, false, true];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: GestureDetector(
          onTap: () {
            debugPrint(flashcards.last.frontText);
            setState(() {
              flashcards.shuffle();
            });
          },
          child: Center(
            child:
                SizedBox(height: 300, width: 200, child: _buildStack(context)),
          )),
    );
  }

//TODO: W zależności od typu fiszki, dać stosowny widget do listy
  Widget _buildStack(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: List<Widget>.generate(flashcards.length, (index) {
          if (interactive[index]) {
            return InteractiveTrainingFlashcard(
              context,
              index: index,
              frontText: flashcards[index].frontText,
              backText: flashcards[index].backText,
              onDelete: (index) {
                setState(() {
                  flashcards.removeAt(index);
                  interactive.removeAt(index);
                });
              },
            );
          } else {
            return TrainingFlashcard(
              context,
              index: index,
              frontText: flashcards[index].frontText,
              backText: flashcards[index].backText,
              onDelete: (index) {
                setState(() {
                  flashcards.removeAt(index);
                  interactive.removeAt(index);
                });
              },
            );
          }
        }));
  }
}
