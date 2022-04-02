import 'package:flutter/material.dart';
import 'package:rafiq/views/shared/edit_input_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';
  final fromKey = GlobalKey<FormState>();
  String? customValidteEmail(String? email) {
    if (email!.isEmpty || email.length < 2 || email.length >= 35) {
      return 'Enter a Correct Email or User Name';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EditInputField(
                validator: customValidteEmail,
                label: 'label',
                obscureText: false,
                sizeoflabel: 18,
                widget: InkWell(
                  onTap: () {
                    if (fromKey.currentState!.validate()) {
                      //print('mustafa');
                    }
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
