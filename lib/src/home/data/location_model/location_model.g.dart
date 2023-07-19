// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    _$_LocationModel(
      street: json['street'] as String?,
      village: json['village'] as String?,
      commune: json['commune'] as String?,
      distict: json['distict'] as String?,
      provice: json['provice'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'village': instance.village,
      'commune': instance.commune,
      'distict': instance.distict,
      'provice': instance.provice,
      'country': instance.country,
    };
