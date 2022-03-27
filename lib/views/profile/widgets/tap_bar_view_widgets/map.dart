import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/themes/theme.dart';

class Maps extends StatelessWidget {
  Maps({Key? key}) : super(key: key);

  List<Widget> maps = [
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
