import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Represents any feature failure.
@freezed
class Failure with _$Failure {
  const factory Failure(
  ) = _Failure;
}