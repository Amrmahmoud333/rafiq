import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultHotelScreen extends StatelessWidget {
  const ResultHotelScreen({Key? key}) : super(key: key);
  static const routeName = '/result_hotel_screen';
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEFE7F2),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff5B618A), size: 35),
      ),
      backgroundColor: const Color(0xffEFE7F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
                child: AutoSizeText(
              'Resulted Hotels',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff5B618A)),
            )),
            SizedBox(height: h(46)),
            Swiper(
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: h(434),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          "https://media.istockphoto.com/photos/mosque-and-pyramids-picture-id1174818077?k=20&m=1174818077&s=612x612&w=0&h=vAutxzWDTokCJkf6010sguiHP6yc8Nzt8qePG9DEew0=",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: w(200),
                      color: const Color(0xffEFE7F2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: h(17)),
                            child: const Center(
                              child: AutoSizeText(
                                'Cavalletto Hotel',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff5B618A)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h(17)),
                            child: const AutoSizeText(
                              'In the middle of city',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B618A)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h(17)),
                            child: const AutoSizeText(
                              '2,000 Reviews',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B618A)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              itemCount: 2,
              itemWidth: w(320.0),
              itemHeight: h(600.0),
              layout: SwiperLayout.STACK,
              axisDirection: AxisDirection.right,
              onIndexChanged: (index) {},
              onTap: (index) {},
            ),
          ],
        ),
      ),
    );
  }
}
