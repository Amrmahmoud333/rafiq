import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:rafiq/logic/cubit/post_like_cubit/post_like_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/options_bottom_sheet.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/videos/widgets/chewie_item.dart';
import 'package:video_player/video_player.dart';

class TextWithVideo extends StatelessWidget {
  const TextWithVideo({
    Key? key,
    required this.cubit,
    required this.cubitPost,
    required this.index,
  }) : super(key: key);

  final UserDataCubit cubit;
  final GetUserPostsCubit cubitPost;
  final int index;

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    String postId = cubitPost.posts[index].sId!;
    var cubitPostLike = context.read<PostLikeCubit>();

    return Container(
      color: const Color(0xffDBD4DD).withOpacity(0.15),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h(10), bottom: h(14)),
            child: Row(
              children: [
                SizedBox(width: w(9)),
                Container(
                  width: w(42),
                  height: h(42),
                  decoration: BoxDecoration(
                    color: const Color(0xff5B618A),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xffE8DEEB), width: 2),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(cubit.avatar!),
                    ),
                  ),
                ),
                SizedBox(width: w(6)),
                SizedBox(
                  width: w(121),
                  child: FittedBox(
                    child: AutoSizeText(
                      '${cubit.firstName} ${cubit.lastName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF5B618A),
                        fontFamily: 'DavidLibre',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: w(160)),
                InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      backgroundColor: const Color(0xffDBD4DD),
                      context: context,
                      builder: (context) => const BuildOptionsBottomSheet(),
                    );
                  },
                  child: SvgPicture.asset('assets/images/Options.svg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height:
                cubitPost.checkSeeMore(cubitPost.posts[index].content!.text!)
                    ? h(290)
                    : h(272),
            child: Stack(
              children: [
                SizedBox(
                  width: w(390),
                  height: h(224),
                  child: ChewieItem(
                    videoPlayerController: VideoPlayerController.network(
                        cubitPost.posts[index].content!.files![0]),
                    looping: false,
                  ),
                ),
                BlocBuilder<GetUserPostsCubit, GetUserPostsState>(
                  builder: (context, state) {
                    return Positioned(
                      bottom: cubitPost.checkSeeMore(
                              cubitPost.posts[index].content!.text!)
                          ? 0
                          : 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          !context.read<GetUserPostsCubit>().posts[index].isMore
                              ? Container(
                                  color:
                                      const Color(0xffDBD4DD).withOpacity(0.15),
                                  width: w(390),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: w(10), right: w(15)),
                                    child: AutoSizeText(
                                      cubitPost.posts[index].content!.text!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0XFF5B618A),
                                        fontFamily: 'DavidLibre',
                                      ),
                                      maxLines: 2,
                                      minFontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              : Container(
                                  color:
                                      const Color(0xffDBD4DD).withOpacity(0.9),
                                  width: w(390),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: w(10), right: w(15), top: h(5)),
                                    child: AutoSizeText(
                                      cubitPost.posts[index].content!.text!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0XFF5B618A),
                                        fontFamily: 'DavidLibre',
                                      ),
                                      minFontSize: 18,
                                    ),
                                  )),
                          cubitPost.checkSeeMore(
                                  cubitPost.posts[index].content!.text!)
                              ? InkWell(
                                  onTap: () {
                                    cubitPost.changeIsMore(index);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: w(25)),
                                    child: AutoSizeText(
                                      cubitPost.posts[index].isMore
                                          ? "See Less..."
                                          : 'See More...',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B618A)
                                            .withOpacity(0.60),
                                        fontFamily: 'DavidLibre',
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(height: h(5)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // SizedBox(height: h(5)),
          //  SizedBox(height: h(9)),

          Row(
            children: [
              SizedBox(width: w(9)),
              Column(
                children: [
                  BlocBuilder<PostLikeCubit, PostLikeState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          cubitPost.posts[index].isLiked!
                              ? cubitPostLike
                                  .unLike(postId: postId, userId: userName!)
                                  .then((value) {
                                  cubitPost.posts[index].isLiked = false;
                                  // decremant number of likes when use click like
                                  cubitPost.posts[index].numberOfLikes != 0
                                      ? cubitPost.posts[index].numberOfLikes =
                                          cubitPost
                                                  .posts[index].numberOfLikes! -
                                              1
                                      : cubitPost.posts[index].numberOfLikes =
                                          0;
                                })
                              : cubitPostLike
                                  .makeLikeToPost(postId: postId)
                                  .then((value) {
                                  cubitPost.posts[index].isLiked = true;
                                  // incremant number of likes when use click like
                                  cubitPost.posts[index].numberOfLikes =
                                      cubitPost.posts[index].numberOfLikes! + 1;
                                });
                        },
                        child: Icon(
                          cubitPost.posts[index].isLiked!
                              ? Icons.favorite
                              : !cubitPost.posts[index].isLiked!
                                  ? Icons.favorite_border
                                  : Icons.favorite_border,
                          color: const Color(0XFF5B618A),
                          size: 30,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<PostLikeCubit, PostLikeState>(
                      builder: (context, state) {
                    return AutoSizeText(
                      '${cubitPost.posts[index].numberOfLikes}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0XFF5B618A),
                        fontFamily: 'DavidLibre',
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(width: w(24)),
              Column(
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/images/comments.svg',
                      width: w(27),
                      height: h(27),
                    ),
                  ),
                  AutoSizeText(
                    '${cubitPost.posts[index].numberOfComments!}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0XFF5B618A),
                      fontFamily: 'DavidLibre',
                    ),
                  ),
                ],
              ),
              SizedBox(width: w(244)),
              InkWell(
                child: SvgPicture.asset(
                  'assets/images/share.svg',
                  width: w(27),
                  height: h(27),
                ),
              ),
            ],
          ),
          SizedBox(height: h(7)),
        ],
      ),
    );
  }
}
