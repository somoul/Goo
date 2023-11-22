class PropertyModel {
  int? userId;
  String? title;
  String? description;
  String? price;
  int like = 0;
  List<String>? attachments;
  String? latitude;
  String? longitude;
  int? categoryId;
  String? address;
  int? status;
  int id = 0;
  String? bookingPrice;
  List<int>? accessoryId;
  int? visit;
  Map<String, dynamic> data = {};
  String? duration;
  String? distance;
  bool favorite = false;
  User? user;
  Category? category;

  PropertyModel({
    this.userId,
    this.title,
    this.description,
    this.price,
    this.like = 0,
    this.attachments,
    this.latitude,
    this.longitude,
    this.categoryId,
    this.address,
    this.status,
    this.id = 0,
    this.bookingPrice,
    this.accessoryId,
    this.visit,
    this.data = const {},
    this.duration,
    this.distance,
    this.user,
    this.category,
    this.favorite = false,
  });

  PropertyModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    like = json['like'];
    attachments = json['attachments'].cast<String>();
    latitude = json['latitude'];
    longitude = json['longitude'];
    categoryId = json['category_id'];
    address = json['address'];
    status = json['status'];
    id = json['id'];
    bookingPrice = json['booking_price'];
    accessoryId = json['accessory_id'].cast<int>();
    visit = json['visit'];
    data = json['data'] ?? {};
    duration = json['duration'];
    distance = json['distance'];
    favorite = json['favorite'] ?? false;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['like'] = like;
    data['attachments'] = attachments;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['category_id'] = categoryId;
    data['address'] = address;
    data['status'] = status;
    data['id'] = id;
    data['booking_price'] = bookingPrice;
    data['accessory_id'] = accessoryId;
    data['visit'] = visit;
    data['data'] = data;
    data['duration'] = duration;
    data['distance'] = distance;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? mPrefix;
  String? phone;
  String? avatar;
  String? gender;
  String? dob;
  String? uuid;

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.mPrefix,
      this.phone,
      this.avatar,
      this.gender,
      this.dob,
      this.uuid});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mPrefix = json['m_prefix'];
    phone = json['phone'];
    avatar = json['avatar'];
    gender = json['gender'];
    dob = json['dob'];
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
    data['dob'] = dob;
    data['uuid'] = uuid;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? active;
  String? createdAt;
  String? updatedAt;
  String? icon;
  String? nameKh;
  Map<String, dynamic>? field;

  Category(
      {this.id,
      this.name,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.icon,
      this.nameKh,
      this.field});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    icon = json['icon'];
    nameKh = json['name_kh'];
    field = (json['field'] != null ? json['field'] as Map : {})
        .cast<String, dynamic>();
    // field = json['field'] != null ? Field.fromJson(json['field']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['icon'] = icon;
    data['name_kh'] = nameKh;
    // if (field != null) {
    //   data['field'] = field!.toJson();
    // }
    return data;
  }
}
