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
  @JsonKey(name: 'field')
  List<ColumField>? get columField => throw _privateConstructorUsedError;
  @JsonKey(name: 'field')
  set columField(List<ColumField>? value) => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'field') List<ColumField>? columField});
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
    Object? columField = freezed,
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
      columField: freezed == columField
          ? _value.columField
          : columField // ignore: cast_nullable_to_non_nullable
              as List<ColumField>?,
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
      @JsonKey(name: 'field') List<ColumField>? columField});
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
    Object? columField = freezed,
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
      columField: freezed == columField
          ? _value.columField
          : columField // ignore: cast_nullable_to_non_nullable
              as List<ColumField>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SlideCategorieModel extends _SlideCategorieModel {
  _$_SlideCategorieModel(
      {this.id,
      this.name,
      this.name_kh,
      this.icon,
      @JsonKey(name: 'field') this.columField})
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
  @JsonKey(name: 'field')
  List<ColumField>? columField;

  @override
  String toString() {
    return 'SlideCategorieModel(id: $id, name: $name, name_kh: $name_kh, icon: $icon, columField: $columField)';
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
          @JsonKey(name: 'field') List<ColumField>? columField}) =
      _$_SlideCategorieModel;
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
  @JsonKey(name: 'field')
  List<ColumField>? get columField;
  @JsonKey(name: 'field')
  set columField(List<ColumField>? value);
  @override
  @JsonKey(ignore: true)
  _$$_SlideCategorieModelCopyWith<_$_SlideCategorieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ColumField _$ColumFieldFromJson(Map<String, dynamic> json) {
  return _ColumField.fromJson(json);
}

