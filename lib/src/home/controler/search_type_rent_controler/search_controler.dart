import 'package:get/get.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';

import '../../data/search_type_rent_model/SearchTypeRentModel.dart';

class SearchTypeRentController extends GetxController {
  var isLodingSearchTyp = false.obs;
  final typeSearchRent = "".obs;
  final apiHelper = ApiHelper();

  final searchTypeRentModel = const SearchTypeRentModel().obs;
  final listSearchTypeRentModel = <SearchTypeRentModel>[].obs;

  Future<void> onSearchTypeRen() async {
    await apiHelper
        .onRequest(
      isAuthorize: true, methode: METHODE.get,
      url: "/search?q=${typeSearchRent.value}",
      // isAuthorize: false,
      // url: "banners",
      // methode: METHODE.get,
    )
        .then((response) {
      var jsonData = response['data'];
      listSearchTypeRentModel.clear();
      jsonData.map((json) {
        searchTypeRentModel.value = SearchTypeRentModel.fromJson(json);
        listSearchTypeRentModel.add(searchTypeRentModel.value);
      }).toList();
      // isfetchLoadingBanner(false);
    }).onError((ErrorModel error, stackTrace) {
      BaseToast.showErorrBaseToast('${error.bodyString['message']}');
    });
  }
}//SearchTypeRentModel
