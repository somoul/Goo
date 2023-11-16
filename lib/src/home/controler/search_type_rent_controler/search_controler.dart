import 'package:get/get.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';

import '../../data/search_type_rent_model/SearchTypeRentModel.dart';
import '../../data/search_type_rent_model/PriceRangeModel.dart';

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
    }).onError((ErrorModel error, stackTrace) {
      BaseToast.showErorrBaseToast('${error.bodyString['message']}');
    });
  }

// getApi  PriceRang
  final startSlider = 0.0.obs;
  final endSlider = 100.0.obs;
  final startPoint = 0.0.obs;
  final endPoint = 0.0.obs;
  final textSearchRent = "".obs;
  Future<void> onPriceRang() async {
    isLodingSearchTyp.value = true;
    await apiHelper
        .onRequest(
      isAuthorize: true,
      methode: METHODE.get,
      url: "/price-range",
    )
        .then(
      (response) {
        var responseData = response['data'];
        startSlider.value =
            double.parse(PriceRangeModel.fromJson(responseData).min ?? '0');
        endSlider.value =
            double.parse(PriceRangeModel.fromJson(responseData).max ?? '0');
        startPoint.value = startSlider.value;
        endPoint.value = endSlider.value;
        isLodingSearchTyp.value = false;
      },
    );
  }
}//SearchTypeRentModel
