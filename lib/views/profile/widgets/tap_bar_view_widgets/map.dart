import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rafiq/core/themes/theme.dart';

class Maps extends StatelessWidget {
  Maps({Key? key}) : super(key: key);

  List<Widget> maps = [
    AutoSizeText(
      'No maps yet 12',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
  ];

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
                    offset: Offset(7, 5), // changes position of shadow
                  ),
                ],
              ),
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.43296265331129, -122.08832357078792),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
