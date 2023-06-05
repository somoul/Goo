class RegisterModel {
  String? phone;
  String? mPrefix;
  String? username;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;

  RegisterModel(
      {this.phone,
      this.mPrefix,
      this.username,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    mPrefix = json['m_prefix'];
    username = json['username'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['m_prefix'] = mPrefix;
    data['username'] = username;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}
