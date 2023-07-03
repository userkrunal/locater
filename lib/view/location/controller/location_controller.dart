import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController
{
  RxDouble zoom = 11.0.obs;
  Rx<LatLng> c = LatLng(21.1702,72.8311).obs;
  Rx<Completer<GoogleMapController>> completer = Completer<GoogleMapController>().obs;
  Rx<Position> position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0).obs;

  Future<void> permission()
  async {
    var status = Permission.location.status;

    if(await status.isDenied)
    {
      Permission.location.request();
    }
    else
    {
      return null;
    }

  }

  Future<void> currentLocation()
  async {
    position.value = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    c.value=LatLng(position.value.latitude, position.value.longitude);
    update();
  }
  RxSet<Marker> Markers()
  {
    return {
      Marker(
        markerId: MarkerId("Current Position"),
        position: LatLng(position.value.latitude,position.value.longitude),
        infoWindow: InfoWindow(title: "Current Position"),
      )
    }.obs;
  }

}