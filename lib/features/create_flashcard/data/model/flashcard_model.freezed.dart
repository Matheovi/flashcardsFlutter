// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlashcardModel _$FlashcardModelFromJson(Map<String, dynamic> json) {
  return _FlashcardModel.fromJson(json);
}

/// @nodoc
mixin _$FlashcardModel {
  int get id => throw _privateConstructorUsedError;
  String get front => throw _privateConstructorUsedError;
  String get back => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashcardModelCopyWith<FlashcardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardModelCopyWith<$Res> {
  factory $FlashcardModelCopyWith(
          FlashcardModel value, $Res Function(FlashcardModel) then) =
      _$FlashcardModelCopyWithImpl<$Res, FlashcardModel>;
  @useResult
  $Res call({int id, String front, String back});
}

/// @nodoc
class _$FlashcardModelCopyWithImpl<$Res, $Val extends FlashcardModel>
    implements $FlashcardModelCopyWith<$Res> {
  _$FlashcardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? front = null,
    Object? back = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_FlashcardModelCopyWith<$Res>
    implements $FlashcardModelCopyWith<$Res> {
  factory _$$_FlashcardModelCopyWith(
          _$_FlashcardModel value, $Res Function(_$_FlashcardModel) then) =
      __$$_FlashcardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String front, String back});
}

/// @nodoc
class __$$_FlashcardModelCopyWithImpl<$Res>
    extends _$FlashcardModelCopyWithImpl<$Res, _$_FlashcardModel>
    implements _$$_FlashcardModelCopyWith<$Res> {
  __$$_FlashcardModelCopyWithImpl(
      _$_FlashcardModel _value, $Res Function(_$_FlashcardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? front = null,
    Object? back = null,
  }) {
    return _then(_$_FlashcardModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
@JsonSerializable()
class _$_FlashcardModel extends _FlashcardModel {
  const _$_FlashcardModel(
      {required this.id, required this.front, required this.back})
      : super._();

  factory _$_FlashcardModel.fromJson(Map<String, dynamic> json) =>
      _$$_FlashcardModelFromJson(json);

  @override
  final int id;
  @override
  final String front;
  @override
  final String back;

  @override
  String toString() {
    return 'FlashcardModel(id: $id, front: $front, back: $back)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlashcardModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, front, back);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardModelCopyWith<_$_FlashcardModel> get copyWith =>
      __$$_FlashcardModelCopyWithImpl<_$_FlashcardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlashcardModelToJson(
      this,
    );
  }
}

abstract class _FlashcardModel extends FlashcardModel {
  const factory _FlashcardModel(
      {required final int id,
      required final String front,
      required final String back}) = _$_FlashcardModel;
  const _FlashcardModel._() : super._();

  factory _FlashcardModel.fromJson(Map<String, dynamic> json) =
      _$_FlashcardModel.fromJson;

  @override
  int get id;
  @override
  String get front;
  @override
  String get back;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardModelCopyWith<_$_FlashcardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
