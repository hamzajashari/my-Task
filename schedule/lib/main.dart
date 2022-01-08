import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'Screens/navbarscreen.dart';
import 'Camera/camera_screen.dart';
import 'Camera/gallery_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //Ensure plugin services are initialized
  final cameras = await availableCameras(); //Get list of available cameras
  runApp(MyApp(cameras: cameras));
}
class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schedule',
      home: navbarscreen(),
    );
  }
}