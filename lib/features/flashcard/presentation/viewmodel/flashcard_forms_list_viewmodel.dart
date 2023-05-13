import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/domain/usecase/create_flashcard_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flashcardFormsListViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<FlashcardFormsListViewModel, List<Flashcard>>(
  (ref) => FlashcardFormsListViewModel(

  )
);

class FlashcardFormsListViewModel extends StateNotifier<List<Flashcard>> {
  // final CreateFlashcardUsecase createFlashcardUsecase;

  FlashcardFormsListViewModel(
  //  this.createFlashcardUsecase
  ) : super([
    const Flashcard(front: "", back: "")
  ]);

  void commit() {
    for (final flashcard in state) {
      debugPrint("SAVING: $flashcard");
    }
  }

  List<Flashcard> getFlashcards() {
    return state;
  }

  void addFlashcard(String front, String back) {
    state = [...state, Flashcard(front: front, back: back)];
    debugPrint("LIST LENGTH: ${state.length}");
  }
  
  void updateFlashcard(int index, {String? front, String? back}) {
    debugPrint("updateFlashcard");
    state = [
      for (var i = 0; i < state.length; ++i)
        if (index == i)
          state[i].copyWith(
            front: front ?? state[i].front,
            back: back ?? state[i].back,
          )
        else
          state[i]
    ];
  }
}