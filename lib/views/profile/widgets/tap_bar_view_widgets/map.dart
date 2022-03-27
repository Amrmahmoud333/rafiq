import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/themes/theme.dart';

class Maps extends StatelessWidget {
  Maps({Key? key}) : super(key: key);

  List<Widget> maps = [
    AutoSizeText(
      'No maps yet 1',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 2',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 3',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 4',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 5',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 6',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 7',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 8',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 9',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 10',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 11',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
    AutoSizeText(
      'No maps yet 12',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 100),
          child: Center(child: maps[index]),
        ),
      ),
      itemCount: maps.length,
    );
  }
}
