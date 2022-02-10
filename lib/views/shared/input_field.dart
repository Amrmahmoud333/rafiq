import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.label,
    this.widget,
    this.controller,
    required this.sizeoflabel,
    this.keyboardType,
    required this.obscureText,
  }) : super(key: key);

  final String label;
  final Widget? widget;
  final TextEditingController? controller;
  final double sizeoflabel;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          label,
          style: lableInputField(sizeoflabel),
        ),
        Container(
          margin: EdgeInsets.only(
            top: height(8),
          ),
          width: width(313),
          height: height(38),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: width(3),
                color: const Color(0xFF5B618A),
              ),
            ),
            color: const Color(0xFFF5F5F5),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6E75A0),
                    //////////////// //ناقص نوع الخط
                  ),
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: width(0),
                        color: const Color(0xFF5B618A),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: width(0),
                        color: const Color(0xFF5B618A),
                      ),
                    ),
                  ),
                ),
              ),
              widget ?? Container(),
              SizedBox(
                width: width(9),
              )
            ],
          ),
        )
      ],
    );
  }
}
