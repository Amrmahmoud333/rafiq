import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/authentication/forget_API.dart';
import 'package:rafiq/data/data_API/authentication/login_API.dart';
import 'package:rafiq/data/data_API/profile/cover_image_API.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/data_API/authentication/register_api.dart';
import 'package:rafiq/data/data_API/profile/marker_API.dart';
import 'package:rafiq/data/data_API/profile/post_API.dart';
import 'package:rafiq/data/data_API/profile/update_user_info_API.dart';
import 'package:rafiq/data/data_API/profile/user_data_API.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:rafiq/logic/cubit/forget_cubit/forget_cubit.dart';
import 'package:rafiq/logic/cubit/login_cubit/login_cubit.dart';
import 'package:rafiq/logic/cubit/marker_cubit/marker_cubit.dart';
import 'package:rafiq/logic/cubit/post/post_screen_cubit/post_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/logic/cubit/update_user_info_cubit/update_user_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/router/app_router.dart';

import 'logic/state_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CahchHelper.init();
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(
          DevicePreview(enabled: false, builder: (context) => const MyApp()));
    },
    blocObserver: StateObserver(),
  );
}

final AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({
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
          create: (context) => UserDataCubit(userDataRepo: UserDataAPI()),
        ),
        BlocProvider<ForgetCubit>(
          create: (context) => ForgetCubit(forgetPasswordRepo: ForgetApi()),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(coverImageRepo: CoverImageAPI()),
        ),
        BlocProvider<MarkerCubit>(
          create: (context) => MarkerCubit(markerRepo: MarkerAPI()),
        ),
        BlocProvider<UpdateUserCubit>(
          create: (context) =>
              UpdateUserCubit(updataUserInfoRepo: UpdateUserInfoAPI()),
        ),
        BlocProvider<AddPostCubit>(
          create: (context) => AddPostCubit(postRepo: PostAPI()),
        ),
        BlocProvider<PostCubit>(
          create: (context) => PostCubit(),
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

// TODO Sign in && login with google or facebook (We or backEnd)
// TODO Make Map in Profile screen
// TODO   الجزء العلوي ف السكرول ال تاب بار لما برفعها لاعلي الشاشه
// TODO Add Maps to IOS