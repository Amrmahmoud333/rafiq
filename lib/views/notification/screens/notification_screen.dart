import 'package:flutter/material.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/chach_helper.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  static const routeName = '/notification_screen';
  @override
  String? token = CahchHelper.getData(key: 'token');
  bool? rememberMe = CahchHelper.getData(key: 'rememberMe');
  List<String> list = [
    'assets/images/Done.png',
    'assets/images/Forget password.png'
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(token),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              print('$fIRSTNAME+$lASTNAME+$lIVEIN');
              //   ImageViewer.showImageSlider(images: list);
            },
            child: const Text('child'),
          ),
        ],
      ),
    );
  }
}
//mustafa