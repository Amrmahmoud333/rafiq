import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rafiq/views/news_feed/screen/news_feed_screen.dart';
import 'package:rafiq/views/notification/screens/notification_screen.dart';
import 'package:rafiq/views/profile/screens/profile_screen.dart';
import 'package:rafiq/views/trip/screens/trip_screen.dart';

part 'main_home_state.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  MainHomeCubit() : super(MainHomeInitialState());

  int currentIndex = 0;
  List<Widget> bottumNavScreen = [
    const NewsFeedScreen(),
    const TripScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  void changeIndexForNavScreen(index) {
    currentIndex = index;
    emit(MainHomeChangeIndexState());
  }
}
