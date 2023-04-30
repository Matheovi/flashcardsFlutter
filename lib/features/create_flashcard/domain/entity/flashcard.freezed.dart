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
  String get front => throw _privateConstructorUsedError;
  String get back => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardCopyWith<Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardCopyWith<$Res> {
  factory $FlashcardCopyWith(Flashcard value, $Res Function(Flashcard) then) =
      _$FlashcardCopyWithImpl<$Res, Flashcard>;
  @useResult
  $Res call({String front, String back});
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
    Object? front = null,
    Object? back = null,
  }) {
    return _then(_value.copyWith(
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
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
  $Res call({String front, String back});
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
    Object? front = null,
    Object? back = null,
  }) {
    return _then(_$_Flashcard(
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Flashcard implements _Flashcard {
  const _$_Flashcard({required this.front, required this.back});

  @override
  final String front;
  @override
  final String back;

  @override
  String toString() {
    return 'Flashcard(front: $front, back: $back)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Flashcard &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back));
  }

  @override
  int get hashCode => Object.hash(runtimeType, front, back);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      __$$_FlashcardCopyWithImpl<_$_Flashcard>(this, _$identity);
}

abstract class _Flashcard implements Flashcard {
  const factory _Flashcard(
      {required final String front, required final String back}) = _$_Flashcard;

  @override
  String get front;
  @override
  String get back;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}
