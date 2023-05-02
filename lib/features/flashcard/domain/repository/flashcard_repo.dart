import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';

abstract class FlashcardRepo {
  Future<Flashcard> createFlashcard(final String front, final String back);
  Future<void> deleteFlashcard(final int id);
  Future<void> updateFlashcard(final String front, final String back);
}