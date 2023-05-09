import 'package:flashcards/core/data/error/failure.dart';
import 'package:flashcards/features/flashcard/data/datasource/flashcard_database.dart';
import 'package:flashcards/features/flashcard/data/error/flashcard_database_error.dart';
import 'package:flashcards/features/flashcard/data/mapper/flashcard_mapper.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/domain/repository/flashcard_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class FlashcardRepoImpl implements FlashcardRepo {
  final FlashcardDatabase db;

  const FlashcardRepoImpl(this.db);

  @override
  Future<Either<Failure, void>> createFlashcard(final String front, final String back) async {
    final flashcard = Flashcard(
      front: front,
      back: back,
    );
    try {
      await db.put(FlashcardMapper.transformFromEntityToJson(flashcard));
      return Either.right(null);
    } on FlashcardDatabaseError catch (e) {
      debugPrint(e.toString());
      return Either.left(const Failure());
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteFlashcard(final int id) async {
    try {
      await db.delete(id);
      return Either.right(null);
    } on FlashcardDatabaseError catch (e) {
      debugPrint(e.toString());
      return Either.left(const Failure());
    }
  }
  
  @override
  Future<Either<Failure, void>> updateFlashcard(final String front, final String back) async {
    final flashcard = Flashcard(
      front: front,
      back: back,
    );
    try {
      await db.update(FlashcardMapper.transformFromEntityToJson(flashcard));
      return Either.right(null);
    } on FlashcardDatabaseError catch (e) {
      debugPrint(e.toString());
      return Either.left(const Failure());
    }
  }
}