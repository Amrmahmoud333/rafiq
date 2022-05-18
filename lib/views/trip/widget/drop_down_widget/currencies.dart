import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/trip_cubit/trip_cubit_cubit.dart';

class CurrenciesDropDownButton extends StatelessWidget {
  const CurrenciesDropDownButton({
    Key? key,
    required this.value,
    required this.items,
  }) : super(key: key);
  final String? value;
  final List<String>? items;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Container(
      height: height(39),
      width: width(83),
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
        items: items!
            .map((country) => DropdownMenuItem<String>(
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
                ))
            .toList(),
        onChanged: (value) {
          BlocProvider.of<TripCubit>(context).changeCurrenciesValue(value!);
        },
      ),
    );
  }
}
