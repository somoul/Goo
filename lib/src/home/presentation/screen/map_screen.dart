import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:goo_rent/utils/extension/widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controler/search_type_rent_controler/search_controler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _mapCon = Get.put(GMapController());
  final _SearchTypeRentController = Get.put(SearchTypeRentController());
  bool _displayAddress = false;
  bool _gettingAddress = false;

  // Set<Marker> markers = {};
  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng _centerPinPosition = const LatLng(11.5760605, 104.9231257);

  Position? _currentPosition;

  double get _late => _centerPinPosition.latitude;
  double get _long => _centerPinPosition.longitude;

  _getCameraPosition() async {
    _currentPosition = await _mapCon.getCurrentPosition();
    _centerPinPosition =
        LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
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

  Future _onSaveAddress(String address, double late, double long) async {
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
                    ? Stack(
                        children: [
                          GoogleMap(
                            // myLocationEnabled: true,
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: _centerPinPosition,
                              zoom: 15,
                            ),
                            // mapToolbarEnabled: false,
                            zoomControlsEnabled: false,
                            myLocationButtonEnabled: false,
                            // onLongPress: '',
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                              setState(() {
                                _displayAddress = true;
                              });
                            },
                            onCameraIdle: () async {
                              await _getAddress(_late, _long);
                              _SearchTypeRentController.latMap.value = _late;
                              _SearchTypeRentController.longMap.value = _long;
                            },
                            onCameraMove: _onCameraMove,
                            // markers: {
                            //   Marker(
                            //     icon: _markerIcon,
                            //     position: LatLng(_late, _long),
                            //     markerId: const MarkerId('1'),
                            //     draggable: true,
                            //   ),
                            // },
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 35),
                              child: Icon(
                                Icons.location_pin,
                                color: AppConstant.kPrimaryColor,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: Platform.isAndroid
                              ? const CircularProgressIndicator(strokeWidth: 3)
                              : const CupertinoActivityIndicator(),
                        ),
                      ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 30, top: 45),
                child: CustomButton(
                  title: 'Save Your Location'.tr,
                  onPressed: _mapCon.currentAddress.value == ''
                      ? null
                      : () {
                          _onSaveAddress(
                              _mapCon.currentAddress.value, _late, _long);
                        },
                ),
              )
            ],
          ),
          // if (_displayAddress && _mapCon.currentAddress.value != "")
          Positioned(
            left: 15,
            right: 15,
            bottom: 95,
            child: AnimatedSize(
              curve: Curves.linear,
              duration: const Duration(milliseconds: 200),
              child: _displayAddress && _mapCon.currentAddress.value != ""
                  ? InkWell(
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
                                  if (_gettingAddress)
                                    SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Platform.isAndroid
                                          ? const CircularProgressIndicator(
                                              strokeWidth: 2)
                                          : const CupertinoActivityIndicator(),
                                    ).pl(10)
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
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  _onCameraMove(CameraPosition position) {
    setState(() {
      _centerPinPosition =
          LatLng(position.target.latitude, position.target.longitude);
    });
  }

  Future<void> _getAddress(double late, double long) async {
    setState(() {
      _gettingAddress = true;
    });
    var fullAddress = await _mapCon.getAddressFramMap(late: late, long: long);
    if (fullAddress != null) {
      _mapCon.currentAddress.value = fullAddress;
    }
    setState(() {
      _gettingAddress = false;
    });
  }
}
