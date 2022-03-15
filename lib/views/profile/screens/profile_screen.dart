import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rafiq/theme.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_home.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';
import 'package:rafiq/views/profile/widgets/row_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    final autoSizeGroup = AutoSizeGroup();
    var _bottomNavIndex = 0; //default index of a first screen

    late AnimationController _animationController;
    late Animation<double> animation;
    late CurvedAnimation curve;
    final iconList = <IconData>[
      Icons.brightness_5,
      Icons.brightness_4,
      Icons.brightness_6,
      Icons.brightness_7,
    ];

    // final iconList = <SvgPicture>[
    //   SvgPicture.asset('assets/images/icons/home_icon.svg'),
    //   SvgPicture.asset('assets/images/icons/home_icon.svg'),
    //   SvgPicture.asset('assets/images/icons/home_icon.svg'),
    //   SvgPicture.asset('assets/images/icons/home_icon.svg'),
    // ];

//    final iconList = <ImageIcon>[
//     const ImageIcon(
//        AssetImage('assets/images/icons/home_icon.png'),
//        color: Color(0xFF3A5A98),
//      ),
//    const  ImageIcon(
//        AssetImage('assets/images/icons/notifications_icon.png'),
//        color: Color(0xFF3A5A98),
//      ),
//   const   ImageIcon(
//        AssetImage('images/trip_more.png'),
//        color: Color(0xFF3A5A98),
//      ),
//    const  ImageIcon(
//        AssetImage('images/user_more.png'),
//        color: Color(0xFF3A5A98),
//      ),
//    ];

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RowData(
                  imagePath: 'assets/images/posts_icon.svg',
                  text: '0 Posts',
                  sizedWidth: 12.25,
                ),
                SizedBox(height: h(12)),
                const RowData(
                  imagePath: 'assets/images/followers_icon.svg',
                  text: '0 Followers',
                  sizedWidth: 6.66,
                ),
                SizedBox(height: h(12)),
                const RowData(
                  imagePath: 'assets/images/location_icon.svg',
                  text: 'From Egypt',
                  sizedWidth: 5,
                ),
                SizedBox(height: h(12)),

                // TODO make it optional
                SizedBox(
                  height: h(36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RowData(
                        imagePath: 'assets/images/lives_in_icon.svg',
                        text: 'Lives in Ismailia',
                        sizedWidth: 4.71,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: w(5)),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/images/insta_icon.svg',
                                  width: w(31),
                                  height: h(31),
                                ),
                              ),
                            ),
                            SizedBox(width: w(9)),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/images/facebook_icon.svg',
                                  width: w(31),
                                  height: h(31),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h(25),
            ),
            const ProfileHome(),
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
          //other params
        ),
      ),
    );
  }
}
