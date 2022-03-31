import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/row_tap_data.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  static const routeName = '/notification_screen';
  @override
  String? token = CahchHelper.getData(key: 'token');
  bool? rememberMe = CahchHelper.getData(key: 'rememberMe');

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(token),
      ),
    );
  }
}
//mustafa