import 'package:flashcards/features/flashcard/data/datasource/flashcard_database.dart';
import 'package:flashcards/features/flashcard/data/datasource/flashcard_database_impl.dart';
import 'package:flashcards/features/flashcard/data/repository/flashcard_repo_impl.dart';
import 'package:flashcards/features/flashcard/domain/repository/flashcard_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flashcardDatabaseProvider = Provider<FlashcardDatabase>((_) => FlashcardDatabaseImpl());
final flashcardRepoProvider = Provider<FlashcardRepo>((ref) => FlashcardRepoImpl(ref.watch(flashcardDatabaseProvider)));