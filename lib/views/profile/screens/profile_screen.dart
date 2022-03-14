import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';

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
                const ProfilePhoto(),
                Positioned(
                  top: h(225),
                  left: w(160),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AutoSizeText(
                        'Amr Mahmoud',
                        style: TextStyle(
                          color: Color(0xff5B618A),
                          fontSize: 24,
                          //fontFamily: 'DavidLibre',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AutoSizeText(
                        '  @AmrMa',
                        style: TextStyle(
                          color: Color(0xff5B618A),
                          fontSize: 18,
                          fontFamily: 'DavidLibre',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: h(190),
                  left: w(352),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: w(27),
                      height: h(35),
                      decoration: BoxDecoration(
                        color: const Color(0xffE8DEEB),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff5B618A).withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
