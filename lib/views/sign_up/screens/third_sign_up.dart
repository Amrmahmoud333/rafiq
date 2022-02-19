import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/screens/widget/container_choose.dart';
import 'package:rafiq/views/sign_up/screens/widget/country_list.dart';
import 'package:rafiq/views/sign_up/widgets/horizontal_line.dart';

class ThirdSignUp extends StatefulWidget {
  const ThirdSignUp({Key? key}) : super(key: key);
  static const routeName = '/third_sign_up';

  @override
  State<ThirdSignUp> createState() => _ThridSignUpState();
}

class _ThridSignUpState extends State<ThirdSignUp> {
  var countryValue;
  late DateTime _dateTime = DateTime.now();
  String _genderChoose = '';
  bool _isGenderMale = false;
  bool _isGenderFemale = false;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height(851),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: TopCloud(false),
                  ),
                  Positioned(
                    top: height(190),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(20),
                        ),
                        HorizontalLinee(
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
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff5B618A),
                              ),
                            ),
                            SizedBox(
                              height: height(4),
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
                              style: TextStyle(
                                  fontSize: 18.0, color: Color(0xff5B618A)),
                            ),
                            SizedBox(
                              height: height(4),
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
                                    style: const TextStyle(fontSize: 16),
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
                                style: TextStyle(
                                    fontSize: 18.0, color: Color(0xff5B618A)),
                              ),
                              SizedBox(
                                height: height(10),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _genderChoose = 'Male';
                                        _isGenderMale = !_isGenderMale;
                                        _isGenderFemale = false;
                                      });
                                    },
                                    child: ContainerChoose('Male', width(94),
                                        height(33), _isGenderMale),
                                  ),
                                  SizedBox(
                                    width: width(40),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _genderChoose = 'Female';
                                        _isGenderFemale = !_isGenderFemale;
                                        _isGenderMale = false;
                                      });
                                    },
                                    child: ContainerChoose('Female', width(94),
                                        height(33), _isGenderFemale),
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
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomCLoud(),
                  ),
                ],
              ),
            ),
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
