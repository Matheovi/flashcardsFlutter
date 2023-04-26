import 'package:flashcards/features/database/database.dart';
import 'package:flashcards/features/home/entity/flashcard_entity.dart';
import 'package:flashcards/features/home/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final flashcardRepositoryProvider = Provider(
      (ref) => FlashcardRepository(
        FlashcardDatabase()
  ),
);

class FlashcardRepository {
  final FlashcardDatabase database;

  const FlashcardRepository(this.database);

  Future<List<Flashcard>> getFlashcardList() async {
    FlashcardListEntity flashcards = await database.allFlashcards();
    List<Flashcard> flashcardsObjects = [];
    for (var element in flashcards) {
      flashcardsObjects.add(Flashcard.fromMap(element));
    }
    return flashcardsObjects;
  }
}
