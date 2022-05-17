import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

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
        toolbarHeight: h(50),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      width: MediaQuery.of(context).size.width,
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
                            padding: EdgeInsets.only(top: h(17), left: w(20)),
                            child: const AutoSizeText(
                              'In the middle of city',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B618A)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h(17), left: w(20)),
                            child: const AutoSizeText(
                              '2,000 Reviews',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B618A)),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: h(17), left: w(20)),
                                child: Container(
                                  width: w(30),
                                  height: h(30),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff618A5B),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(
                                    child: AutoSizeText(
                                      '9.5',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: h(17), left: w(16)),
                                child: const AutoSizeText(
                                  'Exceptional',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff618A5B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h(17)),
                          Padding(
                            padding: EdgeInsets.only(left: w(185)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const AutoSizeText(
                                  '20\$/night',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff5B618A),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: h(37),
                                    width: w(118),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFF5B618A),
                                    ),
                                    child: const Center(
                                      child: AutoSizeText(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Color(0xFFE9DCEC),
                                          fontSize: 20,
                                          fontFamily: 'DavidLibre',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
              itemHeight: MediaQuery.of(context).size.height - h(130),
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
