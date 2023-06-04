import 'package:flutter/material.dart';
import 'dart:math';

class InteractiveTrainingFlashcard extends StatefulWidget {
  final String frontText;
  final String backText;

  const InteractiveTrainingFlashcard(
    BuildContext context, {
    super.key,
    required this.frontText,
    required this.backText,
  });

  @override
  State<InteractiveTrainingFlashcard> createState() =>
      _InteractiveTrainingFlashcardState();
}

class _InteractiveTrainingFlashcardState
    extends State<InteractiveTrainingFlashcard> {
  bool backShown = false;
  double angle = 0;
  late String textShown;

  double percentCorrectness = 0;
  String? textToVerify;

  double positionY = 0;

  @override
  void initState() {
    super.initState();
    textShown = widget.frontText;
  }

  void _flip() async {
    int correctness = await widget.backText.levenshteinDistance(textToVerify!);
    int bigger = max(widget.backText.length, textToVerify!.length);
    percentCorrectness = ((bigger - correctness) / bigger) * 100;
    debugPrint("${percentCorrectness * 100} % correctness");
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: angle),
        //TODO: give the user the ability to set the rotation time
        duration: const Duration(milliseconds: 500),
        builder: (BuildContext context, double val, _) {
          if (val >= (pi / 2)) {
            backShown = true;
          } else {
            backShown = false;
          }
          return Dismissible(
            direction: DismissDirection.down,
            key: UniqueKey(),
            onDismissed: (direction) {},
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(val),
              child: GestureDetector(
                  onTap: () {
                    _flip();
                  },
                  child: Container(
                    key: UniqueKey(),
                    child: backShown ? buildBackCard() : buildFrontCard(),
                  )),
            ),
          );
        });
  }

  Card buildFrontCard() {
    return Card(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        widget.frontText,
      ),
      TextField(
          onChanged: (text) {
            textToVerify = text;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter correct',
          ))
    ])));
  }

  Transform buildBackCard() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          widget.backText,
        ),
        Text("Correctness: $percentCorrectness %"),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  //TODO: Ni mom pojęcia jak z tego poziomu wywalić zaliczoną fiszke (Riverpod perhaps???)
                },
                child: const Text('DONE'),
              ),
            ),
          ),
        )
      ])),
    );
  }
}

extension on String {
  String get tail {
    return substring(1);
  }
}

/// Computes the minimum number of single-character edits (insertions, deletions or substitutions)
/// required to change the [str1] into the [str2]
Future<int> levenshteinDistance(String str1, String str2) async {
  return str1.levenshteinDistance(str2);
}

extension StringMatcher on String {
  /// Computes the minimum number of single-character edits (insertions, deletions or substitutions)
  /// required to change the current String into the [other]
  Future<int> levenshteinDistance(String other) async {
    if (isEmpty) return other.length;
    if (other.isEmpty) return length;
    if (this[0] == other[0]) return tail.levenshteinDistance(other.tail);
    return 1 +
        (await Future.wait(<Future<int>>[
          levenshteinDistance(other.tail),
          tail.levenshteinDistance(other),
          tail.levenshteinDistance(other.tail),
        ]))
            .reduce(min);
  }
}
