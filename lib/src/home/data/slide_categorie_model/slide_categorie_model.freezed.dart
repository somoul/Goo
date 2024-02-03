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
  set id(int? value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get name_kh => throw _privateConstructorUsedError;
  set name_kh(String? value) => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  set icon(String? value) => throw _privateConstructorUsedError;
  List<FieldModel>? get field => throw _privateConstructorUsedError;
  set field(List<FieldModel>? value) => throw _privateConstructorUsedError;

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
      String? name_kh,
      String? icon,
      List<FieldModel>? field});
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
    Object? name_kh = freezed,
    Object? icon = freezed,
    Object? field = freezed,
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
      name_kh: freezed == name_kh
          ? _value.name_kh
          : name_kh // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as List<FieldModel>?,
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
      String? name_kh,
      String? icon,
      List<FieldModel>? field});
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
    Object? name_kh = freezed,
    Object? icon = freezed,
    Object? field = freezed,
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
      name_kh: freezed == name_kh
          ? _value.name_kh
          : name_kh // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as List<FieldModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SlideCategorieModel extends _SlideCategorieModel {
  _$_SlideCategorieModel(
      {this.id, this.name, this.name_kh, this.icon, this.field})
      : super._();

  factory _$_SlideCategorieModel.fromJson(Map<String, dynamic> json) =>
      _$$_SlideCategorieModelFromJson(json);

  @override
  int? id;
  @override
  String? name;
  @override
  String? name_kh;
  @override
  String? icon;
  @override
  List<FieldModel>? field;

  @override
  String toString() {
    return 'SlideCategorieModel(id: $id, name: $name, name_kh: $name_kh, icon: $icon, field: $field)';
  }

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

abstract class _SlideCategorieModel extends SlideCategorieModel {
  factory _SlideCategorieModel(
      {int? id,
      String? name,
      String? name_kh,
      String? icon,
      List<FieldModel>? field}) = _$_SlideCategorieModel;
  _SlideCategorieModel._() : super._();

