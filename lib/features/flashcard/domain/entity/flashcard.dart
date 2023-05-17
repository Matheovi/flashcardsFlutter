import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard.freezed.dart';

@freezed
class Flashcard with _$Flashcard {
  const factory Flashcard({
    required String frontText,
    required String backText,
  }) = _Flashcard;
}