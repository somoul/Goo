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
      field: (json['field'] as List<dynamic>?)
          ?.map((e) => FieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SlideCategorieModelToJson(
        _$_SlideCategorieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_kh': instance.name_kh,
      'icon': instance.icon,
      'field': instance.field?.map((e) => e.toJson()).toList(),
    };

_$_FieldModel _$$_FieldModelFromJson(Map<String, dynamic> json) =>
    _$_FieldModel(
      controller: json['controller'],
      inputTypes: json['inputTypes'] as String?,
      format: json['format'] as String?,
      label: json['label'] as String?,
      label_kh: json['label_kh'] as String?,
      hint: json['hint'] as String?,
      hint_kh: json['hint_kh'] as String?,
      required: json['required'] as bool? ?? false,
      field: (json['field'] as List<dynamic>?)
              ?.map((e) => FieldModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxLines: json['maxLines'] as int? ?? 1,
      isDisplay: json['isDisplay'] as bool? ?? true,
      isSelect: json['isSelect'] as bool? ?? false,
      value: json['value'],
    );

Map<String, dynamic> _$$_FieldModelToJson(_$_FieldModel instance) =>
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
      'maxLines': instance.maxLines,
      'isDisplay': instance.isDisplay,
      'isSelect': instance.isSelect,
      'value': instance.value,
    };
