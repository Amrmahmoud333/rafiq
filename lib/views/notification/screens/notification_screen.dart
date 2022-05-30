import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rafiq/logic/cubit/notification_cubit/notification_cubit.dart';

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

    var cubit = context.read<NotificationCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffEFE7F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h(31), left: w(20), right: w(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AutoSizeText(
                    'Notification',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff5B618A),
                    ),
                  ),
                  BlocBuilder<NotificationCubit, NotificationState>(
                      builder: (context, state) {
                    return Stack(
                      children: [
                        NeumorphicSwitch(
                          value: cubit.toggle,
                          duration: const Duration(milliseconds: 300),
                          onChanged: (bool isChanged) {
                            cubit.changeToggle();
                          },
                          height: h(32),
                          style: const NeumorphicSwitchStyle(
                            disableDepth: true,
                            thumbShape: NeumorphicShape.convex,
                            activeThumbColor: Color(0xffB2B2B2),
                            inactiveThumbColor: Color(0xff696969),
                            activeTrackColor: Color(0xff5B618A),
                            inactiveTrackColor: Color(0xffB2B2B2),
                          ),
                        ),
                        !cubit.toggle
                            ? Positioned(
                                top: h(11),
                                left: w(30),
                                child: const AutoSizeText(
                                  'OFF',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff696969)),
                                ),
                              )
                            : Positioned(
                                top: h(10),
                                left: w(9),
                                child: const AutoSizeText(
                                  'ON',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffDBD4DD)),
                                ),
                              ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: h(33)),
            SizedBox(
              width: w(353),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: w(353),
                      height: h(86),
                      color: const Color(0xffDBD4DD),
                      child: Row(children: [
                        SizedBox(width: w(15)),
                        Container(
                          width: w(60),
                          height: h(60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/test1.png')),
                          ),
                        ),
                        SizedBox(width: w(8)),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: h(19)),
                              child: Row(
                                children: [
                                  const AutoSizeText(
                                    'Ahmed Ahmed',
                                    style: TextStyle(
                                        color: Color(0xff5B618A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                  SizedBox(width: w(80)),
                                  const AutoSizeText(
                                    '4:30',
                                    style: TextStyle(
                                      color: Color(0xff5B618A),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: h(7)),
                            const AutoSizeText(
                              'commented to your post',
                              style: TextStyle(
                                color: Color(0xff5B618A),
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: h(17)),
                  itemCount: 15),
            ),
          ],
        ),
      ),
    );
  }
}
//mustafa
