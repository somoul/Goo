class PopularPropertyModelResponse {
  bool? status;
  String? message;
  List<PopularModel>? data;

  PopularPropertyModelResponse({this.status, this.message, this.data});

  PopularPropertyModelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PopularModel>[];
      json['data'].forEach((v) {
        data!.add(PopularModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PopularModel {
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
  int? id;
  String? lang;
  String? bookingPrice;
  String? size;
  String? landSize;
  String? electricPrice;
  String? waterPrice;
  String? accessoryId;
  String? thumbnail;
  String? duration;

  PopularModel(
      {this.userId,
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
      this.id,
      this.lang,
      this.bookingPrice,
      this.size,
      this.landSize,
      this.electricPrice,
      this.waterPrice,
      this.accessoryId,
      this.thumbnail,
      this.duration});

  PopularModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    like = json['like'];
    attachments = json['attachments'].cast<String>();
    comment = json['comment'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    categoryId = json['category_id'];
    address = json['address'];
    status = json['status'];
    postType = json['post_type'];
    createdAt = json['created_at'];
    id = json['id'];
    lang = json['lang'];
    bookingPrice = json['booking_price'];
    size = json['size'];
    landSize = json['land_size'];
    electricPrice = json['electric_price'];
    waterPrice = json['water_price'];
    accessoryId = json['accessory_id'];
    thumbnail = json['thumbnail'];
    duration = json['duration'];
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
    data['id'] = id;
    data['lang'] = lang;
    data['booking_price'] = bookingPrice;
    data['size'] = size;
    data['land_size'] = landSize;
    data['electric_price'] = electricPrice;
    data['water_price'] = waterPrice;
    data['accessory_id'] = accessoryId;
    data['thumbnail'] = thumbnail;
    data['duration'] = duration;
    return data;
  }
}
