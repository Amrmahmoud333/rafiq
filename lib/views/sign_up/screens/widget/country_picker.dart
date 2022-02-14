import 'package:auto_size_text/auto_size_text.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/sign_up/screens/widget/country_list.dart';

class CountryPicker extends StatefulWidget {
  CountryPicker({Key? key}) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String countryValue = '';
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      margin: EdgeInsets.only(
        top: height(8),
        left: width(0),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border(
          bottom: BorderSide(
            width: width(3),
            color: const Color(0xFF5B618A),
          ),
        ),
      ),
      height: height(38),
      width: width(313),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: countryValue,
          isExpanded: true,
          iconSize: height(26),
          items: countries.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
              countryValue = value!;
            });
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String country) => DropdownMenuItem(
        value: country,
        child: AutoSizeText(
          country,
        ),
      );
}
