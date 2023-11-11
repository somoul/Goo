class AddressModel {
  String? address;
  String? lattitude;
  String? longitude;
  int? userId;
  int? id;

  AddressModel(
      {this.address, this.lattitude, this.longitude, this.userId, this.id});

  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    lattitude = json['lattitude'];
    longitude = json['longitude'];
    userId = json['user_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['lattitude'] = lattitude;
    data['longitude'] = longitude;
    data['user_id'] = userId;
    data['id'] = id;
    return data;
  }
}
