// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_categorie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SlideCategorieModel _$$_SlideCategorieModelFromJson(
        Map<String, dynamic> json) =>
    _$_SlideCategorieModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      name_kh: json['name_kh'] as String?,
      icon: json['icon'] as String?,
      columField: (json['field'] as List<dynamic>?)
          ?.map((e) => ColumField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SlideCategorieModelToJson(
        _$_SlideCategorieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_kh': instance.name_kh,
      'icon': instance.icon,
      'field': instance.columField?.map((e) => e.toJson()).toList(),
    };

_$_ColumField _$$_ColumFieldFromJson(Map<String, dynamic> json) =>
    _$_ColumField(
      rowField: (json['field'] as List<dynamic>?)
          ?.map((e) => RowField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ColumFieldToJson(_$_ColumField instance) =>
    <String, dynamic>{
      'field': instance.rowField?.map((e) => e.toJson()).toList(),
    };

_$_RowField _$$_RowFieldFromJson(Map<String, dynamic> json) => _$_RowField(
      controller: json['controller'],
      inputTypes: json['inputTypes'] as String?,
      format: json['format'] as String?,
      label: json['label'] as String?,
      label_kh: json['label_kh'] as String?,
      hint: json['hint'] as String?,
      hint_kh: json['hint_kh'] as String?,
      required: json['required'] as bool? ?? false,
      field: (json['field'] as List<dynamic>?)
              ?.map((e) => RowField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      value: json['value'],
      maxLines: json['maxLines'] as int? ?? 1,
      isDisplay: json['isDisplay'] as bool? ?? true,
      isSelect: json['isSelect'] as bool? ?? false,
      suffixAsset: json['suffixAsset'] as String?,
    );

Map<String, dynamic> _$$_RowFieldToJson(_$_RowField instance) =>
    <String, dynamic>{
      'controller': instance.controller,
      'inputTypes': instance.inputTypes,
      'format': instance.format,
      'label': instance.label,
      'label_kh': instance.label_kh,
      'hint': instance.hint,
      'hint_kh': instance.hint_kh,
      'required': instance.required,
      'field': instance.field,
      'value': instance.value,
      'maxLines': instance.maxLines,
      'isDisplay': instance.isDisplay,
      'isSelect': instance.isSelect,
      'suffixAsset': instance.suffixAsset,
    };
