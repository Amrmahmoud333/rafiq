import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/authentication/forget_API.dart';
import 'package:rafiq/data/data_API/authentication/login_API.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/data_API/authentication/register_api.dart';
import 'package:rafiq/data/data_API/user_data_API.dart';
import 'package:rafiq/logic/cubit/forget_cubit/forget_cubit.dart';
import 'package:rafiq/logic/cubit/login_cubit/login_cubit.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/main_pages/main_home/screens/main_home.dart';
import 'package:rafiq/views/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CahchHelper.init();
  DioHelper.init();

  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}

final AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
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
        BlocProvider<UserDataCubit>(
          create: (context) =>
              UserDataCubit(userDataRepo: UserDataAPI())..getUserData(),
        ),
        BlocProvider<ForgetCubit>(
          create: (context) => ForgetCubit(forgetPasswordRepo: ForgetApi()),
        ),
      ],
      child: MaterialApp(
        title: 'Rafiq',
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeOfProject.ligthTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


// TODO Mustafa 
// TODO work with InputFeild
// TODO Validate Third sgin up inputs
// TODO Remember me (Shared pref) 
// TODO Sign in && login with google or facebook (We or backEnd)
// TODO Make Map in Profile screen

