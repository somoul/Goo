// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PropertyDetailModel _$PropertyDetailModelFromJson(Map<String, dynamic> json) {
  return _PropertyDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PropertyDetailModel {
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'like')
  int? get like => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachments')
  List<String>? get attachments => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  String? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  String? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_price')
  String? get bookingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'accessory_id')
  List<int>? get accessoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit')
  int? get visit => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data => throw _privateConstructorUsedError; //
  @JsonKey(name: 'duration')
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance')
  String? get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite')
  bool? get favorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_url')
  String? get shareUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent')
  AgentModel? get agentModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'relative_post')
  PropertyModel? get propertyModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertyDetailModelCopyWith<PropertyDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyDetailModelCopyWith<$Res> {
  factory $PropertyDetailModelCopyWith(
          PropertyDetailModel value, $Res Function(PropertyDetailModel) then) =
      _$PropertyDetailModelCopyWithImpl<$Res, PropertyDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
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
      @JsonKey(name: 'data') Map<String, dynamic>? data,
      @JsonKey(name: 'duration') String? duration,
      @JsonKey(name: 'distance') String? distance,
      @JsonKey(name: 'favorite') bool? favorite,
      @JsonKey(name: 'share_url') String? shareUrl,
      @JsonKey(name: 'agent') AgentModel? agentModel,
      @JsonKey(name: 'relative_post') PropertyModel? propertyModel,
      @JsonKey(name: 'user') UserModel? user});

  $AgentModelCopyWith<$Res>? get agentModel;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$PropertyDetailModelCopyWithImpl<$Res, $Val extends PropertyDetailModel>
    implements $PropertyDetailModelCopyWith<$Res> {
  _$PropertyDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? like = freezed,
    Object? attachments = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? categoryId = freezed,
    Object? address = freezed,
    Object? status = freezed,
    Object? id = freezed,
    Object? bookingPrice = freezed,
    Object? accessoryId = freezed,
    Object? visit = freezed,
    Object? data = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? favorite = freezed,
    Object? shareUrl = freezed,
    Object? agentModel = freezed,
    Object? propertyModel = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingPrice: freezed == bookingPrice
          ? _value.bookingPrice
          : bookingPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      accessoryId: freezed == accessoryId
          ? _value.accessoryId
          : accessoryId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      visit: freezed == visit
          ? _value.visit
          : visit // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      shareUrl: freezed == shareUrl
          ? _value.shareUrl
          : shareUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      agentModel: freezed == agentModel
          ? _value.agentModel
          : agentModel // ignore: cast_nullable_to_non_nullable
              as AgentModel?,
      propertyModel: freezed == propertyModel
          ? _value.propertyModel
          : propertyModel // ignore: cast_nullable_to_non_nullable
              as PropertyModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AgentModelCopyWith<$Res>? get agentModel {
    if (_value.agentModel == null) {
      return null;
    }

    return $AgentModelCopyWith<$Res>(_value.agentModel!, (value) {
      return _then(_value.copyWith(agentModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PropertyDetailModelCopyWith<$Res>
    implements $PropertyDetailModelCopyWith<$Res> {
  factory _$$_PropertyDetailModelCopyWith(_$_PropertyDetailModel value,
          $Res Function(_$_PropertyDetailModel) then) =
      __$$_PropertyDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
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
      @JsonKey(name: 'data') Map<String, dynamic>? data,
      @JsonKey(name: 'duration') String? duration,
      @JsonKey(name: 'distance') String? distance,
      @JsonKey(name: 'favorite') bool? favorite,
      @JsonKey(name: 'share_url') String? shareUrl,
      @JsonKey(name: 'agent') AgentModel? agentModel,
      @JsonKey(name: 'relative_post') PropertyModel? propertyModel,
      @JsonKey(name: 'user') UserModel? user});

  @override
  $AgentModelCopyWith<$Res>? get agentModel;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_PropertyDetailModelCopyWithImpl<$Res>
    extends _$PropertyDetailModelCopyWithImpl<$Res, _$_PropertyDetailModel>
    implements _$$_PropertyDetailModelCopyWith<$Res> {
  __$$_PropertyDetailModelCopyWithImpl(_$_PropertyDetailModel _value,
      $Res Function(_$_PropertyDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? like = freezed,
    Object? attachments = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? categoryId = freezed,
    Object? address = freezed,
    Object? status = freezed,
    Object? id = freezed,
    Object? bookingPrice = freezed,
    Object? accessoryId = freezed,
    Object? visit = freezed,
    Object? data = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? favorite = freezed,
    Object? shareUrl = freezed,
    Object? agentModel = freezed,
    Object? propertyModel = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_PropertyDetailModel(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingPrice: freezed == bookingPrice
          ? _value.bookingPrice
          : bookingPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      accessoryId: freezed == accessoryId
          ? _value._accessoryId
          : accessoryId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      visit: freezed == visit
          ? _value.visit
          : visit // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      shareUrl: freezed == shareUrl
          ? _value.shareUrl
          : shareUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      agentModel: freezed == agentModel
          ? _value.agentModel
          : agentModel // ignore: cast_nullable_to_non_nullable
              as AgentModel?,
      propertyModel: freezed == propertyModel
          ? _value.propertyModel
          : propertyModel // ignore: cast_nullable_to_non_nullable
              as PropertyModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PropertyDetailModel implements _PropertyDetailModel {
  const _$_PropertyDetailModel(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'like') this.like,
      @JsonKey(name: 'attachments') final List<String>? attachments,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'booking_price') this.bookingPrice,
      @JsonKey(name: 'accessory_id') final List<int>? accessoryId,
      @JsonKey(name: 'visit') this.visit,
      @JsonKey(name: 'data') final Map<String, dynamic>? data,
      @JsonKey(name: 'duration') this.duration,
      @JsonKey(name: 'distance') this.distance,
      @JsonKey(name: 'favorite') this.favorite,
      @JsonKey(name: 'share_url') this.shareUrl,
      @JsonKey(name: 'agent') this.agentModel,
      @JsonKey(name: 'relative_post') this.propertyModel,
      @JsonKey(name: 'user') this.user})
      : _attachments = attachments,
        _accessoryId = accessoryId,
        _data = data;

  factory _$_PropertyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_PropertyDetailModelFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'price')
  final String? price;
  @override
  @JsonKey(name: 'like')
  final int? like;
  final List<String>? _attachments;
  @override
  @JsonKey(name: 'attachments')
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'latitude')
  final String? latitude;
  @override
  @JsonKey(name: 'longitude')
  final String? longitude;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'booking_price')
  final String? bookingPrice;
  final List<int>? _accessoryId;
  @override
  @JsonKey(name: 'accessory_id')
  List<int>? get accessoryId {
    final value = _accessoryId;
    if (value == null) return null;
    if (_accessoryId is EqualUnmodifiableListView) return _accessoryId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'visit')
  final int? visit;
  final Map<String, dynamic>? _data;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

//
  @override
  @JsonKey(name: 'duration')
  final String? duration;
  @override
  @JsonKey(name: 'distance')
  final String? distance;
  @override
  @JsonKey(name: 'favorite')
  final bool? favorite;
  @override
  @JsonKey(name: 'share_url')
  final String? shareUrl;
  @override
  @JsonKey(name: 'agent')
  final AgentModel? agentModel;
  @override
  @JsonKey(name: 'relative_post')
  final PropertyModel? propertyModel;
  @override
  @JsonKey(name: 'user')
  final UserModel? user;

  @override
  String toString() {
    return 'PropertyDetailModel(userId: $userId, title: $title, description: $description, price: $price, like: $like, attachments: $attachments, latitude: $latitude, longitude: $longitude, categoryId: $categoryId, address: $address, status: $status, id: $id, bookingPrice: $bookingPrice, accessoryId: $accessoryId, visit: $visit, data: $data, duration: $duration, distance: $distance, favorite: $favorite, shareUrl: $shareUrl, agentModel: $agentModel, propertyModel: $propertyModel, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PropertyDetailModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.like, like) || other.like == like) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingPrice, bookingPrice) ||
                other.bookingPrice == bookingPrice) &&
            const DeepCollectionEquality()
                .equals(other._accessoryId, _accessoryId) &&
            (identical(other.visit, visit) || other.visit == visit) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.shareUrl, shareUrl) ||
                other.shareUrl == shareUrl) &&
            (identical(other.agentModel, agentModel) ||
                other.agentModel == agentModel) &&
            (identical(other.propertyModel, propertyModel) ||
                other.propertyModel == propertyModel) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        title,
        description,
        price,
        like,
        const DeepCollectionEquality().hash(_attachments),
        latitude,
        longitude,
        categoryId,
        address,
        status,
        id,
        bookingPrice,
        const DeepCollectionEquality().hash(_accessoryId),
        visit,
        const DeepCollectionEquality().hash(_data),
        duration,
        distance,
        favorite,
        shareUrl,
        agentModel,
        propertyModel,
        user
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PropertyDetailModelCopyWith<_$_PropertyDetailModel> get copyWith =>
      __$$_PropertyDetailModelCopyWithImpl<_$_PropertyDetailModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PropertyDetailModelToJson(
      this,
    );
  }
}

