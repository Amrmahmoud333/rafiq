import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/data_API/authentication/login_API.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/data_API/authentication/register_api.dart';
import 'package:rafiq/logic/cubit/login_cubit/login_cubit.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(authRepo: RegisterAPI()),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(loginRepo: LoginAPI()),
        ),
      ],
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


// TODO Mustafa 
// TODO Make style file
// TODO work with InputFeild
// TODO Make forget password API


// TODO Validate Third sgin up inputs
// TODO remember me (Shared pref) 
// TODO sign in && login with google or facebook 
// TODO Profile UI