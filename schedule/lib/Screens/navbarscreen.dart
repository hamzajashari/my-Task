import 'package:bottomnavbar/Page/Map/map.dart';
import 'package:bottomnavbar/Page/camerapage.dart';
import 'package:bottomnavbar/Page/myTask/Task.dart';
import 'package:bottomnavbar/Page/Profile/profilepage.dart';
import 'package:flutter/material.dart';

class navbarscreen extends StatefulWidget {
  const navbarscreen({Key? key}) : super(key: key);

  @override
  _navbarscreenState createState() => _navbarscreenState();
}

class _navbarscreenState extends State<navbarscreen> {
  int currentIndex =0;
  final screens =[
    TaskPage(),
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
            icon: Icon(Icons.task_alt_sharp),
            label: "Task",
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