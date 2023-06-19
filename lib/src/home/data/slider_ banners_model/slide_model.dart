import 'package:freezed_annotation/freezed_annotation.dart';
part 'slide_model.freezed.dart';
part 'slide_model.g.dart';

@freezed
class SlideModel with _$SlideModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory SlideModel({
    int? id,
    String? image,
    String? link,
    String? status,
    String? position,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _SlideModel;

  factory SlideModel.fromJson(Map<String, dynamic> json) =>
      _$SlideModelFromJson(json);
}
