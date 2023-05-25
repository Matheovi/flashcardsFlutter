import 'package:flutter/material.dart';

class TrainingFlashcard extends StatefulWidget {
  final String? frontText;
  final String? backText;

  const TrainingFlashcard(
    BuildContext context, {
    super.key,
    required this.frontText,
    required this.backText,
  });

  State<TrainingFlashcard> createState() => _TrainingFlashcardState();
}

class _TrainingFlashcardState extends State<TrainingFlashcard> {
  bool backShown = false;
  String? textShown;

  @override
  void initState() {
    super.initState();
    textShown = widget.frontText;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            backShown = true;
            textShown = widget.backText;
          });
        },
        child: Dismissible(
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              debugPrint("Learned!!!!!");
            }
            if (direction == DismissDirection.endToStart) {
              debugPrint("NotLearned :(:(:(:(");
            }
          },
          key: UniqueKey(),
          child: Card(
              child: Center(
                  child: Text(
            textShown!,
          ))),
        ));
  }
}
