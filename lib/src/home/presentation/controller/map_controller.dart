import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:goo_rent/enum/storage_key.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/src/home/data/location_model/location_model.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';

class MapController extends GetxController {
  final currentAddress = const LocationModel().obs;
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

  Future<LocationModel> getCurrentAddress() async {
    await getCurrentPosition().then((currentLocation) async {
      var late = currentLocation.latitude;
      var long = currentLocation.longitude;
      await placemarkFromCoordinates(late, long,
              localeIdentifier: Get.locale?.languageCode ?? "km_KH")
          .then((List<Placemark> placemarks) async {
        var place = placemarks[0];
        currentAddress.value = LocationModel(
          street: place.street,
          village: place.name,
          commune: place.thoroughfare,
          distict: place.subLocality,
          provice: place.locality,
          country: place.country,
        );
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
      currentAddress.value = LocationModel.fromJson(data);
    }
  }
}
