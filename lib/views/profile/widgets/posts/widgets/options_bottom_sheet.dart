import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_posts_cubit/get_user_posts_cubit.dart';

class BuildOptionsBottomSheet extends StatelessWidget {
  const BuildOptionsBottomSheet(
      {Key? key, required this.postId, required this.index})
      : super(key: key);
  final String postId;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, top: 14, bottom: 13.5),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/posts/comments_buttom_sheet.svg',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 9),
                  AutoSizeText('View whole post',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
          ),
          Container(
            width: 306,
            height: 0.8,
            color: const Color(0xff5B618A),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 10, bottom: 13.5),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/posts/edit.svg',
                    width: 19,
                    height: 19,
                  ),
                  const SizedBox(width: 12),
                  AutoSizeText('Edit post',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
          ),
          Container(
            width: 306,
            height: 0.8,
            color: const Color(0xff5B618A),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 9.5),
            child: InkWell(
              onTap: () {
                context
                    .read<GetUserPostsCubit>()
                    .deletePost(postId: postId)
                    .then((value) {
                  context.read<GetUserPostsCubit>().posts.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: Color(0xffC11717),
                  ),
                  const SizedBox(width: 9),
                  AutoSizeText('Delete post',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: const Color(0xffC11717),
                          )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
