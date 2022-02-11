import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ThirdForgetPassword extends StatelessWidget {
  const ThirdForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E3),
      body: Padding(
        padding: EdgeInsets.only(
          top: height(169),
        ),
        child: Column(
          children: [
            Container(),
            const Center(
              child: AutoSizeText(
                'Reset Password',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B618A),
                ),
              ),
            ),
            SizedBox(
              height: height(29),
            ),
            /* Padding(
              padding: EdgeInsets.only(
                left: width(74),
                right: width(74),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  const Center(
                    child: AutoSizeText(
                      'We sent a link to your email address .Check your email to reset your password. If you want to send a new link , click ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF5B618A),
                      ),
                    ),
                  ),
                  //لو في طريقة تانية افضل هنعملها
                  Row(
                    children: [
                      SizedBox(
                        width: width(44),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: width(1),
                              color: const Color(0xFF5B618A),
                            ),
                          ),
                        ),
                        child: const AutoSizeText(
                          'Resend',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF5B618A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
