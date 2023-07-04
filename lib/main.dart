import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locater/view/home_screen.dart';
import 'package:locater/view/location/view/first_screen.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //'/':(p0) => LocationScrenn(),
        '/':(p0) => HomeScreen(),
      },
    )
  );
}