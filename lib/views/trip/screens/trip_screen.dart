import 'package:flutter/material.dart';
import 'package:rafiq/views/main_pages/main_home/screens/main_home.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);
  static const routeName = '/trip_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainHomeScreen(),
                ));
          },
          child: Text('child'),
        ),
      ),
    );
  }
}
