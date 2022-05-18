import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/trip_cubit/trip_cubit_cubit.dart';

class CountryORcityORtransporationDropDownButton extends StatelessWidget {
  const CountryORcityORtransporationDropDownButton(
      {Key? key,
      required this.value,
      required this.items,
      required this.countryORcityORtransporation,
      required this.title})
      : super(key: key);
  final String title;
  final String? value;
  final List<String>? items;
  final String? countryORcityORtransporation;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width(13), bottom: height(3)),
          child: AutoSizeText(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF5B618A),
            ),
          ),
        ),
        Container(
          height: height(39),
          width: width(323),
          decoration: BoxDecoration(
              color: const Color(0xffCFCBDC),
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<String>(
            underline: const SizedBox(height: null),
            iconEnabledColor: const Color(0xFF5B618A),
            iconDisabledColor: const Color(0xFF5B618A),
            dropdownColor: const Color(0xffE9DCEC),
            value: value,
            isExpanded: true,
            iconSize: height(30),
            items: items!.map(buildMenuItem).toList(),
            onChanged: (value) {
              if (countryORcityORtransporation == 'country' ||
                  countryORcityORtransporation == 'Country') {
                BlocProvider.of<TripCubit>(context).changeCountryValue(value!);
              } else if (countryORcityORtransporation == 'city' ||
                  countryORcityORtransporation == 'City') {
                BlocProvider.of<TripCubit>(context).changeCityValue(value!);
              } else {
                BlocProvider.of<TripCubit>(context)
                    .changeTransporationValue(value!);
              }
            },
          ),
        ),
      ],
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String country) => DropdownMenuItem(
      value: country,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AutoSizeText(
          country,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5B618A),
          ),
        ),
      ),
    );
