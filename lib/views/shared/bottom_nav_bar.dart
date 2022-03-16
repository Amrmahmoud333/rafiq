import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/shared/bottom_nav_bar_package/animated_bottom_navigation_bar.dart';

class CustomBottomNavgiationBar extends StatefulWidget {
  int? bottomNavIndex;
  CustomBottomNavgiationBar({
    Key? key,
    required this.bottomNavIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavgiationBar> createState() =>
      _CustomBottomNavgiationBarState();
}

class _CustomBottomNavgiationBarState extends State<CustomBottomNavgiationBar> {
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
      activeIndex: widget.bottomNavIndex!,
      activeColor: const Color(0xffB99AC2),
      gapLocation: GapLocation.center,
      path: pathList,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: (index) => {setState(() => widget.bottomNavIndex = index)},
    );
  }
}
