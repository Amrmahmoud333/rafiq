import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/shared/edit_input_field.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_screen';
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffDBD1EB),
              Color(0xffDBD1EB),
              Color(0xffF7F4F8),
            ],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: height(165),
              child: Stack(
                children: [
                  Positioned(
                    left: width(19),
                    top: height(23.83),
                    child: SizedBox(
                      width: width(264),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back),
                          ),
                          Text(
                            'Edit your profile',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -25,
                    child: SvgPicture.asset(
                        'assets/images/edit_profile/Earth.svg'),
                  ),
                  const Positioned(
                    top: 95,
                    left: 39,
                    child: EditInputField(
                      label: 'ddsdsf',
                      sizeoflabel: 20,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
