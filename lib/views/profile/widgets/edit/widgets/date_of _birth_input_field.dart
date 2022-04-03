import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class DateOfBirthInputField extends StatelessWidget {
  const DateOfBirthInputField({Key? key}) : super(key: key);

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
          'Date of birth',
          style: lableInputField(20),
        ),
        SizedBox(
          height: height(4),
        ),
        InkWell(
          onTap: () async {
            DateTime? newDateTime = await showDatePicker(
              context: context,
              initialDate: cubit.dateTime,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Color(0xFF5B618A), // header background color
                      onPrimary: Color(0xffE9DCEC), // header text color
                      onSurface: Colors.black, // body text color
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: const Color(0xFF5B618A), // button text color
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (newDateTime == null) return;
            cubit.chandeDateTime(newDateTime);
          },
          child: Container(
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
                top: height(10),
                left: width(8),
              ),
              child: BlocBuilder<ProfileCubit, ProfileStates>(
                builder: (context, state) => AutoSizeText(
                  cubit.dateOfBirth,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF5B618A),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
