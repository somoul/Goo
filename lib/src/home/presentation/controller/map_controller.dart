import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:goo_rent/enum/storage_key.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/src/home/presentation/data/address.dart';

class GMapController extends GetxController {
  final currentAddress = "".obs;
  final apiHelper = ApiHelper();
  late LocationPermission permission;
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      BaseToast.showErorrBaseToast('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      BaseToast.showErorrBaseToast(
          'Location permissions are permanently denied, we cannot request permissions.');
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getCurrentAddress() async {
    await getCurrentPosition().then((currentLocation) async {
      var late = currentLocation.latitude;
      var long = currentLocation.longitude;
      await placemarkFromCoordinates(late, long,
              localeIdentifier: Get.locale?.languageCode ?? "km_KH")
          .then((List<Placemark> placemarks) async {
        var place = placemarks[0];
        // LocationModel(
        //   street: place.street,
        //   village: place.name,
        //   distict: place.subLocality,
        //   commune: place.thoroughfare,
        //   provice: place.locality,
        //   country: place.country,
        // );
        currentAddress.value =
            "${place.street ?? ''} ${place.name ?? ''} ${place.subLocality} ${place.thoroughfare} ${place.locality}";
        await LocalStorage.put(
            storageKey: StorageKeys.location, value: currentAddress.value);
      }).catchError((_) {});
    });

    return currentAddress.value;
  }

  Future getLocalAddress() async {
    permission = await Geolocator.checkPermission();
    var data = await LocalStorage.get(StorageKeys.location);
    if (data != null) {
      currentAddress.value = data;
    }
  }

  ///----------------------------------------------------
  final addressModel = AddressModel().obs;

  Future saveAddress({
    required String address,
    required String late,
    required String long,
  }) async {
    BaseDialogLoading.show();

    var body = {
      "address": address,
      "lattitude": late,
      "longitude": long,
    };
    try {
      var response = await apiHelper
          .onRequest(
        url: '/post-address',
        methode: METHODE.post,
        isAuthorize: true,
        body: body,
      )
          .onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
        return;
      });
      addressModel.value = AddressModel.fromJson(response["data"]);
      await getLocalAddress();
      await LocalStorage.put(
          storageKey: StorageKeys.location, value: addressModel.value);
    } catch (_) {
    } finally {
      BaseDialogLoading.dismiss();
    }
  }
}
