import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/bottom_nav_state_cubit/cubit/bottom_nav_cubit.dart';
import 'package:rafiq/views/home/screens/home_screen.dart';
import 'package:rafiq/views/profile/screens/profile_screen.dart';
import 'package:rafiq/views/shared/bottom_nav_bar_package/animated_bottom_navigation_bar.dart';

class CustomBottomNavgiationBar extends StatelessWidget {
  CustomBottomNavgiationBar({
    Key? key,
  }) : super(key: key);

  final iconList = <SvgPicture>[
    SvgPicture.asset(
      'assets/images/home_icon.svg',
      color: Colors.amber,
    ),
    SvgPicture.asset('assets/images/trip_icon.svg'),
    SvgPicture.asset('assets/images/notifications_icon.svg'),
    SvgPicture.asset('assets/images/user_icon.svg'),
  ];

  final pathList = <String>[
    'assets/images/home_icon.svg',
    'assets/images/trip_icon.svg',
    'assets/images/notifications_icon.svg',
    'assets/images/user_icon.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      backgroundColor: const Color(0xffE8DEEB),
      activeIndex: BlocProvider.of<BottomNavCubit>(context).currentIndex,
      activeColor: const Color(0xffB99AC2),
      gapLocation: GapLocation.center,
      path: pathList,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: (index) {
        BlocProvider.of<BottomNavCubit>(context).changeIndexForNavScreen(index);
      },
    );
  }
}
