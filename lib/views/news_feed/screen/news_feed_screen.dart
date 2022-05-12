import 'package:flutter/material.dart';
import 'package:rafiq/views/main_pages/main_home/widgets/app_bar.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  static const routeName = '/news_feed_screen';

  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      appBar: MyAppBar(newContext: context),
      drawer: const Drawer(),
      body: Center(
        child: Container(
          width: w(375),
          color: const Color(0xffEFE7F2),
        ),
      ),
    );
  }
}
