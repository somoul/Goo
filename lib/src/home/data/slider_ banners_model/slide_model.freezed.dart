// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slide_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlideModel _$SlideModelFromJson(Map<String, dynamic> json) {
  return _SlideModel.fromJson(json);
}

/// @nodoc
mixin _$SlideModel {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get position =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlideModelCopyWith<SlideModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlideModelCopyWith<$Res> {
  factory $SlideModelCopyWith(
          SlideModel value, $Res Function(SlideModel) then) =
      _$SlideModelCopyWithImpl<$Res, SlideModel>;
  @useResult
  $Res call(
      {int? id,
      String? image,
      String? link,
      String? status,
      String? position,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$SlideModelCopyWithImpl<$Res, $Val extends SlideModel>
    implements $SlideModelCopyWith<$Res> {
  _$SlideModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? link = freezed,
    Object? status = freezed,
    Object? position = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlideModelCopyWith<$Res>
    implements $SlideModelCopyWith<$Res> {
  factory _$$_SlideModelCopyWith(
          _$_SlideModel value, $Res Function(_$_SlideModel) then) =
      __$$_SlideModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? image,
      String? link,
      String? status,
      String? position,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$$_SlideModelCopyWithImpl<$Res>
    extends _$SlideModelCopyWithImpl<$Res, _$_SlideModel>
    implements _$$_SlideModelCopyWith<$Res> {
  __$$_SlideModelCopyWithImpl(
      _$_SlideModel _value, $Res Function(_$_SlideModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? link = freezed,
    Object? status = freezed,
    Object? position = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_SlideModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SlideModel implements _SlideModel {
  const _$_SlideModel(
      {this.id,
      this.image,
      this.link,
      this.status,
      this.position,
      @JsonKey(name: 'image_url') this.imageUrl});

  factory _$_SlideModel.fromJson(Map<String, dynamic> json) =>
      _$$_SlideModelFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
  @override
  final String? link;
  @override
  final String? status;
  @override
  final String? position;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'SlideModel(id: $id, image: $image, link: $link, status: $status, position: $position, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlideModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, image, link, status, position, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlideModelCopyWith<_$_SlideModel> get copyWith =>
      __$$_SlideModelCopyWithImpl<_$_SlideModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlideModelToJson(
      this,
    );
  }
}

abstract class _SlideModel implements SlideModel {
  const factory _SlideModel(
      {final int? id,
      final String? image,
      final String? link,
      final String? status,
      final String? position,
      @JsonKey(name: 'image_url') final String? imageUrl}) = _$_SlideModel;

  factory _SlideModel.fromJson(Map<String, dynamic> json) =
      _$_SlideModel.fromJson;

  @override
  int? get id;
  @override
  String? get image;
  @override
  String? get link;
  @override
  String? get status;
  @override
  String? get position;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_SlideModelCopyWith<_$_SlideModel> get copyWith =>
      throw _privateConstructorUsedError;
}
