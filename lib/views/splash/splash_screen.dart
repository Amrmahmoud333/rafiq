import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/views/sign_up/screens/sign_up.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return AnimatedSplashScreen(
      splash: Column(
        children: [
          SvgPicture.asset(
            'assets/images/rafiq_logo.svg',
          ),
          /*Container(
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/clouds_splash.svg',
              fit: BoxFit.cover,
            ),
          ),*/
        ],
      ),
      backgroundColor: const Color(0xffE8DEEB),
      duration: 10000,
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      nextScreen: const SignUp(),
    );
  }
}
