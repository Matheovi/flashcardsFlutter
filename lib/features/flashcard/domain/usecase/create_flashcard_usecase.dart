import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';

abstract class CreateFlashcardUsecase {
  Future<Flashcard> execute(final String front, final String back);
}