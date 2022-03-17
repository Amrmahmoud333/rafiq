import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const routeName = '/notification_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('notifications'),
      ),
    );
  }
}
