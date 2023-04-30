import 'package:flashcards/features/create_flashcard/data/datasource/flashcard_db.dart';
import 'package:flashcards/features/create_flashcard/data/model/flashcard_model.dart';
import 'package:flashcards/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/create_flashcard/domain/repository/flashcard_forms_list_repo.dart';

class FlashcardFormsListRepoImpl implements FlashcardFormsListRepo {
  final FlashcardDb db;

  const FlashcardFormsListRepoImpl(this.db);

  @override
  Future<Flashcard> createFlashcard(String front, String back) async {
    final model = await db.insert(Flashcard(
      front: front,
      back: back,
    ));
    return model.toEntity();
  }
}