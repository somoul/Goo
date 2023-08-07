import 'dart:convert';

class AccessoryModel {
  int? id;
  String? name;
  String? nameKh;
  String? icon;
  int? status;
  String? createdAt;
  String? updatedAt;

  AccessoryModel({
    this.id,
    this.name,
    this.nameKh,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AccessoryModel.fromRawJson(String str) =>
      AccessoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccessoryModel.fromJson(Map<String, dynamic> json) => AccessoryModel(
        id: json["id"],
        name: json["name"],
        nameKh: json["name_kh"],
        icon: json["icon"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_kh": nameKh,
        "icon": icon,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
