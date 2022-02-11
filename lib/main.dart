import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:rafiq/views/sign_up/screens/sign_up.dart';
import 'package:rafiq/views/sign_up/screens/thrid_sign_up.dart';
import 'views/Forget password/screens/first_forget_password.dart';
import 'views/Forget password/screens/second_forget_password.dart';
import 'views/Forget password/screens/third_forget_password.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
