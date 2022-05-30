import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rafiq/logic/cubit/notification_cubit/notification_cubit.dart';
import 'package:rafiq/views/notification/widgets/custom_toggle_button.dart';
import 'package:rafiq/views/notification/widgets/notification_widget.dart';

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
                  CustomToggleButton(cubit: cubit),
                ],
              ),
            ),
            SizedBox(height: h(33)),
            SizedBox(
              width: w(353),
              child: const NotificationWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
