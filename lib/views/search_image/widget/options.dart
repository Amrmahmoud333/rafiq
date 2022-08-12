// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';

class OptionsDropDownButton extends StatelessWidget {
  const OptionsDropDownButton({
    Key? key,
    required this.value,
    required this.items,
  }) : super(key: key);
  final String? value;
  final List<String>? items;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Container(
      height: height(32),
      width: width(64),
      decoration: const BoxDecoration(
        color: Color(0xff9C9BB7),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: DropdownButton<String>(
        underline: const SizedBox(height: null),
        iconEnabledColor: const Color(0xffebebebb5).withOpacity(0.71),
        iconDisabledColor: const Color(0xffebebebb5).withOpacity(0.71),
        dropdownColor: const Color(0xff9C9BB7),
        value: value,
        isExpanded: true,
        iconSize: height(30),
        items: items!.map(buildMenuItem).toList(),
        onChanged: (newvalue) {
          BlocProvider.of<SearchCubit>(context).changeVal(newvalue!);
        },
      ),
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
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xffEBEBEBB5),
          ),
        ),
      ),
    );
