import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  static const double _defaultLat = 33.772163578;
  static const double _defaultLong = -84.390165106;
  static const CameraPosition _defaultLocation = CameraPosition(
      target: LatLng(_defaultLat, _defaultLong),
      zoom: 13);
  MapType _currentMapType = MapType.normal;
  final Set<Marker> _markers = {};
  final Set<Marker> _policeMarker = {};
  static int count = 0;

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
  ];

  final List<Marker> _policeList = const [
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(33.781237774545616, -84.4038649460332),
        infoWindow: InfoWindow(
          title: 'Georgia Tech Police Department',
        )
    ),

    Marker(
        markerId: MarkerId('5'),
        position: LatLng(33.76488029632767, -84.39925166189168),
        infoWindow: InfoWindow(
          title: 'GWCC Police Department',
        )
    ),

    Marker(
        markerId: MarkerId('6'),
        position: LatLng(33.76388134540889, -84.3725583176755),
        infoWindow: InfoWindow(
          title: 'Atlanta Police Department Boulevard Precinct',
        )
    ),
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

  void _addPoliceMarker() {
    count = count + 1;
    if(count % 2 == 1) {
      setState(() {
        _markers.addAll(_policeList);
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
                const SizedBox(height:20.0),
                FloatingActionButton(
                    onPressed: _addPoliceMarker,
                    backgroundColor: Colors.blueAccent,
                    child: const Icon(Icons.local_police, size: 30.0)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

