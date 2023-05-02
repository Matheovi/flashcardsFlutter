import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_model.freezed.dart';

@freezed
class FlashcardModel with _$FlashcardModel {
  const FlashcardModel._();

  const factory FlashcardModel({
    required int id,
    required String front,
    required String back,
  }) = _FlashcardModel;

  Flashcard toEntity() {
    return Flashcard(
      front: front,
      back: back,
    );
  }
}