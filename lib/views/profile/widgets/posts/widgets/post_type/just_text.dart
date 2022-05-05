import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';

class JustText extends StatelessWidget {
  const JustText({
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
                SvgPicture.asset('assets/images/Options.svg')
              ],
            ),
          ),

          BlocBuilder<GetUserPostsCubit, GetUserPostsState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  context.read<GetUserPostsCubit>().isMore
                      ? SizedBox(
                          width: w(390),
                          child: Padding(
                            padding: EdgeInsets.only(left: w(10), right: w(15)),
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
                      : SizedBox(
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

                  // see more widget
                  InkWell(
                    onTap: () {
                      context.read<GetUserPostsCubit>().changeSeeMore();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: w(25)),
                      child: AutoSizeText(
                        context.read<GetUserPostsCubit>().label,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF5B618A).withOpacity(0.60),
                          fontFamily: 'DavidLibre',
                        ),
                      ),
                    ),
                  ),
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
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      cubitPost.posts[index].isLiked!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0XFF5B618A),
                      size: 30,
                    ),
                  ),
                  AutoSizeText(
                    '${cubitPost.posts[index].numberOfLikes!}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0XFF5B618A),
                      fontFamily: 'DavidLibre',
                    ),
                  ),
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