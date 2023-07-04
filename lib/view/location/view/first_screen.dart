import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locater/view/location/controller/location_controller.dart';

class LocationScrenn extends StatefulWidget {
  const LocationScrenn({Key? key}) : super(key: key);
  @override
  State<LocationScrenn> createState() => _LocationScrennState();
}

class _LocationScrennState extends State<LocationScrenn> {
  LocationController locationController=Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
       body: Center(
         child: Obx(
               () => GoogleMap(
                zoomControlsEnabled: false,
                  onMapCreated:(controller){
                   locationController.googleMapController = controller;
                  }, initialCameraPosition: CameraPosition(
                 target: LatLng(locationController.lat.value,locationController.long.value),
                 zoom: 5
               ),
                markers: {
                  Marker(
                      markerId: MarkerId('id 1'),
                      position: LatLng(locationController.lat.value,locationController.long.value),
                    draggable: true,
                    infoWindow: InfoWindow(title: 'Location')
                  )
                },
                 mapType: MapType.hybrid,
           ),
         ),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          locationController.latlong();
        },child: Icon(Icons.my_location_rounded),
      ),
    ),
    );
  }
}
