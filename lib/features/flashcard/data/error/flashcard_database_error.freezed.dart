// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_database_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlashcardDatabaseError {
  String get message => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardDatabaseErrorCopyWith<FlashcardDatabaseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardDatabaseErrorCopyWith<$Res> {
  factory $FlashcardDatabaseErrorCopyWith(FlashcardDatabaseError value,
          $Res Function(FlashcardDatabaseError) then) =
      _$FlashcardDatabaseErrorCopyWithImpl<$Res, FlashcardDatabaseError>;
  @useResult
  $Res call({String message, String details});
}

/// @nodoc
class _$FlashcardDatabaseErrorCopyWithImpl<$Res,
        $Val extends FlashcardDatabaseError>
    implements $FlashcardDatabaseErrorCopyWith<$Res> {
  _$FlashcardDatabaseErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlashcardDatabaseErrorCopyWith<$Res>
    implements $FlashcardDatabaseErrorCopyWith<$Res> {
  factory _$$_FlashcardDatabaseErrorCopyWith(_$_FlashcardDatabaseError value,
          $Res Function(_$_FlashcardDatabaseError) then) =
      __$$_FlashcardDatabaseErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String details});
}

/// @nodoc
class __$$_FlashcardDatabaseErrorCopyWithImpl<$Res>
    extends _$FlashcardDatabaseErrorCopyWithImpl<$Res,
        _$_FlashcardDatabaseError>
    implements _$$_FlashcardDatabaseErrorCopyWith<$Res> {
  __$$_FlashcardDatabaseErrorCopyWithImpl(_$_FlashcardDatabaseError _value,
      $Res Function(_$_FlashcardDatabaseError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = null,
  }) {
    return _then(_$_FlashcardDatabaseError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FlashcardDatabaseError implements _FlashcardDatabaseError {
  const _$_FlashcardDatabaseError(
      {required this.message, required this.details});

  @override
  final String message;
  @override
  final String details;

  @override
  String toString() {
    return 'FlashcardDatabaseError(message: $message, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlashcardDatabaseError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardDatabaseErrorCopyWith<_$_FlashcardDatabaseError> get copyWith =>
      __$$_FlashcardDatabaseErrorCopyWithImpl<_$_FlashcardDatabaseError>(
          this, _$identity);
}

abstract class _FlashcardDatabaseError implements FlashcardDatabaseError {
  const factory _FlashcardDatabaseError(
      {required final String message,
      required final String details}) = _$_FlashcardDatabaseError;

  @override
  String get message;
  @override
  String get details;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardDatabaseErrorCopyWith<_$_FlashcardDatabaseError> get copyWith =>
      throw _privateConstructorUsedError;
}
