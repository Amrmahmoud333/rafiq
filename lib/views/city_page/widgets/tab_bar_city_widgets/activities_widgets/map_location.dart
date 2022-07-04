import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActivityMapLocation extends StatefulWidget {
  static const routeName = '/map_location';
  final double latitude, longitude;
  const ActivityMapLocation(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  @override
  State<ActivityMapLocation> createState() => ActivityMapLocationState();
}

class ActivityMapLocationState extends State<ActivityMapLocation> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 30,
        ),
        onMapCreated: (GoogleMapController controller) async {
          GoogleMapController _mapController = controller;

          String value = await DefaultAssetBundle.of(context)
              .loadString('assets/map_style.json');
          _mapController.setMapStyle(value);
          _controller.complete(controller);
        },
      ),
    );
  }
}
