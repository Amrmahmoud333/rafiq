import 'package:flutter/material.dart';
import 'package:rafiq/data/chach_helper.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  static const routeName = '/notification_screen';
  @override
  String? token = CahchHelper.getData(key: 'token');
  bool? rememberMe = CahchHelper.getData(key: 'rememberMe');

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(rememberMe);
      }),
      body: const Center(
        child: Text('notifications'),
      ),
    );
  }
}
