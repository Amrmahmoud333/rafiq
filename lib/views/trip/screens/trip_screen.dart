import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/logic/cubit/login_cubit/login_cubit.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/main_pages/main_home/screens/main_home.dart';
import 'package:rafiq/views/router/app_router.dart';

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
              if (value)
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            });
          },
          child: Text('child'),
        ),
      ),
    );
  }
}
