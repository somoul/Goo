// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PriceRangeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceRangeModel _$PriceRangeModelFromJson(Map<String, dynamic> json) {
  return _PriceRangeModel.fromJson(json);
}

/// @nodoc
mixin _$PriceRangeModel {
  String get min => throw _privateConstructorUsedError;
  String get max => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceRangeModelCopyWith<PriceRangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRangeModelCopyWith<$Res> {
  factory $PriceRangeModelCopyWith(
          PriceRangeModel value, $Res Function(PriceRangeModel) then) =
      _$PriceRangeModelCopyWithImpl<$Res, PriceRangeModel>;
  @useResult
  $Res call({String min, String max});
}

/// @nodoc
class _$PriceRangeModelCopyWithImpl<$Res, $Val extends PriceRangeModel>
    implements $PriceRangeModelCopyWith<$Res> {
  _$PriceRangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as String,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceRangeModelCopyWith<$Res>
    implements $PriceRangeModelCopyWith<$Res> {
  factory _$$_PriceRangeModelCopyWith(
          _$_PriceRangeModel value, $Res Function(_$_PriceRangeModel) then) =
      __$$_PriceRangeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String min, String max});
}

/// @nodoc
class __$$_PriceRangeModelCopyWithImpl<$Res>
    extends _$PriceRangeModelCopyWithImpl<$Res, _$_PriceRangeModel>
    implements _$$_PriceRangeModelCopyWith<$Res> {
  __$$_PriceRangeModelCopyWithImpl(
      _$_PriceRangeModel _value, $Res Function(_$_PriceRangeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$_PriceRangeModel(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as String,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PriceRangeModel implements _PriceRangeModel {
  const _$_PriceRangeModel({required this.min, required this.max});

  factory _$_PriceRangeModel.fromJson(Map<String, dynamic> json) =>
      _$$_PriceRangeModelFromJson(json);

  @override
  final String min;
  @override
  final String max;

  @override
  String toString() {
    return 'PriceRangeModel(min: $min, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceRangeModel &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceRangeModelCopyWith<_$_PriceRangeModel> get copyWith =>
      __$$_PriceRangeModelCopyWithImpl<_$_PriceRangeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceRangeModelToJson(
      this,
    );
  }
}

abstract class _PriceRangeModel implements PriceRangeModel {
  const factory _PriceRangeModel(
      {required final String min,
      required final String max}) = _$_PriceRangeModel;

  factory _PriceRangeModel.fromJson(Map<String, dynamic> json) =
      _$_PriceRangeModel.fromJson;

  @override
  String get min;
  @override
  String get max;
  @override
  @JsonKey(ignore: true)
  _$$_PriceRangeModelCopyWith<_$_PriceRangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
