import 'package:flutter/material.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenn extends StatefulWidget {
  const SplashScreenn({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenn> {
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return SplashScreen(
      seconds: 14,
      navigateAfterSeconds: const LoginScreen(),
      image: Image.asset('assets/images/hello-hi.gif'),
      backgroundColor: Colors.white,
      photoSize: 100.0,
    );
  }
}
