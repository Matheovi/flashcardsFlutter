import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:flashcards/features/flashcard/presentation/viewmodel/flashcard_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flashcardFormViewModelStateNotifierProvider = Provider.autoDispose.family<FlashcardFormViewModel, Flashcard?>(
  (ref, flashcard) => FlashcardFormViewModel(flashcard, ref.watch(flashcardListViewModelStateNotifierProvider.notifier))
);

class FlashcardFormViewModel {
  final FlashcardListViewModel _flashcardListViewModel;
  late List<bool> selectedDecksOrder;

  FlashcardFormViewModel(final Flashcard? flashcard, this._flashcardListViewModel) {
    selectedDecksOrder = List.filled(5, false);
  }
}