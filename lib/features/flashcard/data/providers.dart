import 'package:flashcards/features/flashcard/data/datasource/flashcard_db.dart';
import 'package:flashcards/features/flashcard/data/datasource/flashcard_sqflite_impl.dart';
import 'package:flashcards/features/flashcard/data/repository/flashcard_repo_impl.dart';
import 'package:flashcards/features/flashcard/domain/repository/flashcard_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flashcardDbProvider = Provider<FlashcardDb>((_) => FlashcardSqfliteImpl());
final flashcardFormsListRepoProvider = Provider<FlashcardRepo>((ref) => FlashcardRepoImpl(ref.watch(flashcardDbProvider)));