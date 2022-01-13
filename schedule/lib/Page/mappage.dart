import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapExample extends StatefulWidget{
  @override
  _MapPageExample createState() => _MapPageExample();
  }

class _MapPageExample extends State<MapExample> {
  static const _initialCameraPosition= CameraPosition(target: LatLng(41.6086, 21.7453),
  zoom: 11.5);

  GoogleMapController? _newGoogleMapController;
  @override
  void dispose(){
    _newGoogleMapController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
              GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: _initialCameraPosition,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (controller) => _newGoogleMapController=controller,
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
