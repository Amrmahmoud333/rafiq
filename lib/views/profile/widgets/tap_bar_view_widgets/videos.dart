import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/themes/theme.dart';

class Videos extends StatelessWidget {
  Videos({Key? key}) : super(key: key);

  final List<Widget> videos = [
    AutoSizeText(
      'No videos yet 1',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 2',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 3',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 4',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 5',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 6',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 7',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 8',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 9',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 10',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 11',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No videos yet 12',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 100),
        child: Center(child: videos[index]),
      ),
      itemCount: videos.length,
    );
  }
}
