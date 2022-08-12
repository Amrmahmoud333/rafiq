import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/find_hotel_cubit/find_hotel_cubit.dart';

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

    FindHotelCubit cubit = context.read<FindHotelCubit>();

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
                        child: BlocBuilder<FindHotelCubit, FindHotelState>(
                          builder: (context, state) {
                            return state is FindHotelLoading
                                ? Image.network(
                                    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/164957631.jpg?k=f847d43341020e39e2c14f61cc4b245b0ed56205e49bd4289dadf5ccc5770427&o=&hp=1%27",
                                    fit: BoxFit.fill,
                                  )
                                //  cubit.findHotelsModel.results!.data![index].mainPhotoUrl!
                                : Image.network(
                                    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/164957631.jpg?k=f847d43341020e39e2c14f61cc4b245b0ed56205e49bd4289dadf5ccc5770427&o=&hp=1%27",
                                    fit: BoxFit.fill,
                                  );
                          },
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
                            child: Center(
                              child:
                                  BlocBuilder<FindHotelCubit, FindHotelState>(
                                builder: (context, state) {
                                  return state is FindHotelLoading
                                      ? const AutoSizeText(
                                          '',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff5B618A)),
                                        )
                                      : const AutoSizeText(
                                          //cubit.findHotelsModel.results!.data![index].hotelName!
                                          'Element Times Square West',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff5B618A)),
                                        );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h(17), left: w(20)),
                            child: BlocBuilder<FindHotelCubit, FindHotelState>(
                              builder: (context, state) {
                                return state is FindHotelLoading
                                    ? const AutoSizeText(
                                        '',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff5B618A)),
                                      )
                                    : const AutoSizeText(
                                        //cubit.findHotelsModel.results!.data![index].address!
                                        '311 West 39th Street, Hells Kitchen',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff5B618A)),
                                      );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h(17), left: w(20)),
                            child: BlocBuilder<FindHotelCubit, FindHotelState>(
                              builder: (context, state) {
                                return state is FindHotelLoading
                                    ? const AutoSizeText(
                                        '',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff5B618A)),
                                      )
                                    : const AutoSizeText(
                                        //  '${cubit.findHotelsModel.results!.data![index].reviewNr!} Reviews'
                                        '6363 Reviews',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff5B618A),
                                        ),
                                      );
                              },
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
                                  child: Center(
                                    child: BlocBuilder<FindHotelCubit,
                                        FindHotelState>(
                                      builder: (context, state) {
                                        return state is FindHotelLoading
                                            ? const AutoSizeText(
                                                '',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : const AutoSizeText(
                                                // '${cubit.findHotelsModel.results!.data![index].reviewScore!}'
                                                '7.9',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: h(17), left: w(16)),
                                child:
                                    BlocBuilder<FindHotelCubit, FindHotelState>(
                                  builder: (context, state) {
                                    return state is FindHotelLoading
                                        ? const AutoSizeText(
                                            '',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          )
                                        : const AutoSizeText(
                                            // '${cubit.findHotelsModel.results!.data![index].review_score_word!}'
                                            'Good',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff618A5B),
                                            ),
                                          );
                                  },
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
                                BlocBuilder<FindHotelCubit, FindHotelState>(
                                  builder: (context, state) {
                                    return state is FindHotelLoading
                                        ? const AutoSizeText(
                                            '',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          )
                                        : const AutoSizeText(
                                            // '${cubit.findHotelsModel.results!.data![index].min_total_price!}\$night'
                                            '530.34\$/night',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff5B618A),
                                            ),
                                          );
                                  },
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
