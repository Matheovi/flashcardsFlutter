import 'package:flashcards/features/flashcard/domain/repository/flashcard_repo.dart';
import 'package:flashcards/features/flashcard/domain/usecase/delete_flashcard_usecase.dart';

class DeleteFlashcardUsecaseImpl implements DeleteFlashcardUsecase {
  final FlashcardRepo _repo;

  const DeleteFlashcardUsecaseImpl(this._repo);

  @override
  Future<void> execute(final int id) {
    return _repo.deleteFlashcard(id);
  }
}