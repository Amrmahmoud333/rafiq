import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController _mapController;
  @override
  void initState() {
    super.initState();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _mapController.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.height * (n / 393);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h(30)),
            child: Container(
              width: w(150),
              height: h(212.6),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff5B618A),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(7, 5),
                  ),
                ],
              ),
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.43296265331129, -122.08832357078792),
                  zoom: -150,
                ),
                onMapCreated: onMapCreated,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
