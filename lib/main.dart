import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/data_API/register_api.dart';
import 'package:rafiq/data/repositories/register_repo.dart';
import 'package:rafiq/logic/cubit/register_cubit.dart';
import 'package:rafiq/views/router/app_router.dart';

void main() {
  DioHelper.init();
  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    // make an instence of RegisterCubit in the root widget
    return BlocProvider(
      create: (context) => RegisterCubit(authRepo: RegisterAPI()),
      child: MaterialApp(
        title: 'Rafiq',
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'DavidLibre',
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
