import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class InputField2 extends StatelessWidget {
  const InputField2({
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
        SizedBox(
          height: height(4),
        ),
        TextFormField(
          style: Theme.of(context).textTheme.headline6,
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          maxLength: maxLength,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            suffixIcon: widget,
            filled: true,
            fillColor: Color(0xFFEBEBEB),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: const Color(0xFF5B618A),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
