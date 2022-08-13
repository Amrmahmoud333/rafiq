import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/newsfeed_cubit/newsfeed_cubit.dart';
import 'package:rafiq/views/news_feed/widget/post_news_feed.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  static const routeName = '/news_feed_screen';

  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = context.read<NewsfeedCubit>();
    context.read<NewsfeedCubit>().getposts();

    return BlocBuilder<NewsfeedCubit, NewsfeedState>(
      builder: (context, state) {
        return state is GetPostsLoading
            ? Container()
            : ListView.builder(
                itemCount: cubit.newsFeedModel.newsFeed!.length,
                itemBuilder: ((context, index) {
                  return BlocBuilder<NewsfeedCubit, NewsfeedState>(
                    builder: (context, state) {
                      if (cubit.newsFeedModel.newsFeed!.isEmpty) {
                        return const Center(
                          child: Text('No Posts!'),
                        );
                      }
                      return PostNewsFeed(
                        index: index,
                      );
                    },
                  );
                }));
      },
    );
  }
}