abstract class _PropertyDetailModel implements PropertyDetailModel {
  const factory _PropertyDetailModel(
      {@JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'price') final String? price,
      @JsonKey(name: 'like') final int? like,
      @JsonKey(name: 'attachments') final List<String>? attachments,
      @JsonKey(name: 'latitude') final String? latitude,
      @JsonKey(name: 'longitude') final String? longitude,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'status') final int? status,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'booking_price') final String? bookingPrice,
      @JsonKey(name: 'accessory_id') final List<int>? accessoryId,
      @JsonKey(name: 'visit') final int? visit,
      @JsonKey(name: 'data') final Map<String, dynamic>? data,
      @JsonKey(name: 'duration') final String? duration,
      @JsonKey(name: 'distance') final String? distance,
      @JsonKey(name: 'favorite') final bool? favorite,
      @JsonKey(name: 'share_url') final String? shareUrl,
      @JsonKey(name: 'agent') final AgentModel? agentModel,
      @JsonKey(name: 'relative_post') final PropertyModel? propertyModel,
      @JsonKey(name: 'user') final UserModel? user}) = _$_PropertyDetailModel;

  factory _PropertyDetailModel.fromJson(Map<String, dynamic> json) =
      _$_PropertyDetailModel.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'price')
  String? get price;
  @override
  @JsonKey(name: 'like')
  int? get like;
  @override
  @JsonKey(name: 'attachments')
  List<String>? get attachments;
  @override
  @JsonKey(name: 'latitude')
  String? get latitude;
  @override
  @JsonKey(name: 'longitude')
  String? get longitude;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'booking_price')
  String? get bookingPrice;
  @override
  @JsonKey(name: 'accessory_id')
  List<int>? get accessoryId;
  @override
  @JsonKey(name: 'visit')
  int? get visit;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data;
  @override //
  @JsonKey(name: 'duration')
  String? get duration;
  @override
  @JsonKey(name: 'distance')
  String? get distance;
  @override
  @JsonKey(name: 'favorite')
  bool? get favorite;
  @override
  @JsonKey(name: 'share_url')
  String? get shareUrl;
  @override
  @JsonKey(name: 'agent')
  AgentModel? get agentModel;
  @override
  @JsonKey(name: 'relative_post')
  PropertyModel? get propertyModel;
  @override
  @JsonKey(name: 'user')
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_PropertyDetailModelCopyWith<_$_PropertyDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'm_prefix')
  String? get mPrefix => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dob')
  int? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'm_prefix') String? mPrefix,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'dob') int? dob,
      @JsonKey(name: 'uuid') String? uuid});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mPrefix = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mPrefix: freezed == mPrefix
          ? _value.mPrefix
          : mPrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'm_prefix') String? mPrefix,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'dob') int? dob,
      @JsonKey(name: 'uuid') String? uuid});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mPrefix = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_$_UserModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mPrefix: freezed == mPrefix
          ? _value.mPrefix
          : mPrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'm_prefix') this.mPrefix,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'avatar') this.avatar,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'dob') this.dob,
      @JsonKey(name: 'uuid') this.uuid});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'm_prefix')
  final String? mPrefix;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'dob')
  final int? dob;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, firstName: $firstName, lastName: $lastName, mPrefix: $mPrefix, phone: $phone, avatar: $avatar, gender: $gender, dob: $dob, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mPrefix, mPrefix) || other.mPrefix == mPrefix) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, firstName,
      lastName, mPrefix, phone, avatar, gender, dob, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'm_prefix') final String? mPrefix,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'avatar') final String? avatar,
      @JsonKey(name: 'gender') final String? gender,
      @JsonKey(name: 'dob') final int? dob,
      @JsonKey(name: 'uuid') final String? uuid}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'm_prefix')
  String? get mPrefix;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'dob')
  int? get dob;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AgentModel _$AgentModelFromJson(Map<String, dynamic> json) {
  return _AgentModel.fromJson(json);
}

