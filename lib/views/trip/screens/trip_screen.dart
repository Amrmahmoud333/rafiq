import 'package:flutter/material.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);
  static const routeName = '/trip_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('TripScreen'),
      ),
    );
  }
}
