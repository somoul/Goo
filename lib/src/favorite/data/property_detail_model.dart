// ignore_for_file: invalid_annotation_target

import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_detail_model.freezed.dart';
part 'property_detail_model.g.dart';

@freezed
class PropertyDetailModel with _$PropertyDetailModel {
  @JsonSerializable(explicitToJson: true)
  const factory PropertyDetailModel({
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'like') int? like,
    @JsonKey(name: 'attachments') List<String>? attachments,
    @JsonKey(name: 'latitude') String? latitude,
    @JsonKey(name: 'longitude') String? longitude,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'booking_price') String? bookingPrice,
    @JsonKey(name: 'accessory_id') List<int>? accessoryId,
    @JsonKey(name: 'visit') int? visit,
    @JsonKey(name: 'data') Map<String, dynamic>? data, //
    @JsonKey(name: 'duration') String? duration,
    @JsonKey(name: 'distance') String? distance,
    @JsonKey(name: 'favorite') bool? favorite,
    @JsonKey(name: 'share_url') String? shareUrl,
    @JsonKey(name: 'agent') AgentModel? agentModel,
    @JsonKey(name: 'relative_post') PropertyModel? propertyModel,
    @JsonKey(name: 'user') UserModel? user,
  }) = _PropertyDetailModel;

  factory PropertyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailModelFromJson(json);
}

// user

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'm_prefix') String? mPrefix,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'dob') int? dob,
    @JsonKey(name: 'uuid') String? uuid,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

//Agent
@freezed
class AgentModel with _$AgentModel {
  @JsonSerializable(explicitToJson: true)
  const factory AgentModel({
    @JsonKey(name: 'telegram') String? telegram,
    @JsonKey(name: 'phone') List<PhoneModel>? phoneNumber,
  }) = _AgentModel;

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);
}

//PhoneLinke
@freezed
class PhoneModel with _$PhoneModel {
  @JsonSerializable(explicitToJson: true)
  const factory PhoneModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'image') String? image,
  }) = _PhoneModel;

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);
}
