import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CityImages extends StatelessWidget {
  const CityImages({Key? key}) : super(key: key);

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
                'No Images Yet!',
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
    // Padding(
    //   padding: EdgeInsets.symmetric(horizontal: w(5), vertical: h(5)),
    //   child: GridView.builder(
    //     itemBuilder: (context, index) {
    //       return Container(
    //         decoration: BoxDecoration(
    //           color: const Color(0xff5B618A),
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         /*
    //           image: DecorationImage(
    //                     fit: BoxFit.fill,
    //                     image: NetworkImage(),
    //                   ),
    //                   */
    //       );
    //     },
    //     itemCount: 7,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       childAspectRatio: 1,
    //       crossAxisSpacing: w(10.0),
    //       mainAxisSpacing: h(20.0),
    //       mainAxisExtent: h(167),
    //     ),
    //   ),
    // );
  }
}
