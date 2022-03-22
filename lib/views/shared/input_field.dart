import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/themes/theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.label,
    this.widget,
    this.controller,
    this.sizeoflabel,
    this.keyboardType,
    this.validator,
    this.maxLength,
    required this.obscureText,
  }) : super(key: key);

  final String label;
  final Widget? widget;
  final TextEditingController? controller;
  final double? sizeoflabel;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
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
          style: lableInputField(sizeoflabel!),
        ),
        Container(
          margin: EdgeInsets.only(
            top: height(4),
          ),
          width: width(313),
          height: height(38),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: width(2),
                color: const Color(0xFF5B618A),
              ),
            ),
            color: const Color(0xFFEBEBEB),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6E75A0),
                    //TODO fontFamily

                    // fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  controller: controller,
                  validator: validator,
                  maxLength: maxLength,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              widget ?? Container(),
              SizedBox(
                width: width(9),
              )
            ],
          ),
        ),
      ],
    );
  }
}
