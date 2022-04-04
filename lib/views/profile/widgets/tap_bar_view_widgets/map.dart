import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rafiq/data/models/add_marker_model.dart';
import 'package:rafiq/logic/cubit/marker_cubit/marker_cubit.dart';

class Maps extends StatelessWidget {
  late GoogleMapController _mapController;

  Set<Marker> myMarkers = Set<Marker>(); // collection

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MarkerCubit>(context);
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.height * (n / 393);
    }

    handelTap(LatLng latLng) {
      cubit.addMarker(AddMarkRequestModel(
        type: 'done',
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      ));
    }

    Future<void> onMapCreated(GoogleMapController controller) async {
      _mapController = controller;
      String value = await DefaultAssetBundle.of(context)
          .loadString('assets/map_style.json');
      _mapController.setMapStyle(value);
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
                  target: LatLng(10, 20),
                  zoom: 3,
                ),
                onMapCreated: onMapCreated,
                markers: myMarkers,
                onTap: handelTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