/// @nodoc
mixin _$ColumField {
  @JsonKey(name: "field")
  List<RowField>? get rowField => throw _privateConstructorUsedError;
  @JsonKey(name: "field")
  set rowField(List<RowField>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColumFieldCopyWith<ColumField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumFieldCopyWith<$Res> {
  factory $ColumFieldCopyWith(
          ColumField value, $Res Function(ColumField) then) =
      _$ColumFieldCopyWithImpl<$Res, ColumField>;
  @useResult
  $Res call({@JsonKey(name: "field") List<RowField>? rowField});
}

/// @nodoc
class _$ColumFieldCopyWithImpl<$Res, $Val extends ColumField>
    implements $ColumFieldCopyWith<$Res> {
  _$ColumFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowField = freezed,
  }) {
    return _then(_value.copyWith(
      rowField: freezed == rowField
          ? _value.rowField
          : rowField // ignore: cast_nullable_to_non_nullable
              as List<RowField>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColumFieldCopyWith<$Res>
    implements $ColumFieldCopyWith<$Res> {
  factory _$$_ColumFieldCopyWith(
          _$_ColumField value, $Res Function(_$_ColumField) then) =
      __$$_ColumFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "field") List<RowField>? rowField});
}

/// @nodoc
class __$$_ColumFieldCopyWithImpl<$Res>
    extends _$ColumFieldCopyWithImpl<$Res, _$_ColumField>
    implements _$$_ColumFieldCopyWith<$Res> {
  __$$_ColumFieldCopyWithImpl(
      _$_ColumField _value, $Res Function(_$_ColumField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowField = freezed,
  }) {
    return _then(_$_ColumField(
      rowField: freezed == rowField
          ? _value.rowField
          : rowField // ignore: cast_nullable_to_non_nullable
              as List<RowField>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ColumField extends _ColumField {
  _$_ColumField({@JsonKey(name: "field") this.rowField}) : super._();

  factory _$_ColumField.fromJson(Map<String, dynamic> json) =>
      _$$_ColumFieldFromJson(json);

  @override
  @JsonKey(name: "field")
  List<RowField>? rowField;

  @override
  String toString() {
    return 'ColumField(rowField: $rowField)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColumFieldCopyWith<_$_ColumField> get copyWith =>
      __$$_ColumFieldCopyWithImpl<_$_ColumField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColumFieldToJson(
      this,
    );
  }
}

abstract class _ColumField extends ColumField {
  factory _ColumField({@JsonKey(name: "field") List<RowField>? rowField}) =
      _$_ColumField;
  _ColumField._() : super._();

  factory _ColumField.fromJson(Map<String, dynamic> json) =
      _$_ColumField.fromJson;

  @override
  @JsonKey(name: "field")
  List<RowField>? get rowField;
  @JsonKey(name: "field")
  set rowField(List<RowField>? value);
  @override
  @JsonKey(ignore: true)
  _$$_ColumFieldCopyWith<_$_ColumField> get copyWith =>
      throw _privateConstructorUsedError;
}

RowField _$RowFieldFromJson(Map<String, dynamic> json) {
  return _RowField.fromJson(json);
}

/// @nodoc
mixin _$RowField {
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
  List<RowField>? get field => throw _privateConstructorUsedError;
  set field(List<RowField>? value) => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  set value(dynamic value) => throw _privateConstructorUsedError;

  /// Check local
  /// This fields has no data from
  int get maxLines => throw _privateConstructorUsedError;

  /// Check local
  /// This fields has no data from
  set maxLines(int value) => throw _privateConstructorUsedError;
  bool get isDisplay => throw _privateConstructorUsedError;
  set isDisplay(bool value) => throw _privateConstructorUsedError;
  bool get isSelect => throw _privateConstructorUsedError;
  set isSelect(bool value) => throw _privateConstructorUsedError;
  String? get suffixAsset => throw _privateConstructorUsedError;
  set suffixAsset(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RowFieldCopyWith<RowField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowFieldCopyWith<$Res> {
  factory $RowFieldCopyWith(RowField value, $Res Function(RowField) then) =
      _$RowFieldCopyWithImpl<$Res, RowField>;
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
      List<RowField>? field,
      dynamic value,
      int maxLines,
      bool isDisplay,
      bool isSelect,
      String? suffixAsset});
}

/// @nodoc
class _$RowFieldCopyWithImpl<$Res, $Val extends RowField>
    implements $RowFieldCopyWith<$Res> {
  _$RowFieldCopyWithImpl(this._value, this._then);

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
    Object? value = freezed,
    Object? maxLines = null,
    Object? isDisplay = null,
    Object? isSelect = null,
    Object? suffixAsset = freezed,
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
              as List<RowField>?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      suffixAsset: freezed == suffixAsset
          ? _value.suffixAsset
          : suffixAsset // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RowFieldCopyWith<$Res> implements $RowFieldCopyWith<$Res> {
  factory _$$_RowFieldCopyWith(
          _$_RowField value, $Res Function(_$_RowField) then) =
      __$$_RowFieldCopyWithImpl<$Res>;
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
      List<RowField>? field,
      dynamic value,
      int maxLines,
      bool isDisplay,
      bool isSelect,
      String? suffixAsset});
}

/// @nodoc
class __$$_RowFieldCopyWithImpl<$Res>
    extends _$RowFieldCopyWithImpl<$Res, _$_RowField>
    implements _$$_RowFieldCopyWith<$Res> {
  __$$_RowFieldCopyWithImpl(
      _$_RowField _value, $Res Function(_$_RowField) _then)
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
    Object? value = freezed,
    Object? maxLines = null,
    Object? isDisplay = null,
    Object? isSelect = null,
    Object? suffixAsset = freezed,
  }) {
    return _then(_$_RowField(
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
              as List<RowField>?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      suffixAsset: freezed == suffixAsset
          ? _value.suffixAsset
          : suffixAsset // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@override
class _$_RowField extends _RowField {
  _$_RowField(
      {this.controller,
      this.inputTypes,
      this.format,
      this.label,
      this.label_kh,
      this.hint,
      this.hint_kh,
      this.required = false,
      this.field = const [],
      this.value,
      this.maxLines = 1,
      this.isDisplay = true,
      this.isSelect = false,
      this.suffixAsset})
      : super._();

  factory _$_RowField.fromJson(Map<String, dynamic> json) =>
      _$$_RowFieldFromJson(json);

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
  List<RowField>? field;
  @override
  dynamic value;

  /// Check local
  /// This fields has no data from
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
  String? suffixAsset;

  @override
  String toString() {
    return 'RowField(controller: $controller, inputTypes: $inputTypes, format: $format, label: $label, label_kh: $label_kh, hint: $hint, hint_kh: $hint_kh, required: $required, field: $field, value: $value, maxLines: $maxLines, isDisplay: $isDisplay, isSelect: $isSelect, suffixAsset: $suffixAsset)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RowFieldCopyWith<_$_RowField> get copyWith =>
      __$$_RowFieldCopyWithImpl<_$_RowField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RowFieldToJson(
      this,
    );
  }
}

abstract class _RowField extends RowField {
  factory _RowField(
      {Object? controller,
      String? inputTypes,
      String? format,
      String? label,
      String? label_kh,
      String? hint,
      String? hint_kh,
      bool required,
      List<RowField>? field,
      dynamic value,
      int maxLines,
      bool isDisplay,
      bool isSelect,
      String? suffixAsset}) = _$_RowField;
  _RowField._() : super._();

  factory _RowField.fromJson(Map<String, dynamic> json) = _$_RowField.fromJson;

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
  List<RowField>? get field;
  set field(List<RowField>? value);
  @override
  dynamic get value;
  set value(dynamic value);
  @override

  /// Check local
  /// This fields has no data from
  int get maxLines;

  /// Check local
  /// This fields has no data from
  set maxLines(int value);
  @override
  bool get isDisplay;
  set isDisplay(bool value);
  @override
  bool get isSelect;
  set isSelect(bool value);
  @override
  String? get suffixAsset;
  set suffixAsset(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_RowFieldCopyWith<_$_RowField> get copyWith =>
      throw _privateConstructorUsedError;
}
