// ignore_for_file: invalid_annotation_target, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'slide_categorie_model.freezed.dart';
part 'slide_categorie_model.g.dart';

@unfreezed
class SlideCategorieModel with _$SlideCategorieModel {
  SlideCategorieModel._();
  @JsonSerializable(explicitToJson: true)
  factory SlideCategorieModel({
    int? id,
    String? name,
    String? name_kh,
    String? icon,
    List<FieldModel>? field,
  }) = _SlideCategorieModel;

  factory SlideCategorieModel.fromJson(Map<String, dynamic> json) =>
      _$SlideCategorieModelFromJson(json);
}

@unfreezed
class FieldModel with _$FieldModel {
  FieldModel._();
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

  factory FieldModel({
    Object? controller, //TextEditingCotroller
    String? inputTypes,
    String? format,
    String? label,
    String? label_kh,
    String? hint,
    String? hint_kh,
    @Default(false) bool required,
    @Default([]) List<FieldModel>? field,

    /// Check local
    @Default(1) int maxLines,
    @Default(true) bool isDisplay,
    @Default(false) bool isSelect,
    dynamic value,
  }) = _FieldModel;

  factory FieldModel.fromJson(Map<String, dynamic> json) =>
      _$FieldModelFromJson(json);
}
