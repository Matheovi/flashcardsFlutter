import 'package:flutter/material.dart';
import 'dart:math';

class TrainingFlashcard extends StatefulWidget {
  final String frontText;
  final String backText;

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
  double angle = 0;
  late String textShown;

  @override
  void initState() {
    super.initState();
    textShown = widget.frontText;
  }

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: angle),
        duration: Duration(milliseconds: 500),
        builder: (BuildContext context, double val, _) {
          if (val >= (pi / 2)) {
            backShown = true;
          } else {
            backShown = false;
          }
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(val),
            child: GestureDetector(
                onTap: () {
                  _flip();
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
                  child: backShown ? buildBackCard() : buildFrontCard(),
                )),
          );
        });
  }

  Card buildFrontCard() {
    return Card(
        child: Center(
            child: Text(
      widget.frontText,
    )));
  }

  Transform buildBackCard() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateY(pi),
      child: Card(
          child: Center(
              child: Text(
        widget.backText,
      ))),
    );
  }
}
