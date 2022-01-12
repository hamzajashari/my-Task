import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget{
  @override
  _MapPage createState() => _MapPage();
  }

class _MapPage extends State<Map> {
  Completer<GoogleMapController> _controllerGoogleMap=Completer();
  GoogleMapController? newGoogleMapController;
  Position? currentPosition;
  double bottomPaddingOfMap =0;


  void locatePosition() async
  {
  Position posiiton= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  currentPosition=posiiton;
  //get current location lat lng
  LatLng latlngPosition=LatLng(posiiton.latitude,posiiton.longitude);
  //if my location moves
  CameraPosition cameraPosition =new CameraPosition(target: latlngPosition,zoom: 14);
  newGoogleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: GoogleMap(
              padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              mapType:  MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition:
              CameraPosition(
                    target:LatLng(
                        10,10
                    ),
                    zoom: 5),
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,

              onMapCreated: (GoogleMapController controller){
                _controllerGoogleMap.complete(controller);
                newGoogleMapController =controller;
                locatePosition();
              setState(() {
                bottomPaddingOfMap=200.0;
              });
              }

              ),
            ),
            Positioned(top: 30,right: 20,left: 20,child: LocationSearchBox())
        ],
      )

    );
  }
}

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText:'Enter Your Location',
          suffixIcon: Icon(Icons.search),
          contentPadding:
            const EdgeInsets.only(left: 20,bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color:Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color:Colors.white),
          )
        )
      ),
    );
  }
}
