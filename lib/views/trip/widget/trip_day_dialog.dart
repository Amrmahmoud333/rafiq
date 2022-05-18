import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/trip_cubit/trip_cubit_cubit.dart';
import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/const/country_list.dart';
import 'package:rafiq/views/trip/widget/drop_down_widget/currencies.dart';
import 'package:rafiq/views/trip/widget/drop_down_widget/place.dart';

class ShowSimpleDialog extends StatelessWidget {
  const ShowSimpleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      backgroundColor: const Color(0xffEFE7F2),
      children: [
        SizedBox(
          width: w(291),
          height: h(390),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Number of trip Day
              Padding(
                padding: EdgeInsets.only(left: w(25), top: h(17)),
                child: AutoSizeText(
                  'Day ${BlocProvider.of<TripCubit>(context).tripDayValue}',
                  style: const TextStyle(
                    color: Color(0xff5B618A),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: h(25)),
              PlacesDropDownButton(
                value: BlocProvider.of<TripCubit>(context).placeValue,
                items: countries,
              ),
              SizedBox(height: h(15)),
              //Price Text Field and CurrenciesDropDownButton
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5B618A),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w(156),
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
                              fillColor: const Color(0xffCFCBDC),
                              filled: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: w(10),
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
              SizedBox(height: h(18)),

              // Description Text Field
              Center(
                child: Column(
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
                      width: w(249),
                      height: h(80),
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
              ),
              SizedBox(height: h(22)),
              //Done Bottom
              Center(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  height: h(38),
                  width: w(108),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF5B618A),
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      'Done',
                      style: TextStyle(
                        color: Color(0xffE9DCEC),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
