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
      zoom: 13);
  MapType _currentMapType = MapType.normal;

  static int count = 0;
  final Set<Marker> _markers = {};
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.768677, -84.386786),
        infoWindow: InfoWindow(
          title: 'Emory University Hospital Midtown',
        )
    ),

    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.809319, -84.395363),
        infoWindow: InfoWindow(
          title: 'Piedmont Hospital',
        )
    ),

    Marker(
        markerId: MarkerId('3'),
        position: LatLng(33.774831, -84.403125),
        infoWindow: InfoWindow(
          title: 'Stamps Student Health Center',
        )
    ),

    Marker(
      markerId: MarkerId('4'),
      position: LatLng(33.773425638560056,-84.38915953183991),
      infoWindow: InfoWindow(
        title: 'Concentra Urgent Care'
      )
    ),
    
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(33.77248152717527,-84.37556854746298),
      infoWindow: InfoWindow(
        title: 'Grady Health Center'
      ),
    )
  ];

  Completer<GoogleMapController> _controller = Completer();

  void _changeMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _addMarker() {
    count = count + 1;
    if(count % 2 == 1) {
      setState(() {
        _markers.addAll(_list);
      });
    }
    else {
      setState(() {
        _markers.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _defaultLocation,
            mapType: _currentMapType,
            markers: _markers,
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
                const SizedBox(height:20.0),
                FloatingActionButton(
                    onPressed: _addMarker,
                    backgroundColor: Colors.redAccent,
                    child: const Icon(Icons.medical_services_outlined, size: 30.0)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
