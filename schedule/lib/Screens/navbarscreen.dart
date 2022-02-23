import 'package:bottomnavbar/Page/Map/map.dart';
import 'package:bottomnavbar/Page/camerapage.dart';
import 'package:bottomnavbar/Page/schedulepage.dart';
import 'package:bottomnavbar/Page/profilepage.dart';
import 'package:flutter/material.dart';

class navbarscreen extends StatefulWidget {
  const navbarscreen({Key? key}) : super(key: key);

  @override
  _navbarscreenState createState() => _navbarscreenState();
}

class _navbarscreenState extends State<navbarscreen> {
  int currentIndex =0;
  final screens =[
    SchedulePage(),
    MapPage(),
    CameraPage(),
    ProfilePage(),
  ];
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index)=>setState(() => currentIndex=index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: "Schedule",
              backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Camera",
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }
}
