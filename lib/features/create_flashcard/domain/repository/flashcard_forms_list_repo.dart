import 'package:flashcards/features/create_flashcard/domain/entity/flashcard.dart';

abstract class FlashcardFormsListRepo {
  Future<Flashcard> createFlashcard(final String front, final String back);
}