import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/authentication/forget_API.dart';
import 'package:rafiq/data/data_API/authentication/login_API.dart';
import 'package:rafiq/data/data_API/city/activities_API.dart';
import 'package:rafiq/data/data_API/city/city_Info_API.dart';
import 'package:rafiq/data/data_API/city/find_hotel_API.dart';
import 'package:rafiq/data/data_API/newsfeed_API.dart';
import 'package:rafiq/data/data_API/post_like_API.dart';
import 'package:rafiq/data/data_API/profile/cover_image_API.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/data_API/authentication/register_api.dart';
import 'package:rafiq/data/data_API/profile/get_profile_sections_API.dart';
import 'package:rafiq/data/data_API/profile/marker_API.dart';
import 'package:rafiq/data/data_API/profile/post_API.dart';
import 'package:rafiq/data/data_API/profile/update_user_info_API.dart';
import 'package:rafiq/data/data_API/profile/user_data_API.dart';
import 'package:rafiq/data/data_API/seach/search_API.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:rafiq/logic/cubit/city_activities_cubit/activities_cubit.dart';
import 'package:rafiq/logic/cubit/city_cubit/city_cubit.dart';
import 'package:rafiq/logic/cubit/city_cubit/tab_city_cubit.dart';
import 'package:rafiq/logic/cubit/city_information_cubit/city_information_cubit.dart';
import 'package:rafiq/logic/cubit/find_hotel_cubit/find_hotel_cubit.dart';
import 'package:rafiq/logic/cubit/forget_cubit/forget_cubit.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_photos_cubit/cubit/get_user_photo_cubit.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:rafiq/logic/cubit/login_cubit/login_cubit.dart';
import 'package:rafiq/logic/cubit/marker_cubit/marker_cubit.dart';
import 'package:rafiq/logic/cubit/newsfeed_cubit/newsfeed_cubit.dart';
import 'package:rafiq/logic/cubit/notification_cubit/notification_cubit.dart';
import 'package:rafiq/logic/cubit/post_like_cubit/post_like_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';
import 'package:rafiq/logic/cubit/trip_cubit/trip_cubit_cubit.dart';
import 'package:rafiq/logic/cubit/update_user_info_cubit/update_user_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/router/app_router.dart';

import 'logic/state_observer.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.purple,
  ));
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
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(searchAPI: SearchAPI()),
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
        BlocProvider<GetUserPostsCubit>(
          create: (context) => GetUserPostsCubit(
            getProfileSectionsRepo: GetProfileSectionsAPI(),
            postRepo: PostAPI(),
          ),
        ),
        BlocProvider<PostLikeCubit>(
            create: (context) => PostLikeCubit(postLikeAPI: PostLikeAPI())),
        BlocProvider<CityCubit>(create: (context) => CityCubit()),
        BlocProvider<TripCubit>(create: (context) => TripCubit()),
        BlocProvider<NotificationCubit>(
            create: (context) => NotificationCubit()),
        BlocProvider<CityInformationCubit>(
            create: (context) =>
                CityInformationCubit(cityInformationAPI: CityInformationAPI())),
        BlocProvider<TabCityCubit>(
          create: (context) => TabCityCubit(),
        ),
        BlocProvider<ActivitiesCubit>(
            create: (context) =>
                ActivitiesCubit(activitiesAPI: ActivitiesAPI())),
        BlocProvider<FindHotelCubit>(
            create: (context) => FindHotelCubit(findHotelAPI: FindHotelAPI())),
        BlocProvider<NewsfeedCubit>(
            create: (context) =>
                NewsfeedCubit(newsFeedAPI: NewsFeedAPI())..getposts()),
        BlocProvider<GetUserPhotoCubit>(
            create: (context) => GetUserPhotoCubit(
                getProfileSectionsRepo: GetProfileSectionsAPI())),
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


/*
If you are using an iOS simulator,
 you will not be able to play videos. 
 For iOS, you have to connect a real device.
 If you are using an iOS simulator, you will not be able to play videos. For iOS, you have to connect a real device.
*/