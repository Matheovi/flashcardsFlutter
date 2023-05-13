import 'package:flashcards/core/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class FlashcardRepo {
  Future<Either<Failure, void>> createFlashcard(final String front, final String back);
  Future<Either<Failure, void>> deleteFlashcard(final int id);
  Future<Either<Failure, void>> updateFlashcard(final String front, final String back);
}