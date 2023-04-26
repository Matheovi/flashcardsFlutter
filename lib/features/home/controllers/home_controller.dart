import "package:flashcards/features/home/models/model.dart";
import "package:flashcards/features/home/repositories/flashcard_repository.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


final flashcardControllerProvider = Provider((ref){
  final flashcardRepository = ref.watch(flashcardRepositoryProvider);
  return FlashcardController(
    flashcardRepository: flashcardRepository,
    ref: ref,
  );
});



class FlashcardController {
  final FlashcardRepository flashcardRepository;
  final ProviderRef ref;

  FlashcardController({
    required this.flashcardRepository,
    required this.ref
});

  Future<List<Flashcard>> flashcards() async{
    var flashcards = await flashcardRepository.getFlashcardList();
    return flashcards;
  }
}