/// @nodoc
mixin _$AgentModel {
  @JsonKey(name: 'telegram')
  String? get telegram => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  List<PhoneModel>? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgentModelCopyWith<AgentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentModelCopyWith<$Res> {
  factory $AgentModelCopyWith(
          AgentModel value, $Res Function(AgentModel) then) =
      _$AgentModelCopyWithImpl<$Res, AgentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'telegram') String? telegram,
      @JsonKey(name: 'phone') List<PhoneModel>? phoneNumber});
}

/// @nodoc
class _$AgentModelCopyWithImpl<$Res, $Val extends AgentModel>
    implements $AgentModelCopyWith<$Res> {
  _$AgentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? telegram = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      telegram: freezed == telegram
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as List<PhoneModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AgentModelCopyWith<$Res>
    implements $AgentModelCopyWith<$Res> {
  factory _$$_AgentModelCopyWith(
          _$_AgentModel value, $Res Function(_$_AgentModel) then) =
      __$$_AgentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'telegram') String? telegram,
      @JsonKey(name: 'phone') List<PhoneModel>? phoneNumber});
}

/// @nodoc
class __$$_AgentModelCopyWithImpl<$Res>
    extends _$AgentModelCopyWithImpl<$Res, _$_AgentModel>
    implements _$$_AgentModelCopyWith<$Res> {
  __$$_AgentModelCopyWithImpl(
      _$_AgentModel _value, $Res Function(_$_AgentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? telegram = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_AgentModel(
      telegram: freezed == telegram
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value._phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as List<PhoneModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AgentModel implements _AgentModel {
  const _$_AgentModel(
      {@JsonKey(name: 'telegram') this.telegram,
      @JsonKey(name: 'phone') final List<PhoneModel>? phoneNumber})
      : _phoneNumber = phoneNumber;

  factory _$_AgentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AgentModelFromJson(json);

  @override
  @JsonKey(name: 'telegram')
  final String? telegram;
  final List<PhoneModel>? _phoneNumber;
  @override
  @JsonKey(name: 'phone')
  List<PhoneModel>? get phoneNumber {
    final value = _phoneNumber;
    if (value == null) return null;
    if (_phoneNumber is EqualUnmodifiableListView) return _phoneNumber;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AgentModel(telegram: $telegram, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AgentModel &&
            (identical(other.telegram, telegram) ||
                other.telegram == telegram) &&
            const DeepCollectionEquality()
                .equals(other._phoneNumber, _phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, telegram, const DeepCollectionEquality().hash(_phoneNumber));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AgentModelCopyWith<_$_AgentModel> get copyWith =>
      __$$_AgentModelCopyWithImpl<_$_AgentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgentModelToJson(
      this,
    );
  }
}

abstract class _AgentModel implements AgentModel {
  const factory _AgentModel(
          {@JsonKey(name: 'telegram') final String? telegram,
          @JsonKey(name: 'phone') final List<PhoneModel>? phoneNumber}) =
      _$_AgentModel;

  factory _AgentModel.fromJson(Map<String, dynamic> json) =
      _$_AgentModel.fromJson;

  @override
  @JsonKey(name: 'telegram')
  String? get telegram;
  @override
  @JsonKey(name: 'phone')
  List<PhoneModel>? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_AgentModelCopyWith<_$_AgentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) {
  return _PhoneModel.fromJson(json);
}

/// @nodoc
mixin _$PhoneModel {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneModelCopyWith<PhoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneModelCopyWith<$Res> {
  factory $PhoneModelCopyWith(
          PhoneModel value, $Res Function(PhoneModel) then) =
      _$PhoneModelCopyWithImpl<$Res, PhoneModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class _$PhoneModelCopyWithImpl<$Res, $Val extends PhoneModel>
    implements $PhoneModelCopyWith<$Res> {
  _$PhoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhoneModelCopyWith<$Res>
    implements $PhoneModelCopyWith<$Res> {
  factory _$$_PhoneModelCopyWith(
          _$_PhoneModel value, $Res Function(_$_PhoneModel) then) =
      __$$_PhoneModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class __$$_PhoneModelCopyWithImpl<$Res>
    extends _$PhoneModelCopyWithImpl<$Res, _$_PhoneModel>
    implements _$$_PhoneModelCopyWith<$Res> {
  __$$_PhoneModelCopyWithImpl(
      _$_PhoneModel _value, $Res Function(_$_PhoneModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_PhoneModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PhoneModel implements _PhoneModel {
  const _$_PhoneModel(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'image') this.image});

  factory _$_PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneModelFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'image')
  final String? image;

  @override
  String toString() {
    return 'PhoneModel(name: $name, phone: $phone, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneModelCopyWith<_$_PhoneModel> get copyWith =>
      __$$_PhoneModelCopyWithImpl<_$_PhoneModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneModelToJson(
      this,
    );
  }
}

abstract class _PhoneModel implements PhoneModel {
  const factory _PhoneModel(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'image') final String? image}) = _$_PhoneModel;

  factory _PhoneModel.fromJson(Map<String, dynamic> json) =
      _$_PhoneModel.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneModelCopyWith<_$_PhoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}
