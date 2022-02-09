import 'package:experiment/style.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key, required this.label, this.widget, this.controller})
      : super(key: key);

  final String label;
  final Widget? widget;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: lableInputField(),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
              ),
              width: 313,
              height: 38,
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
      ),
    );
  }
}
