class OtpModel {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? mPrefix;
  String? phone;
  String? avatar;
  String? gender;

  String? uuid;

  OtpModel(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.mPrefix,
      this.phone,
      this.avatar,
      this.gender,
      this.uuid});

  OtpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mPrefix = json['m_prefix'];
    phone = json['phone'];
    avatar = json['avatar'];
    gender = json['gender'];

    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['m_prefix'] = mPrefix;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['gender'] = gender;

    data['uuid'] = uuid;
    return data;
  }
}
