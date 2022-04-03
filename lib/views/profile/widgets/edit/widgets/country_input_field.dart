import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/const/country_list.dart';

class CountryInputField extends StatelessWidget {
  const CountryInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Country',
          style: lableInputField(20),
        ),
        SizedBox(
          height: height(4),
        ),
        Container(
          height: height(38),
          width: width(313),
          decoration: BoxDecoration(
            color: const Color(0xFF5B618A).withOpacity(.10),
            border: Border(
              bottom: BorderSide(
                width: width(2),
                color: const Color(0xFF5B618A),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: height(8),
              left: width(8),
            ),
            child: BlocBuilder<ProfileCubit, ProfileStates>(
              builder: (context, state) => DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: const Color(0xffE9DCEC),
                  //  iconEnabledColor:

                  value: cubit.countryValue,
                  isExpanded: true,
                  iconSize: height(26),
                  items: countries.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    cubit.changeCountryValue(value!);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String country) => DropdownMenuItem(
        value: country,
        child: AutoSizeText(
          country,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5B618A),
          ),
        ),
      );
}
