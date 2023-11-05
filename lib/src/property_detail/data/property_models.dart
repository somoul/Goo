class PropertyModelResponse {
  int? currentPage;
  List<PropertyModel>? propertyList;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;

  PropertyModelResponse(
      {this.currentPage,
      this.propertyList,
      this.firstPageUrl,
      this.from,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to});

  PropertyModelResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      propertyList = <PropertyModel>[];
      json['data'].forEach((v) {
        propertyList!.add(PropertyModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (propertyList != null) {
      data['data'] = propertyList!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    return data;
  }
}

class PropertyModel {
  int? userId;
  String? title;
  String? description;
  String? price;
  int? like;
  List<String>? attachments;
  int? comment;
  String? latitude;
  String? longitude;
  int? categoryId;
  String? address;
  int? status;
  String? postType;
  String? createdAt;
  String? updatedAt;
  int? id;
  String? lang;
  String? bookingPrice;
  String? size;
  String? landSize;
  String? electricPrice;
  String? waterPrice;
  String? accessoryId;
  String? thumbnail;
  String? firstName;
  String? lastName;
  String? username;
  String? avatar;
  String? categoryName;
  String? categoryNameKh;
  String? duration;
  String? distance;
  bool favorite = false;

  PropertyModel({
    this.userId,
    this.title,
    this.description,
    this.price,
    this.like,
    this.attachments,
    this.comment,
    this.latitude,
    this.longitude,
    this.categoryId,
    this.address,
    this.status,
    this.postType,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.lang,
    this.bookingPrice,
    this.size,
    this.landSize,
    this.electricPrice,
    this.waterPrice,
    this.accessoryId,
    this.thumbnail,
    this.firstName,
    this.lastName,
    this.username,
    this.avatar,
    this.categoryName,
    this.categoryNameKh,
    this.duration,
    this.distance,
    this.favorite = false,
  });

  PropertyModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    like = json['like'];
    attachments =
        json['attachments'] != null ? json['attachments'].cast<String>() : [];
    comment = json['comment'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    categoryId = json['category_id'];
    address = json['address'];
    status = json['status'];
    postType = json['post_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    lang = json['lang'];
    bookingPrice = json['booking_price'];
    size = json['size'];
    landSize = json['land_size'];
    electricPrice = json['electric_price'];
    waterPrice = json['water_price'];
    accessoryId = json['accessory_id'];
    thumbnail = json['thumbnail'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    avatar = json['avatar'];
    categoryName = json['category_name'];
    categoryNameKh = json['category_name_kh'];
    duration = json['duration'];
    distance = json['distance'];
    favorite = json['favorite'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['like'] = like;
    data['attachments'] = attachments;
    data['comment'] = comment;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['category_id'] = categoryId;
    data['address'] = address;
    data['status'] = status;
    data['post_type'] = postType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['id'] = id;
    data['lang'] = lang;
    data['booking_price'] = bookingPrice;
    data['size'] = size;
    data['land_size'] = landSize;
    data['electric_price'] = electricPrice;
    data['water_price'] = waterPrice;
    data['accessory_id'] = accessoryId;
    data['thumbnail'] = thumbnail;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['avatar'] = avatar;
    data['category_name'] = categoryName;
    data['category_name_kh'] = categoryNameKh;
    data['duration'] = duration;
    data['distance'] = distance;
    return data;
  }
}
