import 'package:freezed_annotation/freezed_annotation.dart';
part 'slide_categorie_model.freezed.dart';
part 'slide_categorie_model.g.dart';

@freezed
class SlideCategorieModel with _$SlideCategorieModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory SlideCategorieModel({
    int? id,
    String? name,
    String? icon,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name_kh') String? nameKh,
    @Default({}) Map<String, dynamic>? field,
  }) = _SlideCategorieModel;

  factory SlideCategorieModel.fromJson(Map<String, dynamic> json) =>
      _$SlideCategorieModelFromJson(json);
}
