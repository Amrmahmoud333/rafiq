import 'package:flutter/material.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/city_posts_widgets/post_city_UI.dart';

class CityPost extends StatelessWidget {
  const CityPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => const PostCityUI(),
    );
  }
}
