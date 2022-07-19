import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/newsfeed_cubit/newsfeed_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/news_feed/widget/post_type/just_photo.dart';
import 'package:rafiq/views/news_feed/widget/post_type/just_text.dart';
import 'package:rafiq/views/news_feed/widget/post_type/text_with_photo.dart';

class PostNewsFeed extends StatelessWidget {
  const PostNewsFeed({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserDataCubit>();
    var cubitPost = context.read<NewsfeedCubit>();

    String check = cubitPost.checkPostList(index: index);

    return BlocBuilder<NewsfeedCubit, NewsfeedState>(
      builder: (context, state) {
        return check == 'justPhoto'
            ? JustPhotoNewsfeed(cubitPost: cubitPost, index: index)
            : check == 'justText'
                ? JustTextNewsfeed(cubitPost: cubitPost, index: index)
                : Container();
      },
    );
    // : check == 'TextWithPhoto'
    //     ? TextWithPhoto(cubit: cubit, cubitPost: cubitPost, index: index)
    //     : check == 'justText'
    //         ? JustText(cubit: cubit, cubitPost: cubitPost, index: index)
    //         : Container();
    // : check == 'justVideo'
    //     ? JustVideo(
    //         cubit: cubit, cubitPost: cubitPost, index: index)
    //     : TextWithVideo(
    //         cubit: cubit, cubitPost: cubitPost, index: index);
  }
}
