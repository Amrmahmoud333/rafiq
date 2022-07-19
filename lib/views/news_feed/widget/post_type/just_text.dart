import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/logic/cubit/newsfeed_cubit/newsfeed_cubit.dart';
import 'package:rafiq/logic/cubit/post_like_cubit/post_like_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/options_bottom_sheet.dart';

class JustTextNewsfeed extends StatelessWidget {
  const JustTextNewsfeed({
    Key? key,
    required this.cubitPost,
    required this.index,
  }) : super(key: key);

  final NewsfeedCubit cubitPost;
  final int index;

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    String postId = cubitPost.newsFeedModel.newsFeed![index].sId!;
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
                    image: cubitPost.newsFeedModel.newsFeed![index].authorInfo!
                                .avatar ==
                            null
                        ? const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/default.png'),
                          )
                        : DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(cubitPost.newsFeedModel
                                .newsFeed![index].authorInfo!.avatar!),
                          ),
                  ),
                ),
                SizedBox(width: w(6)),
                SizedBox(
                  width: w(121),
                  child: FittedBox(
                    child: AutoSizeText(
                      '${cubitPost.newsFeedModel.newsFeed![index].authorInfo!.firstName} ${cubitPost.newsFeedModel.newsFeed![index].authorInfo!.lastName}',
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
                      builder: (context) => BuildOptionsBottomSheet(
                          index: index,
                          postId:
                              cubitPost.newsFeedModel.newsFeed![index].sId!),
                    );
                  },
                  child: SvgPicture.asset('assets/images/Options.svg'),
                ),
              ],
            ),
          ),

          BlocBuilder<NewsfeedCubit, NewsfeedState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  !cubitPost.newsFeedModel.newsFeed![index].isMore
                      ? SizedBox(
                          width: w(390),
                          child: Padding(
                            padding: EdgeInsets.only(left: w(10), right: w(15)),
                            child: AutoSizeText(
                              cubitPost.newsFeedModel.newsFeed![index].content!
                                  .text!,
                              style: const TextStyle(
                                fontSize: 20,
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
                      : SizedBox(
                          width: w(390),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: w(10), right: w(15), top: h(5)),
                            child: AutoSizeText(
                              cubitPost.newsFeedModel.newsFeed![index].content!
                                  .text!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF5B618A),
                                fontFamily: 'DavidLibre',
                              ),
                              minFontSize: 18,
                            ),
                          )),
                  cubitPost.checkSeeMore(cubitPost
                          .newsFeedModel.newsFeed![index].content!.text!)
                      ? InkWell(
                          onTap: () {
                            cubitPost.changeIsMore(index);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: w(25)),
                            child: AutoSizeText(
                              cubitPost.newsFeedModel.newsFeed![index].isMore
                                  ? "See Less..."
                                  : 'See More...',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:
                                    const Color(0XFF5B618A).withOpacity(0.60),
                                fontFamily: 'DavidLibre',
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(height: h(5)),
                ],
              );
            },
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
                          cubitPost.newsFeedModel.newsFeed![index].isLiked!
                              ? cubitPostLike
                                  .unLike(postId: postId, userId: userName!)
                                  .then((value) {
                                  cubitPost.newsFeedModel.newsFeed![index]
                                      .isLiked = false;
                                  // decremant number of likes when use click like
                                  cubitPost.newsFeedModel.newsFeed![index]
                                              .numberOfLikes !=
                                          0
                                      ? cubitPost.newsFeedModel.newsFeed![index]
                                          .numberOfLikes = cubitPost
                                              .newsFeedModel
                                              .newsFeed![index]
                                              .numberOfLikes! -
                                          1
                                      : cubitPost.newsFeedModel.newsFeed![index]
                                          .numberOfLikes = 0;
                                })
                              : cubitPostLike
                                  .makeLikeToPost(postId: postId)
                                  .then((value) {
                                  cubitPost.newsFeedModel.newsFeed![index]
                                      .isLiked = true;
                                  // incremant number of likes when use click like
                                  cubitPost.newsFeedModel.newsFeed![index]
                                      .numberOfLikes = cubitPost.newsFeedModel
                                          .newsFeed![index].numberOfLikes! +
                                      1;
                                });
                        },
                        child: Icon(
                          cubitPost.newsFeedModel.newsFeed![index].isLiked!
                              ? Icons.favorite
                              : !cubitPost
                                      .newsFeedModel.newsFeed![index].isLiked!
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
                      '${cubitPost.newsFeedModel.newsFeed![index].numberOfLikes}',
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
                    '${cubitPost.newsFeedModel.newsFeed![index].numberOfComments!}',
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
