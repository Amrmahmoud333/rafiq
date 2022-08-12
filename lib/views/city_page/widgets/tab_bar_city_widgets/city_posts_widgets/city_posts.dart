import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/city_posts_widgets/post_city_UI.dart';

class CityPost extends StatelessWidget {
  const CityPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        // const PostCityUI()
        return SizedBox(
          height: h(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AutoSizeText(
                'No Posts Yet!',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0XFF5B618A),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
