import 'package:freezed_annotation/freezed_annotation.dart';

part 'PriceRangeModel.freezed.dart';
part 'PriceRangeModel.g.dart';

@freezed
class PriceRangeModel with _$PriceRangeModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PriceRangeModel({
    required String min,
    required String max,
  }) = _PriceRangeModel;

  factory PriceRangeModel.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeModelFromJson(json);
}
