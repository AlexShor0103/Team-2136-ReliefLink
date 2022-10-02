import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapping extends StatefulWidget {
  const Mapping({Key? key}) : super(key: key);

  @override
  MapSampleState createState() => MapSampleState();
}

class MapSampleState extends State<Mapping> {
  static const double _defaultLat = 33.772163578;
  static const double _defaultLong = -84.390165106;
  static const CameraPosition _defaultLocation = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 15);
  MapType _currentMapType = MapType.normal;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _changeMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
        GoogleMap(
          initialCameraPosition: _defaultLocation,
          mapType: _currentMapType,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Container(
        padding: const EdgeInsets.only(top:24, right:12),
        alignment: Alignment.topRight,
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: _changeMapType,
              backgroundColor: Colors.green,
              child: const Icon(Icons.map_outlined, size: 30.0),
              ),
            ],
          ),
        ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
