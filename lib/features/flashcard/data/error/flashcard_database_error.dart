import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_database_error.freezed.dart';

@freezed
class FlashcardDatabaseError extends Exception with _$FlashcardDatabaseError  {
  const factory FlashcardDatabaseError({
    required String message,
    required String details,
  }) = _FlashcardDatabaseError;
}