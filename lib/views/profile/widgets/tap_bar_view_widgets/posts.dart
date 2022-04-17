import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/views/profile/widgets/posts/post.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);

  final List<Widget> posts = [
    AutoSizeText(
      'No posts yet 1',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 2',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 3',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 4',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 5',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 6',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 7',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 8',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 9',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 10',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 11',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No posts yet 12',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(top: h(14)),
        child: const Post(),
      ),
      itemCount: 5,
    );
  }
}
