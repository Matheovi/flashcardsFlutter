import 'package:flashcards/features/flashcard/domain/repository/flashcard_repo.dart';
import 'package:flashcards/features/flashcard/domain/usecase/update_flashcard_usecase.dart';

class UpdateFlashcardUsecaseImpl implements UpdateFlashcardUsecase {
  final FlashcardRepo _repo;

  const UpdateFlashcardUsecaseImpl(this._repo);

  @override
  Future<void> execute(final String front, final String back) {
    return _repo.updateFlashcard(front, back);
  }
}