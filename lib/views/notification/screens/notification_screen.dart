import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const routeName = '/notification_screen';
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      backgroundColor: const Color(0xffEFE7F2),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h(31)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AutoSizeText(
                  'Notification',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff5B618A),
                  ),
                ),
                NeumorphicSwitch(
                  height: 32,
                  style: NeumorphicSwitchStyle(
                      activeTrackColor: Color(0xff5B618A),
                      inactiveTrackColor: Color(0xffB2B2B2)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//mustafa