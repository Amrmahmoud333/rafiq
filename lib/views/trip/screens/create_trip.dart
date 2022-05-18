import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CreateTrip extends StatelessWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: const [
                  Icon(Icons.arrow_back),
                  AutoSizeText(
                    'Create Trip',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff5B618A),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
