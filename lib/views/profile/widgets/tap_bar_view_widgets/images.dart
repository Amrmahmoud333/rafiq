import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/themes/theme.dart';

class Images extends StatelessWidget {
  Images({Key? key}) : super(key: key);

  final List<Widget> images = [
    AutoSizeText(
      'No images yet 1',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 2',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 3',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 4',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 5',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 6',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 7',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 8',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 9',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 10',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 11',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No images yet 12',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 100),
        child: Center(child: images[index]),
      ),
      itemCount: images.length,
    );
  }
}
