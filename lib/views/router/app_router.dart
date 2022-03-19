import 'package:flutter/material.dart';
import 'package:rafiq/views/Forget%20password/screens/first_forget_password.dart';
import 'package:rafiq/views/Forget%20password/screens/second_forget_password.dart';
import 'package:rafiq/views/Forget%20password/screens/third_forget_password.dart';
import 'package:rafiq/views/home/screens/home_screen.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/profile/screens/profile_screen.dart';
import 'package:rafiq/views/sign_up/screens/second_sign_up.dart';
import 'package:rafiq/views/sign_up/screens/sign_up.dart';
import 'package:rafiq/views/sign_up/screens/third_sign_up.dart';

import '../main_pages/main_home/screens/main_home.dart';
import '../main_pages/main_sign_up/screens/main_sign_up.dart';
import '../notification/screens/notification_screen.dart';
import '../trip/screens/trip_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainSignUpScreen());
      case SignUp.routeName:
        return MaterialPageRoute(builder: (_) => SignUp());
      case SecondSignUp.routeName:
        return MaterialPageRoute(builder: (_) => SecondSignUp());
      case ThirdSignUp.routeName:
        return MaterialPageRoute(builder: (_) => const ThirdSignUp());
      case FirstForgetPassword.routeName:
        return MaterialPageRoute(builder: (_) => FirstForgetPassword());
      case SecondForgetPassword.routeName:
        return MaterialPageRoute(builder: (_) => const SecondForgetPassword());
      case ThirdForgetPassword.routeName:
        return MaterialPageRoute(builder: (_) => const ThirdForgetPassword());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case TripScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TripScreen());
      case NotificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case MainHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainHomeScreen());
      case MainSignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainSignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
