import 'package:flashcards/features/flashcard/domain/repository/flashcard_repo.dart';
import 'package:flashcards/features/flashcard/domain/usecase/create_flashcard_usecase.dart';

class CreateFlashcardUsecaseImpl implements CreateFlashcardUsecase {
  final FlashcardRepo _repo;

  const CreateFlashcardUsecaseImpl(this._repo);

  @override
  Future<void> execute(final String front, final String back) {
    return _repo.createFlashcard(front, back);
  }
}