  factory _SlideCategorieModel.fromJson(Map<String, dynamic> json) =
      _$_SlideCategorieModel.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  String? get name;
  set name(String? value);
  @override
  String? get name_kh;
  set name_kh(String? value);
  @override
  String? get icon;
  set icon(String? value);
  @override
  List<FieldModel>? get field;
  set field(List<FieldModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$_SlideCategorieModelCopyWith<_$_SlideCategorieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldModel _$FieldModelFromJson(Map<String, dynamic> json) {
  return _FieldModel.fromJson(json);
}

/// @nodoc
mixin _$FieldModel {
  Object? get controller => throw _privateConstructorUsedError;
  set controller(Object? value) =>
      throw _privateConstructorUsedError; //TextEditingCotroller
  String? get inputTypes =>
      throw _privateConstructorUsedError; //TextEditingCotroller
  set inputTypes(String? value) => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  set format(String? value) => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  set label(String? value) => throw _privateConstructorUsedError;
  String? get label_kh => throw _privateConstructorUsedError;
  set label_kh(String? value) => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  set hint(String? value) => throw _privateConstructorUsedError;
  String? get hint_kh => throw _privateConstructorUsedError;
  set hint_kh(String? value) => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  set required(bool value) => throw _privateConstructorUsedError;
  List<FieldModel>? get field => throw _privateConstructorUsedError;
  set field(List<FieldModel>? value) => throw _privateConstructorUsedError;

  /// Check local
  int get maxLines => throw _privateConstructorUsedError;

  /// Check local
  set maxLines(int value) => throw _privateConstructorUsedError;
  bool get isDisplay => throw _privateConstructorUsedError;
  set isDisplay(bool value) => throw _privateConstructorUsedError;
  bool get isSelect => throw _privateConstructorUsedError;
  set isSelect(bool value) => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  set value(dynamic value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldModelCopyWith<FieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldModelCopyWith<$Res> {
  factory $FieldModelCopyWith(
          FieldModel value, $Res Function(FieldModel) then) =
      _$FieldModelCopyWithImpl<$Res, FieldModel>;
  @useResult
  $Res call(
      {Object? controller,
      String? inputTypes,
      String? format,
      String? label,
      String? label_kh,
      String? hint,
      String? hint_kh,
      bool required,
      List<FieldModel>? field,
      int maxLines,
      bool isDisplay,
      bool isSelect,
      dynamic value});
}

/// @nodoc
class _$FieldModelCopyWithImpl<$Res, $Val extends FieldModel>
    implements $FieldModelCopyWith<$Res> {
  _$FieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? inputTypes = freezed,
    Object? format = freezed,
    Object? label = freezed,
    Object? label_kh = freezed,
    Object? hint = freezed,
    Object? hint_kh = freezed,
    Object? required = null,
    Object? field = freezed,
    Object? maxLines = null,
    Object? isDisplay = null,
    Object? isSelect = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller ? _value.controller : controller,
      inputTypes: freezed == inputTypes
          ? _value.inputTypes
          : inputTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      label_kh: freezed == label_kh
          ? _value.label_kh
          : label_kh // ignore: cast_nullable_to_non_nullable
              as String?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      hint_kh: freezed == hint_kh
          ? _value.hint_kh
          : hint_kh // ignore: cast_nullable_to_non_nullable
              as String?,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as List<FieldModel>?,
      maxLines: null == maxLines
          ? _value.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int,
      isDisplay: null == isDisplay
          ? _value.isDisplay
          : isDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelect: null == isSelect
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldModelCopyWith<$Res>
    implements $FieldModelCopyWith<$Res> {
  factory _$$_FieldModelCopyWith(
          _$_FieldModel value, $Res Function(_$_FieldModel) then) =
      __$$_FieldModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Object? controller,
      String? inputTypes,
      String? format,
      String? label,
      String? label_kh,
      String? hint,
      String? hint_kh,
      bool required,
      List<FieldModel>? field,
      int maxLines,
      bool isDisplay,
      bool isSelect,
      dynamic value});
}

/// @nodoc
class __$$_FieldModelCopyWithImpl<$Res>
    extends _$FieldModelCopyWithImpl<$Res, _$_FieldModel>
    implements _$$_FieldModelCopyWith<$Res> {
  __$$_FieldModelCopyWithImpl(
      _$_FieldModel _value, $Res Function(_$_FieldModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? inputTypes = freezed,
    Object? format = freezed,
    Object? label = freezed,
    Object? label_kh = freezed,
    Object? hint = freezed,
    Object? hint_kh = freezed,
    Object? required = null,
    Object? field = freezed,
    Object? maxLines = null,
    Object? isDisplay = null,
    Object? isSelect = null,
    Object? value = freezed,
  }) {
    return _then(_$_FieldModel(
      controller: freezed == controller ? _value.controller : controller,
      inputTypes: freezed == inputTypes
          ? _value.inputTypes
          : inputTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      label_kh: freezed == label_kh
          ? _value.label_kh
          : label_kh // ignore: cast_nullable_to_non_nullable
              as String?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      hint_kh: freezed == hint_kh
          ? _value.hint_kh
          : hint_kh // ignore: cast_nullable_to_non_nullable
              as String?,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as List<FieldModel>?,
      maxLines: null == maxLines
          ? _value.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int,
      isDisplay: null == isDisplay
          ? _value.isDisplay
          : isDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelect: null == isSelect
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FieldModel extends _FieldModel {
  _$_FieldModel(
      {this.controller,
      this.inputTypes,
      this.format,
      this.label,
      this.label_kh,
      this.hint,
      this.hint_kh,
      this.required = false,
      this.field = const [],
      this.maxLines = 1,
      this.isDisplay = true,
      this.isSelect = false,
      this.value})
      : super._();

  factory _$_FieldModel.fromJson(Map<String, dynamic> json) =>
      _$$_FieldModelFromJson(json);

  @override
  Object? controller;
//TextEditingCotroller
  @override
  String? inputTypes;
  @override
  String? format;
  @override
  String? label;
  @override
  String? label_kh;
  @override
  String? hint;
  @override
  String? hint_kh;
  @override
  @JsonKey()
  bool required;
  @override
  @JsonKey()
  List<FieldModel>? field;

  /// Check local
  @override
  @JsonKey()
  int maxLines;
  @override
  @JsonKey()
  bool isDisplay;
  @override
  @JsonKey()
  bool isSelect;
  @override
  dynamic value;

  @override
  String toString() {
    return 'FieldModel(controller: $controller, inputTypes: $inputTypes, format: $format, label: $label, label_kh: $label_kh, hint: $hint, hint_kh: $hint_kh, required: $required, field: $field, maxLines: $maxLines, isDisplay: $isDisplay, isSelect: $isSelect, value: $value)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldModelCopyWith<_$_FieldModel> get copyWith =>
      __$$_FieldModelCopyWithImpl<_$_FieldModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldModelToJson(
      this,
    );
  }
}

abstract class _FieldModel extends FieldModel {
  factory _FieldModel(
      {Object? controller,
      String? inputTypes,
      String? format,
      String? label,
      String? label_kh,
      String? hint,
      String? hint_kh,
      bool required,
      List<FieldModel>? field,
      int maxLines,
      bool isDisplay,
      bool isSelect,
      dynamic value}) = _$_FieldModel;
  _FieldModel._() : super._();

  factory _FieldModel.fromJson(Map<String, dynamic> json) =
      _$_FieldModel.fromJson;

  @override
  Object? get controller;
  set controller(Object? value);
  @override //TextEditingCotroller
  String? get inputTypes; //TextEditingCotroller
  set inputTypes(String? value);
  @override
  String? get format;
  set format(String? value);
  @override
  String? get label;
  set label(String? value);
  @override
  String? get label_kh;
  set label_kh(String? value);
  @override
  String? get hint;
  set hint(String? value);
  @override
  String? get hint_kh;
  set hint_kh(String? value);
  @override
  bool get required;
  set required(bool value);
  @override
  List<FieldModel>? get field;
  set field(List<FieldModel>? value);
  @override

  /// Check local
  int get maxLines;

  /// Check local
  set maxLines(int value);
  @override
  bool get isDisplay;
  set isDisplay(bool value);
  @override
  bool get isSelect;
  set isSelect(bool value);
  @override
  dynamic get value;
  set value(dynamic value);
  @override
  @JsonKey(ignore: true)
  _$$_FieldModelCopyWith<_$_FieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}
