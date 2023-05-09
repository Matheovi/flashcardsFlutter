import 'package:flashcards/features/flashcard/data/providers.dart';
import 'package:flashcards/features/flashcard/domain/usecase/create_flashcard_usecase.dart';
import 'package:flashcards/features/flashcard/domain/usecase/create_flashcard_usecase_impl.dart';
import 'package:flashcards/features/flashcard/domain/usecase/delete_flashcard_usecase.dart';
import 'package:flashcards/features/flashcard/domain/usecase/delete_flashcard_usecase_impl.dart';
import 'package:flashcards/features/flashcard/domain/usecase/update_flashcard_usecase.dart';
import 'package:flashcards/features/flashcard/domain/usecase/update_flashcard_usecase_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createFlashcardUsecaseProvider = Provider<CreateFlashcardUsecase>(
  (ref) => CreateFlashcardUsecaseImpl(ref.watch(flashcardRepoProvider))
);

final deleteFlashcardUsecaseProvider = Provider<DeleteFlashcardUsecase>(
  (ref) => DeleteFlashcardUsecaseImpl(ref.watch(flashcardRepoProvider))
);

final updateFlashcardUsecaseProvider = Provider<UpdateFlashcardUsecase>(
  (ref) => UpdateFlashcardUsecaseImpl(ref.watch(flashcardRepoProvider))
);