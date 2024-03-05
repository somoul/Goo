// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PropertyDetailModel _$$_PropertyDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_PropertyDetailModel(
      userId: json['user_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      like: json['like'] as int?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      categoryId: json['category_id'] as int?,
      address: json['address'] as String?,
      status: json['status'] as int?,
      id: json['id'] as int?,
      bookingPrice: json['booking_price'] as String?,
      accessoryId: (json['accessory_id'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      visit: json['visit'] as int?,
      data: json['data'] as Map<String, dynamic>?,
      duration: json['duration'] as String?,
      distance: json['distance'] as String?,
      favorite: json['favorite'] as bool?,
      shareUrl: json['share_url'] as String?,
      agentModel: json['agent'] == null
          ? null
          : AgentModel.fromJson(json['agent'] as Map<String, dynamic>),
      propertyModel: json['relative_post'] == null
          ? null
          : PropertyModel.fromJson(
              json['relative_post'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PropertyDetailModelToJson(
        _$_PropertyDetailModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'like': instance.like,
      'attachments': instance.attachments,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'category_id': instance.categoryId,
      'address': instance.address,
      'status': instance.status,
      'id': instance.id,
      'booking_price': instance.bookingPrice,
      'accessory_id': instance.accessoryId,
      'visit': instance.visit,
      'data': instance.data,
      'duration': instance.duration,
      'distance': instance.distance,
      'favorite': instance.favorite,
      'share_url': instance.shareUrl,
      'agent': instance.agentModel?.toJson(),
      'relative_post': instance.propertyModel?.toJson(),
      'user': instance.user?.toJson(),
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mPrefix: json['m_prefix'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as int?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'm_prefix': instance.mPrefix,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'dob': instance.dob,
      'uuid': instance.uuid,
    };

_$_AgentModel _$$_AgentModelFromJson(Map<String, dynamic> json) =>
    _$_AgentModel(
      telegram: json['telegram'] as String?,
      phoneNumber: (json['phone'] as List<dynamic>?)
          ?.map((e) => PhoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AgentModelToJson(_$_AgentModel instance) =>
    <String, dynamic>{
      'telegram': instance.telegram,
      'phone': instance.phoneNumber?.map((e) => e.toJson()).toList(),
    };

_$_PhoneModel _$$_PhoneModelFromJson(Map<String, dynamic> json) =>
    _$_PhoneModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_PhoneModelToJson(_$_PhoneModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'image': instance.image,
    };
