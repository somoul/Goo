// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SearchTypeRentModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchTypeRentModel _$SearchTypeRentModelFromJson(Map<String, dynamic> json) {
  return _SearchTypeRentModel.fromJson(json);
}

/// @nodoc
mixin _$SearchTypeRentModel {
  int? get id => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;
  int? get num => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchTypeRentModelCopyWith<SearchTypeRentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTypeRentModelCopyWith<$Res> {
  factory $SearchTypeRentModelCopyWith(
          SearchTypeRentModel value, $Res Function(SearchTypeRentModel) then) =
      _$SearchTypeRentModelCopyWithImpl<$Res, SearchTypeRentModel>;
  @useResult
  $Res call({int? id, String? keyword, int? num});
}

/// @nodoc
class _$SearchTypeRentModelCopyWithImpl<$Res, $Val extends SearchTypeRentModel>
    implements $SearchTypeRentModelCopyWith<$Res> {
  _$SearchTypeRentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? keyword = freezed,
    Object? num = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      num: freezed == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchTypeRentModelCopyWith<$Res>
    implements $SearchTypeRentModelCopyWith<$Res> {
  factory _$$_SearchTypeRentModelCopyWith(_$_SearchTypeRentModel value,
          $Res Function(_$_SearchTypeRentModel) then) =
      __$$_SearchTypeRentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? keyword, int? num});
}

/// @nodoc
class __$$_SearchTypeRentModelCopyWithImpl<$Res>
    extends _$SearchTypeRentModelCopyWithImpl<$Res, _$_SearchTypeRentModel>
    implements _$$_SearchTypeRentModelCopyWith<$Res> {
  __$$_SearchTypeRentModelCopyWithImpl(_$_SearchTypeRentModel _value,
      $Res Function(_$_SearchTypeRentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? keyword = freezed,
    Object? num = freezed,
  }) {
    return _then(_$_SearchTypeRentModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      num: freezed == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SearchTypeRentModel implements _SearchTypeRentModel {
  const _$_SearchTypeRentModel({this.id, this.keyword, this.num});

  factory _$_SearchTypeRentModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchTypeRentModelFromJson(json);

  @override
  final int? id;
  @override
  final String? keyword;
  @override
  final int? num;

  @override
  String toString() {
    return 'SearchTypeRentModel(id: $id, keyword: $keyword, num: $num)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchTypeRentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.num, num) || other.num == num));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, keyword, num);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchTypeRentModelCopyWith<_$_SearchTypeRentModel> get copyWith =>
      __$$_SearchTypeRentModelCopyWithImpl<_$_SearchTypeRentModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchTypeRentModelToJson(
      this,
    );
  }
}

abstract class _SearchTypeRentModel implements SearchTypeRentModel {
  const factory _SearchTypeRentModel(
      {final int? id,
      final String? keyword,
      final int? num}) = _$_SearchTypeRentModel;

  factory _SearchTypeRentModel.fromJson(Map<String, dynamic> json) =
      _$_SearchTypeRentModel.fromJson;

  @override
  int? get id;
  @override
  String? get keyword;
  @override
  int? get num;
  @override
  @JsonKey(ignore: true)
  _$$_SearchTypeRentModelCopyWith<_$_SearchTypeRentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
