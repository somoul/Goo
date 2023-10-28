import 'package:freezed_annotation/freezed_annotation.dart';

part 'SearchTypeRentModel.freezed.dart';
part 'SearchTypeRentModel.g.dart';

@freezed
class SearchTypeRentModel with _$SearchTypeRentModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory SearchTypeRentModel({
    int? id,
    String? keyword,
    int? num,
  }) = _SearchTypeRentModel;

  factory SearchTypeRentModel.fromJson(Map<String, dynamic> json) =>
      _$SearchTypeRentModelFromJson(json);
}
