// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slide_categorie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlideCategorieModel _$SlideCategorieModelFromJson(Map<String, dynamic> json) {
  return _SlideCategorieModel.fromJson(json);
}

/// @nodoc
mixin _$SlideCategorieModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'name_kh')
  String? get nameKh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlideCategorieModelCopyWith<SlideCategorieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlideCategorieModelCopyWith<$Res> {
  factory $SlideCategorieModelCopyWith(
          SlideCategorieModel value, $Res Function(SlideCategorieModel) then) =
      _$SlideCategorieModelCopyWithImpl<$Res, SlideCategorieModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? icon,
      @JsonKey(name: 'name_kh') String? nameKh});
}

/// @nodoc
class _$SlideCategorieModelCopyWithImpl<$Res, $Val extends SlideCategorieModel>
    implements $SlideCategorieModelCopyWith<$Res> {
  _$SlideCategorieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? nameKh = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKh: freezed == nameKh
          ? _value.nameKh
          : nameKh // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlideCategorieModelCopyWith<$Res>
    implements $SlideCategorieModelCopyWith<$Res> {
  factory _$$_SlideCategorieModelCopyWith(_$_SlideCategorieModel value,
          $Res Function(_$_SlideCategorieModel) then) =
      __$$_SlideCategorieModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? icon,
      @JsonKey(name: 'name_kh') String? nameKh});
}

/// @nodoc
class __$$_SlideCategorieModelCopyWithImpl<$Res>
    extends _$SlideCategorieModelCopyWithImpl<$Res, _$_SlideCategorieModel>
    implements _$$_SlideCategorieModelCopyWith<$Res> {
  __$$_SlideCategorieModelCopyWithImpl(_$_SlideCategorieModel _value,
      $Res Function(_$_SlideCategorieModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? nameKh = freezed,
  }) {
    return _then(_$_SlideCategorieModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKh: freezed == nameKh
          ? _value.nameKh
          : nameKh // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SlideCategorieModel implements _SlideCategorieModel {
  const _$_SlideCategorieModel(
      {this.id, this.name, this.icon, @JsonKey(name: 'name_kh') this.nameKh});

  factory _$_SlideCategorieModel.fromJson(Map<String, dynamic> json) =>
      _$$_SlideCategorieModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name_kh')
  final String? nameKh;

  @override
  String toString() {
    return 'SlideCategorieModel(id: $id, name: $name, icon: $icon, nameKh: $nameKh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlideCategorieModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.nameKh, nameKh) || other.nameKh == nameKh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon, nameKh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlideCategorieModelCopyWith<_$_SlideCategorieModel> get copyWith =>
      __$$_SlideCategorieModelCopyWithImpl<_$_SlideCategorieModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlideCategorieModelToJson(
      this,
    );
  }
}

abstract class _SlideCategorieModel implements SlideCategorieModel {
  const factory _SlideCategorieModel(
      {final int? id,
      final String? name,
      final String? icon,
      @JsonKey(name: 'name_kh') final String? nameKh}) = _$_SlideCategorieModel;

  factory _SlideCategorieModel.fromJson(Map<String, dynamic> json) =
      _$_SlideCategorieModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get icon;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name_kh')
  String? get nameKh;
  @override
  @JsonKey(ignore: true)
  _$$_SlideCategorieModelCopyWith<_$_SlideCategorieModel> get copyWith =>
      throw _privateConstructorUsedError;
}
