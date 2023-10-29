// import 'package:get/get.dart';
// import 'package:goo_rent/cores/utils/api_helper.dart';
// import 'package:goo_rent/cores/utils/loading_dialoge.dart';
// import 'package:goo_rent/cores/utils/loading_helper.dart';
// import 'package:goo_rent/src/property_detail/data/property_models.dart';

// class FavoriteController extends GetxController {
//   final _apiHelper = ApiHelper();
//   final favoriteModel = PropertyModel().obs;
//   final favoriteData = PropertyModelResponse().obs;

//   bool get isEmptyFavorite => favoriteData.value.propertyList?.isEmpty ?? true;
//   Future<void> onFavorit({required String propertyId}) async {
//     try {
//       await _apiHelper
//           .onRequest(
//             url: '/save-post/$propertyId',
//             methode: METHODE.post,
//             isAuthorize: true,
//           )
//           .then((value) async {})
//           .onError((ErrorModel error, stackTrace) {
//         BaseToast.showErorrBaseToast('${error.bodyString['message']}');
//       });
//     } catch (e) {
//       BaseToast.showErorrBaseToast(e.toString());
//     } finally {
//       BaseDialogLoading.dismiss();
//     }
//   }
// }
