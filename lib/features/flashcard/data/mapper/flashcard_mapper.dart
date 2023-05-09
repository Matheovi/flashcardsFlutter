import 'package:flashcards/features/flashcard/data/model/flashcard_model.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';

class FlashcardMapper {
  static FlashcardModel transformFromJsonToModel(Map<String, dynamic> json) {
    return FlashcardModel(
      id: json['id'],
      front: json['front'],
      back: json['back'],
    );
  }

  static Map<String, dynamic> transformFromEntityToJson(Flashcard entity) {
    return {
      'front': entity.front,
      'back': entity.back,
    };
  }
}