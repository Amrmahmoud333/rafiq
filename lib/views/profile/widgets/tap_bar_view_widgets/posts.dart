import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/data_API/profile/marker_API.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/post.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    var cubit = context.read<GetUserPostsCubit>();

    return BlocBuilder<GetUserPostsCubit, GetUserPostsState>(
        builder: (context, state) {
      if (state is GetUserFirstPostsLoadinngState) {
        return const CircularProgressIndicator();
      }

      return ListView.builder(
        itemCount: cubit.posts.length + 1,
        itemBuilder: (context, index) {
          if (index < cubit.posts.length) {
            return Padding(
              padding: EdgeInsets.only(top: h(14)),
              child: Post(
                index: index,
              ),
            );
          } else {
            if (state is! GetUserMorePostsLoadinngState) {
              if (cubit.isDeleted && index == cubit.posts.length) {
                cubit.getMorePosts(
                    userID: userName, lastPostId: cubit.posts[index - 1].sId);
              } else if (index % 10 == 0 && index != 0) {
                cubit.getMorePosts(
                    userID: userName, lastPostId: cubit.posts[index - 1].sId);
              }
            }

            return cubit.lengthOfListThatComesFromRequest == 0 ||
                    cubit.posts.length % 10 != 0
                ? Container(
                    height: h(35),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: h(35), top: h(9)),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          }
        },
      );
    });
  }
}
//