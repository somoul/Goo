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
      icon: json['icon'] as String?,
      nameKh: json['name_kh'] as String?,
      field: json['field'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_SlideCategorieModelToJson(
        _$_SlideCategorieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'name_kh': instance.nameKh,
      'field': instance.field,
    };
