import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/Forget%20password/widgets/resend_button.dart';

class ThirdForgetPassword extends StatefulWidget {
  const ThirdForgetPassword({Key? key}) : super(key: key);

  @override
  State<ThirdForgetPassword> createState() => _ThirdForgetPasswordState();
}

class _ThirdForgetPasswordState extends State<ThirdForgetPassword> {
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
          top: height(168.86),
          left: width(74),
          right: width(74),
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/Done.png'),
            ),
            SizedBox(
              height: height(29.14),
            ),
            Center(
              child: AutoSizeText(
                'Reset Password',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 400 ? 35 : 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF5B618A),
                ),
              ),
            ),
            SizedBox(
              height: height(29),
            ),
            Wrap(
              children: const [
                Center(
                  child: AutoSizeText(
                    'We sent a link to your email address .Check your email to reset your password. If you want to send a new link , ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF5B618A),
                    ),
                  ),
                ),
                AutoSizeText(
                  'click ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF5B618A),
                  ),
                ),
                ResendButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
