import 'package:flashcards/features/flashcard/data/model/flashcard_model.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';

abstract class FlashcardDb {
  Future<FlashcardModel> insert(final Flashcard entity);
  //Future<void> update(final Map<String, dynamic> entity);
  //Future<void> delete(final int id);
}