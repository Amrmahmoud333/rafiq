import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_Information.dart';
import 'package:rafiq/views/profile/widgets/profile_home.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';
import 'package:rafiq/views/profile/widgets/row_data.dart';
import 'package:rafiq/views/shared/bottom/animated_bottom_navigation_bar.dart';
import 'package:rafiq/views/shared/custom_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  //  final iconList = <IconData>[
  //    Icons.brightness_5,
  //    Icons.brightness_4,
  //    Icons.brightness_6,
  //    Icons.brightness_7,
  //  ];

  final iconList = <SvgPicture>[
    SvgPicture.asset('assets/images/home_icon.svg'),
    SvgPicture.asset('assets/images/home_icon.svg'),
    SvgPicture.asset('assets/images/home_icon.svg'),
    SvgPicture.asset('assets/images/home_icon.svg'),
  ];
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: const Color(0xffE8DEEB),
        ),
        body: Column(
          children: [
            SizedBox(
              height: h(288),
              child: Stack(
                children: const [
                  Cover(),
                  ProfilePhoto(),
                  ProfileName(),
                  EditButton(),
                ],
              ),
            ),
            SizedBox(
              height: h(31),
            ),
            const ProfileInformation(),
            SizedBox(
              height: h(25),
            ),
            const ProfileHome(),
            // CutsomBottomNavigationBar(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Container(
            width: w(65),
            height: h(65),
            child: const Icon(Icons.add),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xffB99AC2), Color(0xff906F9ABD)])),
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          backgroundColor: const Color(0xffE8DEEB),
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) => {
            //setState(() => _bottomNavIndex = index)
          },
        ),
      ),
    );
  }
}
