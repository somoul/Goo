// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  int? id;
  String? uuid;
  String? username;
  String? firstName;
  String? lastName;
  String? mPrefix;
  String? phone;
  String? avatar;
  String? gender;
  String? dob;
  String? email;
  String? telegram;
  String? address;

  UserModel({
    this.id,
    this.uuid,
    this.username,
    this.firstName,
    this.lastName,
    this.mPrefix,
    this.phone,
    this.avatar,
    this.gender,
    this.dob,
    this.email,
    this.telegram,
    this.address,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        uuid: json["uuid"],
        address: json['address'],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mPrefix: json["m_prefix"],
        phone: json["phone"],
        avatar: json["avatar"],
        gender: json["gender"],
        dob: json["dob"],
        email: json["email"],
        telegram: json["telegram"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "address": address,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "m_prefix": mPrefix,
        "phone": phone,
        "avatar": avatar,
        "gender": gender,
        "dob": dob,
        "email": email,
        "telegram": telegram,
      };
}
