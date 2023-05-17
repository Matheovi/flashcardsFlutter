// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Flashcard {
  String get frontText => throw _privateConstructorUsedError;
  String get backText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardCopyWith<Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardCopyWith<$Res> {
  factory $FlashcardCopyWith(Flashcard value, $Res Function(Flashcard) then) =
      _$FlashcardCopyWithImpl<$Res, Flashcard>;
  @useResult
  $Res call({String frontText, String backText});
}

/// @nodoc
class _$FlashcardCopyWithImpl<$Res, $Val extends Flashcard>
    implements $FlashcardCopyWith<$Res> {
  _$FlashcardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontText = null,
    Object? backText = null,
  }) {
    return _then(_value.copyWith(
      frontText: null == frontText
          ? _value.frontText
          : frontText // ignore: cast_nullable_to_non_nullable
              as String,
      backText: null == backText
          ? _value.backText
          : backText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlashcardCopyWith<$Res> implements $FlashcardCopyWith<$Res> {
  factory _$$_FlashcardCopyWith(
          _$_Flashcard value, $Res Function(_$_Flashcard) then) =
      __$$_FlashcardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String frontText, String backText});
}

/// @nodoc
class __$$_FlashcardCopyWithImpl<$Res>
    extends _$FlashcardCopyWithImpl<$Res, _$_Flashcard>
    implements _$$_FlashcardCopyWith<$Res> {
  __$$_FlashcardCopyWithImpl(
      _$_Flashcard _value, $Res Function(_$_Flashcard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontText = null,
    Object? backText = null,
  }) {
    return _then(_$_Flashcard(
      frontText: null == frontText
          ? _value.frontText
          : frontText // ignore: cast_nullable_to_non_nullable
              as String,
      backText: null == backText
          ? _value.backText
          : backText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Flashcard implements _Flashcard {
  const _$_Flashcard({required this.frontText, required this.backText});

  @override
  final String frontText;
  @override
  final String backText;

  @override
  String toString() {
    return 'Flashcard(frontText: $frontText, backText: $backText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Flashcard &&
            (identical(other.frontText, frontText) ||
                other.frontText == frontText) &&
            (identical(other.backText, backText) ||
                other.backText == backText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, frontText, backText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      __$$_FlashcardCopyWithImpl<_$_Flashcard>(this, _$identity);
}

abstract class _Flashcard implements Flashcard {
  const factory _Flashcard(
      {required final String frontText,
      required final String backText}) = _$_Flashcard;

  @override
  String get frontText;
  @override
  String get backText;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}
