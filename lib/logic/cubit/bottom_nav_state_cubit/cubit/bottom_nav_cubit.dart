import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/views/home/screens/home_screen.dart';
import 'package:rafiq/views/notification/screens/notification_screen.dart';
import 'package:rafiq/views/profile/screens/profile_screen.dart';
import 'package:rafiq/views/trip/screens/trip_screen.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitialState());

  int currentIndex = 0;
  List<Widget> bottumNavScreen = [
    HomeScreen(),
    TripScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  void changeIndexForNavScreen(index) {
    currentIndex = index;
    emit(BottomNavChangeIndexState());
  }
}
