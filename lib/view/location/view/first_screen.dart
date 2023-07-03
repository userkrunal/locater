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
  LocationController controller=Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
          },
          icon: Icon(
            Icons.map,
            color: Colors.white,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Live Location",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.zoom.value=20;
              controller.permission();
              controller.currentLocation();
            },
            icon: Icon(
              Icons.my_location_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Center(
        child: Obx(
              () => GoogleMap(
            initialCameraPosition: CameraPosition(
                target: controller.c.value, zoom: controller.zoom.value, bearing: 0, tilt: 0),
            zoomControlsEnabled: true,
            mapType: MapType.hybrid,
            markers: controller.Markers(),
          ),
        ),
      ),
    ),
    );
  }
}
