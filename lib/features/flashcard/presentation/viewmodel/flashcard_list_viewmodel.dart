import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flashcardListViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<FlashcardListViewModel, List<Flashcard>>((ref) => FlashcardListViewModel());

class FlashcardListViewModel extends StateNotifier<List<Flashcard>> {
  // final CreateFlashcardUsecase createFlashcardUsecase;

  FlashcardListViewModel(
  //  this.createFlashcardUsecase
  ) : super([
    const Flashcard(
      frontText: "",
      backText: "",
    )
  ]);

  void commit() {
    throw UnimplementedError("TODO");
  }

  void add(String front, String back) {
    state = [
      ...state,
      Flashcard(
        frontText: front,
        backText: back
      )
    ];
  }

  void updateAt(int index, {String? frontText, String? backText}) {
    state = [
      for (var i = 0; i < state.length; ++i)
        if (index == i)
          state[i].copyWith(
            frontText: frontText ?? state[i].frontText,
            backText: backText ?? state[i].backText,
          )
        else
          state[i]
    ];
  }
}
