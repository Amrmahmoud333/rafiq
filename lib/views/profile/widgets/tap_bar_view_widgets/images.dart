import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.height * (n / 393);
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(5), vertical: h(5)),
      child: GridView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xff5B618A),
              borderRadius: BorderRadius.circular(15),
            ),
            /*
              image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(),
                      ),
                      */
          );
        },
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: w(10.0),
          mainAxisSpacing: h(20.0),
          mainAxisExtent: h(167),
        ),
      ),
    );
  }
}
