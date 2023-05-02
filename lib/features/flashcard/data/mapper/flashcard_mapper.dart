import 'package:flashcards/features/flashcard/data/model/flashcard_model.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';

class FlashcardMapper {
  static FlashcardModel transformFromJson(Map<String, dynamic> json) {
    return FlashcardModel(
      id: json['id'],
      front: json['front'],
      back: json['back'],
    );
  }

  static Map<String, dynamic> transformToJson(Flashcard entity) {
    return {
      'id': null,
      'front': entity.front,
      'back': entity.back,
    };
  }
}