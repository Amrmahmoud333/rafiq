import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: const Color(0xffE8DEEB),
      ),
      body: Column(
        children: [
          SizedBox(
            height: h(288),
            child: Stack(
              children: [
                const Cover(),
                Positioned(
                  top: h(145),
                  left: w(9),
                  child: Container(
                    width: w(142),
                    height: h(142),
                    decoration: BoxDecoration(
                      color: const Color(0xff5B618A),
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: const Color(0xffE8DEEB), width: 2),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/amr.jpg'),
                      ),
                    ),
                    //   child: SvgPicture.asset(
                    //     'assets/images/profile.svg',
                    //     width: w(70),
                    //     height: h(70),
                    //   ),
                  ),
                ),
              ],
            ),
          ), // send image
        ],
      ),
    );
  }
}
