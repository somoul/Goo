// ignore_for_file: invalid_annotation_target, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'slide_categorie_model.freezed.dart';
part 'slide_categorie_model.g.dart';

enum InputTextEnum {
  number(type: TextInputType.text),
  name(type: TextInputType.name),
  text(type: TextInputType.text),
  phone(type: TextInputType.phone);

  const InputTextEnum({required this.type});

  final TextInputType type;
  TextInputType getTextInputType(InputTextEnum type) {
    if (this == number) {
      return TextInputType.number;
    } else if (this == name) {
      return TextInputType.name;
    } else if (this == phone) {
      return TextInputType.phone;
    }
    return TextInputType.text;
  }
}

@unfreezed
class SlideCategorieModel with _$SlideCategorieModel {
  SlideCategorieModel._();
  @JsonSerializable(explicitToJson: true)
  factory SlideCategorieModel({
    int? id,
    String? name,
    String? name_kh,
    String? icon,
    @JsonKey(name: 'field') List<ColumField>? columField,
  }) = _SlideCategorieModel;

  factory SlideCategorieModel.fromJson(Map<String, dynamic> json) =>
      _$SlideCategorieModelFromJson(json);
}

@unfreezed
class ColumField with _$ColumField {
  ColumField._();
  @JsonSerializable(explicitToJson: true)
  factory ColumField({
    @JsonKey(name: "field") List<RowField>? rowField,
  }) = _ColumField;

  factory ColumField.fromJson(Map<String, dynamic> json) =>
      _$ColumFieldFromJson(json);
}

@unfreezed
class RowField with _$RowField {
  RowField._();
  @JsonSerializable(explicitToJson: true)
  bool get checkBoolean {
    if (value is bool) {
      return value;
    }
    return false;
  }

  String get checkString {
    if (value is String) {
      var con = controller as TextEditingController;
      return con.text;
    }
    return '';
  }

  num get checkNumber {
    if (value is num) {
      return num.parse(value);
    }
    return 0;
  }

  TextInputType get getInputType {
    if (format == 'd') {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  @override
  factory RowField({
    Object? controller, //TextEditingCotroller
    String? inputTypes,
    String? format,
    String? label,
    String? label_kh,
    String? hint,
    String? hint_kh,
    @Default(false) bool required,
    @Default([]) List<RowField>? field,
    dynamic value,

    /// Check local
    /// This fields has no data from
    @Default(1) int maxLines,
    @Default(true) bool isDisplay,
    @Default(false) bool isSelect,
    String? suffixAsset,
  }) = _RowField;

  factory RowField.fromJson(Map<String, dynamic> json) =>
      _$RowFieldFromJson(json);
}
