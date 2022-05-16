import 'package:flutter/material.dart';

class ResultHotelScreen extends StatelessWidget {
  const ResultHotelScreen({Key? key}) : super(key: key);
  static const routeName = '/city_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [Icon(Icons.arrow_back)]),
    );
  }
}
