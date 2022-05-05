import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/data_API/profile/marker_API.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/post.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  /* void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<GetUserPostsCubit>(context)
              .getMorePosts(userID: userName);
        }
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    // var cubit = ;
    //  cubit.initStateUI();
    // setupScrollController(context);

    return BlocBuilder<GetUserPostsCubit, GetUserPostsState>(
        builder: (context, state) {
      if (state is GetUserFirstPostsLoadinngState) {
        return const CircularProgressIndicator();
      }

      return ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < context.read<GetUserPostsCubit>().posts.length) {
            // context.read<GetUserPostsCubit>().morePosts = true;
            /* if (scrollController.position.pixels != 0) {
              if (context.read<GetUserPostsCubit>().morePosts == false) {
                context.read<GetUserPostsCubit>().morePosts = false;
                print(index);
              } else {
                print('object');
              }
            }*/

            return Padding(
              padding: EdgeInsets.only(top: h(14)),
              child: const Post(),
            );
          } else {
            if (context.read<GetUserPostsCubit>().morePosts) {
              context.read<GetUserPostsCubit>().getMorePosts(
                    userID: userName,
                  );
              context.read<GetUserPostsCubit>().changeMorePosts();
            }

            return Padding(
              padding: EdgeInsets.only(bottom: h(30), top: h(5)),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        itemCount: context.read<GetUserPostsCubit>().posts.length + 1,
      );
    });
  }
}
