import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              ElevatedButton(onPressed: () async {
                var status= await Permission.videos.status;
                {
                  if(status.isDenied)
                    {
                      await Permission.videos.request();
                    }
                  else if(await Permission.videos.isRestricted || await Permission.videos.isPermanentlyDenied)
                    {
                      openAppSettings();
                    }
                }
              }, child: Text("Videos")),
              SizedBox(height: 40),
              ElevatedButton(onPressed: () async {
                var status= await Permission.camera.status;
                {
                  if(status.isDenied)
                    {
                      await Permission.camera.request();
                    }
                  else if(await Permission.camera.isRestricted || await Permission.camera.isPermanentlyDenied)
                    {
                      openAppSettings();
                    }
                }
              }, child: Text("Camera")),
              SizedBox(height: 40),
            ],
          )
        ],
      ),
    ));
  }
}
