// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory LocationModel({
    String? street,
    String? village,
    String? commune,
    String? distict,
    String? provice,
    String? country,
    // String? commune,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

// import 'package:primary/data/enum/storage_box.dart';
// import 'package:primary/data/enum/storage_keys.dart';
// import 'package:primary/data/models/user/user.dart';
// import 'package:primary/utils/helpers/accessor.dart';
// import 'package:primary/utils/services/storage.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'app_state.freezed.dart';
// part 'app_state.g.dart';

// @HiveType(typeId: 0)
// @unfreezedNoCopy
// class AppState extends ChangeNotifier with _$AppState {
//   static const key = StorageKeys.appState;

//   static String? _testString;
//   static String? _absolutePathDirectory;
//   static final List<String> _assets = [];

//   String get testString => _testString ?? '';
//   String get absolutePathDirectory => _absolutePathDirectory ?? '';
//   List<String> get assets => _assets;
//   AppState._();

//   factory AppState({
//     @HiveField(0) String? accessToken,
//     @HiveField(1) User? user,
//   }) = _AppState;

//   Future save() async {
//     await StorageService.put(
//       key: key,
//       data: this,
//       boxName: StorageBox.cacheBox,
//     );
//     notifyListeners();
//   }

//   factory AppState.fromStorage() {
//     final result = StorageService.get(
//       key: key,
//       boxName: StorageBox.cacheBox,
//       defaultValue: AppState(),
//     );
//     return result;
//   }
//   Future resetUser() async {
//     user = null;
//     save();
//   }

//   factory AppState.fromJson(Map<String, Object?> json) =>
//       _$AppStateFromJson(json);
// }
