import 'package:flutter/material.dart';

import '../../style.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, this.label, this.widget, this.controller})
      : super(key: key);

  final String? label;
  final Widget? widget;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      margin: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(
                  label!,
                  style: lableInputField(),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          Container(
            margin: const EdgeInsets.only(
              top: 8,
            ),
            width: width(313),
            height: height(38),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3,
                  color: Color(0xFF6E75A0),
                ),
              ),
              color: Color(0xFFF5F5F5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6E75A0),

                      //////////////// //ناقص نوع الخط
                    ),
                    controller: controller,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Color(0xFF6E75A0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Color(0xFF6E75A0),
                        ),
                      ),
                    ),
                  ),
                ),
                widget ?? Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
