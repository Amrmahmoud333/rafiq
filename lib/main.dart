import 'package:flutter/material.dart';
import 'package:rafiq/views/Forget%20password/first_forget_password.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstForgetPassword(),
      debugShowCheckedModeBanner: false,
    );
  }
}
