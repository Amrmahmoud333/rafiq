import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/post_type/just_photo.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/post_type/just_text.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/post_type/just_video.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/post_type/text_with_photo.dart';

class Post extends StatelessWidget {
  const Post({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserDataCubit>();
    var cubitPost = context.read<GetUserPostsCubit>();

    String check = cubitPost.checkPostList(index: index);

    return check == 'justPhoto'
        ? JustPhoto(
            cubit: cubit,
            cubitPost: cubitPost,
            index: index,
          )
        : check == 'TextWithPhoto'
            ? TextWithPhoto(
                cubit: cubit,
                cubitPost: cubitPost,
                index: index,
              )
            : check == 'justText'
                ? JustText(
                    cubit: cubit,
                    cubitPost: cubitPost,
                    index: index,
                  )
                : check == 'justVideo'
                    ? JustVideo(
                        cubit: cubit, cubitPost: cubitPost, index: index)
                    : Container();
  }
}
