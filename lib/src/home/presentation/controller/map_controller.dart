import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/data/location_model/location_model.dart';

class MapController extends GetxController {
  final currentAddress = const LocationModel().obs;
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<LocationModel> getCurrentAddress() async {
    await getCurrentPosition().then((currentLocation) async {
      var late = currentLocation.latitude;
      var long = currentLocation.longitude;
      await placemarkFromCoordinates(late, long,
              localeIdentifier: Get.locale?.languageCode ?? "km_KH")
          .then((List<Placemark> placemarks) {
        var place = placemarks[0];
        // print('----------------------->>>>>>>1 ${place.country}');
        // print('----------------------->>>>>>>2 ${place.isoCountryCode}');
        // print('----------------------->>>>>>>3 ${place.locality}');
        // print('----------------------->>>>>>>4 ${place.postalCode}');
        // print('----------------------->>>>>>>5 ${place.street}');
        // print('----------------------->>>>>>>6 ${place.subAdministrativeArea}');
        // print('----------------------->>>>>>>7 ${place.subLocality}');
        // print('----------------------->>>>>>>8 ${place.subThoroughfare}');
        // print('----------------------->>>>>>>9 ${place.name}');
        // print('----------------------->>>>>>>10 ${place.locality}');
        currentAddress.value = LocationModel(
          street: place.street,
          village: place.name,
          commune: place.thoroughfare,
          distict: place.subLocality,
          provice: place.locality,
          country: place.country,
        );
        // print('----------------------->>>>>>>10 ${place.}');
      }).catchError((_) {});
    });

    return currentAddress.value;
  }
}
