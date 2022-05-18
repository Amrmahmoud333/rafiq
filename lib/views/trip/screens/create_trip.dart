import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/trip_cubit/trip_cubit_cubit.dart';
import 'package:rafiq/views/trip/const/country_list.dart';
import 'package:rafiq/views/trip/widget/create_button.dart';
import 'package:rafiq/views/trip/widget/drop_down_widget/country_city_transporation.dart';
import 'package:rafiq/views/trip/widget/drop_down_widget/currencies.dart';

class CreateTrip extends StatelessWidget {
  const CreateTrip({Key? key}) : super(key: key);
  static const routeName = '/create_trip_screen';
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: w(16), right: w(21)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h(190),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        left: w(5.83),
                        top: h(21.83),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: const Color(0xff5B618A),
                          ),
                        ),
                      ),
                      Positioned(
                        top: h(57),
                        left: w(21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            AutoSizeText(
                              'Create',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff5B618A),
                              ),
                            ),
                            AutoSizeText(
                              'Trip',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff5B618A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: h(15.13),
                        right: w(0),
                        child: InkWell(
                          //TODO add function to select image
                          onTap: () {},
                          child: Container(
                            width: w(162),
                            height: h(173.74),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xffCFCBDC)),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h(50.42),
                                  left: w(34.92),
                                  child: SvgPicture.asset(
                                      'assets/images/trip/add_image.svg'),
                                ),
                                Positioned(
                                  top: h(43.66),
                                  left: w(72.22),
                                  child: SvgPicture.asset(
                                      'assets/images/trip/add_image.svg'),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: h(12.87)),
                                    child: const AutoSizeText(
                                      'add Image ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff5B618A),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h(19.13),
                ),
                Center(
                  child: Column(
                    children: [
                      CountryORcityORtransporationDropDownButton(
                          title: 'Country',
                          value:
                              BlocProvider.of<TripCubit>(context).countryValue,
                          items: countries,
                          countryORcityORtransporation: 'country'),
                      SizedBox(
                        height: h(17),
                      ),
                      CountryORcityORtransporationDropDownButton(
                          title: 'City',
                          value: BlocProvider.of<TripCubit>(context).cityValue,
                          items: countries,
                          countryORcityORtransporation: 'city'),
                      SizedBox(
                        height: h(17),
                      ),
                      CountryORcityORtransporationDropDownButton(
                          title: 'Transporation',
                          value: BlocProvider.of<TripCubit>(context)
                              .transporationValue,
                          items: countries,
                          countryORcityORtransporation: 'transporation')
                    ],
                  ),
                ),
                SizedBox(
                  height: h(19.13),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: w(13), bottom: h(3)),
                            child: const AutoSizeText(
                              'Price',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff5B618A),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w(219),
                            height: h(39),
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5B618A),
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                //disabledBorder: InputBorder.none,
                                //enabledBorder: InputBorder.none,
                                fillColor: const Color(0xffCFCBDC),
                                filled: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h(20)),
                        child: CurrenciesDropDownButton(
                            value: BlocProvider.of<TripCubit>(context)
                                .currenciesValue,
                            items: countries),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h(19.13),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w(13), bottom: h(3)),
                      child: const AutoSizeText(
                        'Trip days',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff5B618A),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffCFCBDC),
                          borderRadius: BorderRadius.circular(10)),
                      width: w(169),
                      height: h(39),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(left: w(13)),
                              child: const AutoSizeText(
                                '+',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B618A),
                                ),
                              ),
                            ),
                          ),
                          AutoSizeText(
                            '${BlocProvider.of<TripCubit>(context).tripDayValue}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5B618A),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(right: w(13)),
                              child: const AutoSizeText(
                                '-',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B618A),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: h(19.13),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w(13), bottom: h(3)),
                      child: const AutoSizeText(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff5B618A),
                        ),
                      ),
                    ),
                    Container(
                      width: w(322),
                      height: h(107),
                      decoration: BoxDecoration(
                        color: const Color(0xffCFCBDC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        maxLines: null,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5B618A),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: const Color(0xffCFCBDC),
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h(35),
                ),
                Center(
                  child: CreateButton(
                    label: 'Create',
                    ontap: () {},
                  ),
                ),
                SizedBox(
                  height: h(30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
