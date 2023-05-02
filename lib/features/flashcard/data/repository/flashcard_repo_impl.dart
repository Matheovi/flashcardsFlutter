import 'package:flashcards/features/flashcard/data/datasource/flashcard_db.dart';
import 'package:flashcards/features/flashcard/data/mapper/flashcard_mapper.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/domain/repository/flashcard_repo.dart';

class FlashcardRepoImpl implements FlashcardRepo {
  final FlashcardDb db;

  const FlashcardRepoImpl(this.db);

  @override
  Future<Flashcard> createFlashcard(final String front, final String back) async {
    final model = await db.put(Flashcard(
      front: front,
      back: back,
    ));
    return model.toEntity();
  }
  
  @override
  Future<void> deleteFlashcard(final int id) async {
    await db.delete(id);
  }
  
  @override
  Future<void> updateFlashcard(final String front, final String back) async {
    final flashcard = Flashcard(
      front: front,
      back: back,
    );
    await db.update(FlashcardMapper.transformToJson(flashcard));
  }
}