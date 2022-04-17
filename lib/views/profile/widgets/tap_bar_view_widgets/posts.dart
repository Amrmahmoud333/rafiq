import 'package:flutter/material.dart';
import 'package:rafiq/views/profile/widgets/posts/post.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);

  final List<Widget> posts = [];

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(top: h(14)),
        child: Post(),
      ),
      itemCount: 5,
    );
  }
}
