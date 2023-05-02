import 'package:flashcards/features/flashcard/data/model/flashcard_model.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';

abstract class FlashcardDb {
  Future<FlashcardModel> put(final Flashcard entity);
  Future<void> update(final Map<String, dynamic> json);
  Future<void> delete(final int id);
}