import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _mapCon = Get.put(GMapController());
  Set<Marker> markers = {};
  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _cameraPosition;
  Position? _currentPosition;

  _getCameraPosition() async {
    _currentPosition = await _mapCon.getCurrentPosition();
    _cameraPosition = CameraPosition(
      target: LatLng(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      ),
      zoom: 10.4746,
    );
    setState(() {});
  }

  Future<void> _markerIcons() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      Platform.isAndroid
          ? 'assets/image/marker_android.png'
          : 'assets/image/marker_ios.png',
    );
    setState(() {});
  }

  Future _onSaveAddress(String address, String late, String long) async {
    await _mapCon
        .saveAddress(address: address, late: late, long: long)
        .then((value) => {
              Navigator.pop(context, true),
            });
  }

  @override
  void initState() {
    _getCameraPosition();
    _markerIcons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var pos = MapUtils.getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Map'.tr),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: _currentPosition != null
                      ? GoogleMap(
                          // myLocationEnabled: true,

                          mapType: MapType.normal,
                          initialCameraPosition: _cameraPosition,
                          // mapToolbarEnabled: false,
                          zoomControlsEnabled: true,
                          myLocationButtonEnabled: false,
                          // onLongPress: '',
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          markers: {
                            Marker(
                              icon: _markerIcon,
                              position: const LatLng(11.562108, 104.888535),
                              markerId: const MarkerId('1'),
                              draggable: true,
                            ),
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        )),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 30, top: 45),
                child: CustomButton(
                  title: 'Save Your Location'.tr,
                  onPressed: _mapCon.currentAddress.value == ''
                      ? null
                      : () {
                          _onSaveAddress(
                            _mapCon.currentAddress.value,
                            "${_currentPosition?.latitude ?? ""}",
                            "${_currentPosition?.longitude ?? ""}",
                          );
                        },
                ),
              )
            ],
          ),
          _mapCon.currentAddress.value == ""
              ? const SizedBox()
              : Positioned(
                  left: 15,
                  right: 15,
                  bottom: 95,
                  child: InkWell(
                    // onTap: () {
                    //   // _onZoom();
                    // },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      shadowColor: Colors.grey[200],
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  fit: BoxFit.contain,
                                  color: AppConstant.kPrimaryColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Your Location'.tr,
                                  style: AppText.bodyMedium!
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  _mapCon.currentAddress.value,
                                  style: AppText.bodySmall!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
