import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/share_post.dart';

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
        onPressed: () =>
            Navigator.popAndPushNamed(context, SharePost.routeName),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              print(context
                  .read<GetUserPostsCubit>()
                  .lengthOfListThatComesFromRequest);
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