import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController
{

  Rx<MapType> map = MapType.normal.obs;
  RxDouble lat = 19.0760.obs;
  RxDouble long = 72.8777.obs;
  GoogleMapController? googleMapController;

  Future<void> latlong()
  async {
    LocationPermission locationPermission =
        await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat.value = position.latitude;
    long.value = position.longitude;
    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat.value, long.value),
          zoom: 100,
        ),
      ),
    );
  }


}