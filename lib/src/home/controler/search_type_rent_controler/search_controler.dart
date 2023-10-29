import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/loading_dialoge.dart';

import '../../data/search_type_rent_model/SearchTypeRentModel.dart';

class SearchTypeRentController extends GetxController {
  var isLodingSearchTyp = false.obs;
  final typeSearchRent = "".obs;
  final apiHelper = ApiHelper();

  final searchTypeRentModel = const SearchTypeRentModel().obs;
  final listSearchTypeRentModel = <SearchTypeRentModel>[].obs;

  Future<void> onSearchTypeRen() async {
    print("===== show 11=====");
    await apiHelper
        .onRequest(
      isAuthorize: true, methode: METHODE.get,
      url: "/search?q=${typeSearchRent.value}",
      // isAuthorize: false,
      // url: "banners",
      // methode: METHODE.get,
    )
        .then((response) {
      print("===== show 22222=====");
      var jsonData = response['data'];
      listSearchTypeRentModel.value.clear();
      jsonData.map((json) {
        print("===== show 3333=====:$json");
        searchTypeRentModel.value = SearchTypeRentModel.fromJson(json);
        listSearchTypeRentModel.add(searchTypeRentModel.value);
        print("===== show 44=====");
        print("=========show listSearch :$listSearchTypeRentModel");
      }).toList();
      // isfetchLoadingBanner(false);
    }).onError((ErrorModel error, stackTrace) {
      BaseToast.showErorrBaseToast('${error.bodyString['message']}');
    });
  }
}//SearchTypeRentModel
