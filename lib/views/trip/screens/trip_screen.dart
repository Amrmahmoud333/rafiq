import 'package:flutter/material.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);
  static const routeName = '/trip_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            CahchHelper.removeData(key: 'token').then((value) {
              if (value) {
                CahchHelper.removeData(key: 'rememberMe');
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              }
            });
          },
          child: Text(
            'Log out',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
