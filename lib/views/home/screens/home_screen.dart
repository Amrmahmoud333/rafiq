import 'package:flutter/material.dart';
import 'package:rafiq/views/shared/bottom_nav_bar.dart';
import 'package:rafiq/views/shared/floation_action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Home'),
      ),
      floatingActionButton: const CustomFloationActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavgiationBar(bottomNavIndex: 0),
    );
  }
}
