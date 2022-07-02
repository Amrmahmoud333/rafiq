import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/logic/cubit/find_hotel_cubit/find_hotel_cubit.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/hotel_widget/result_hotels.dart';

class CityHotels extends StatelessWidget {
  const CityHotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    FindHotelCubit cubit = context.read<FindHotelCubit>();
    return SizedBox(
      height: h(300),
      child: Column(
        children: [
          SizedBox(height: h(60)),
          // Check in && out Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Check-in Date',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff5B618A)),
                  ),
                  InkWell(
                    onTap: () async {
                      DateTime? newDateTime = await showDatePicker(
                        context: context,
                        initialDate: cubit.dateTimeCheckIn,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Color(0xFF5B618A),
                                onPrimary: Color(0xffE9DCEC),
                                onSurface: Colors.black,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: const Color(
                                      0xFF5B618A), // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (newDateTime == null) return;
                      cubit.changeDataTimeCheckIn(newDateTime);
                    },
                    child: Container(
                      height: h(38),
                      width: w(154),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD0CCDE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<FindHotelCubit, FindHotelState>(
                              builder: (context, state) => AutoSizeText(
                                '${cubit.dateTimeCheckIn.day}/${cubit.dateTimeCheckIn.month}/${cubit.dateTimeCheckIn.year}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            SvgPicture.asset(
                                'assets/images/city_icons/calendar.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Check-out Date',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff5B618A)),
                  ),
                  InkWell(
                    onTap: () async {
                      DateTime? newDateTime = await showDatePicker(
                        context: context,
                        initialDate: cubit.dateTimeCheckOut,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Color(
                                    0xFF5B618A), // header background color
                                onPrimary:
                                    Color(0xffE9DCEC), // header text color
                                onSurface: Colors.black, // body text color
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: const Color(
                                      0xFF5B618A), // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (newDateTime == null) return;
                      cubit.changeDataTimeCheckOut(newDateTime);
                    },
                    child: Container(
                      height: h(38),
                      width: w(154),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD0CCDE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<FindHotelCubit, FindHotelState>(
                              builder: (context, state) => AutoSizeText(
                                '${cubit.dateTimeCheckOut.day}/${cubit.dateTimeCheckOut.month}/${cubit.dateTimeCheckOut.year}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            SvgPicture.asset(
                                'assets/images/city_icons/calendar.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: h(50)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Rooms',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff5B618A)),
                  ),
                  Container(
                    height: h(31),
                    width: w(93),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0CCDE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.addRoom();
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xff5B618A),
                            ),
                          ),
                          BlocBuilder<FindHotelCubit, FindHotelState>(
                              builder: (context, state) {
                            return AutoSizeText(
                              '${cubit.room}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Color(0xff5B618A),
                              ),
                            );
                          }),
                          InkWell(
                            onTap: () {
                              cubit.minusRoom();
                            },
                            child: const Icon(
                              Icons.minimize,
                              size: 20,
                              color: Color(0xff5B618A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Adults',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff5B618A)),
                  ),
                  Container(
                    height: h(31),
                    width: w(93),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0CCDE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.addAdults();
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xff5B618A),
                            ),
                          ),
                          BlocBuilder<FindHotelCubit, FindHotelState>(
                              builder: (context, state) {
                            return AutoSizeText(
                              '${cubit.adults}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Color(0xff5B618A),
                              ),
                            );
                          }),
                          InkWell(
                            onTap: () {
                              cubit.minusAdults();
                            },
                            child: const Icon(
                              Icons.minimize,
                              size: 20,
                              color: Color(0xff5B618A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Childern',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff5B618A)),
                  ),
                  Container(
                    height: h(31),
                    width: w(93),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0CCDE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.addChild();
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xff5B618A),
                            ),
                          ),
                          BlocBuilder<FindHotelCubit, FindHotelState>(
                              builder: (context, state) {
                            return AutoSizeText(
                              '${cubit.child}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Color(0xff5B618A),
                              ),
                            );
                          }),
                          InkWell(
                            onTap: () {
                              cubit.minusChild();
                            },
                            child: const Icon(
                              Icons.minimize,
                              size: 20,
                              color: Color(0xff5B618A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: h(51)),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ResultHotelScreen.routeName);
            },
            child: Container(
              height: h(37),
              width: w(118),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF5B618A),
              ),
              child: const Center(
                child: AutoSizeText(
                  'Find',
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
    );
  }
}
