import 'package:flashcards/features/flashcard/data/error/flashcard_database_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class FlashcardDatabase {
  Future<Either<FlashcardDatabaseError, void>> put(final Map<String, dynamic> json);
  Future<Either<FlashcardDatabaseError, void>> delete(final int id);
  Future<Either<FlashcardDatabaseError, void>> update(final Map<String, dynamic> json);
}