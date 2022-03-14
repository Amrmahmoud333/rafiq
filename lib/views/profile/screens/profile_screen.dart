import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
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
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/followers_icon.svg',
                    width: w(17.82),
                    height: h(17.82),
                    fit: BoxFit.none,
                  ),
                  SizedBox(
                    width: w(12.25),
                  ),

                  //TODO get number of posts
                  const AutoSizeText(
                    '0 Posts',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
