import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/screens/widget/country_list.dart';
import 'package:rafiq/views/sign_up/screens/widget/country_picker.dart';
import 'package:rafiq/views/sign_up/widgets/horizontal_line.dart';

class ThridSignUp extends StatefulWidget {
  const ThridSignUp({Key? key}) : super(key: key);

  @override
  State<ThridSignUp> createState() => _ThridSignUpState();
}

class _ThridSignUpState extends State<ThridSignUp> {
  var countryValue;
  late DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopCloud(),
            SizedBox(
              height: height(15),
            ),
            const HorizontalLinee(
              precent: 70,
            ),
            SizedBox(
              height: height(52),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  'Country',
                  style: TextStyle(fontSize: 18.0, color: Color(0xff5B618A)),
                ),
                Container(
                  height: height(38),
                  width: width(313),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    border: Border(
                      bottom: BorderSide(
                        width: width(3),
                        color: const Color(0xFF5B618A),
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: countryValue,
                      isExpanded: true,
                      iconSize: height(26),
                      items: countries.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height(22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  'Date of birth',
                  style: TextStyle(fontSize: 18.0, color: Color(0xff5B618A)),
                ),
                InkWell(
                  onTap: () async {
                    DateTime? newDateTime = await showDatePicker(
                      context: context,
                      initialDate: _dateTime,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (newDateTime == null) return;
                    setState(() {
                      _dateTime = newDateTime;
                    });
                  },
                  child: Container(
                    height: height(38),
                    width: width(313),
                    margin: EdgeInsets.only(
                      top: height(8),
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
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height(8),
                        left: width(8),
                      ),
                      child: AutoSizeText(
                        '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height(29),
            ),
            Padding(
              padding: EdgeInsets.only(left: width(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Gender',
                    style: TextStyle(fontSize: 18.0, color: Color(0xff5B618A)),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: width(94),
                          height: height(33),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5B618A),
                            border: Border.all(
                              color: const Color(0xff6E75A0),
                              width: 1,
                            ), //Border.all
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Male',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(40),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: width(94),
                          height: height(33),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5B618A),
                            border: Border.all(
                              color: const Color(0xff6E75A0),
                              width: 1,
                            ), //Border.all
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Female',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height(61),
            ),
            LogSignButton(
              label: 'Sign up',
              ontap: () {},
            ),
            SizedBox(
              height: height(1),
            ),
            const BottomCLoud(),
          ],
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
