import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);
  static const routeName = '/trip_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await CahchHelper.clearData();
            /*   print(cover);
            print(avatar);
            cover = '';
            avatar = '';*/
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            /*await CahchHelper.removeData(key: 'token').then((value) {
              if (value) {
                
                //CahchHelper.removeData(key: 'rememberMe');
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              }
            });*/
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
