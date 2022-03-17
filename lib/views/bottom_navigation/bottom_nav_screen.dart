import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/bottom_nav_state_cubit/cubit/bottom_nav_cubit.dart';
import 'package:rafiq/views/shared/bottom_nav_bar.dart';
import 'package:rafiq/views/shared/floation_action_button.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocConsumer<BottomNavCubit, BottomNavState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: BlocProvider.of<BottomNavCubit>(context).bottumNavScreen[
              BlocProvider.of<BottomNavCubit>(context).currentIndex],
          floatingActionButton: const CustomFloationActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomNavgiationBar(),
        ),
      ),
    );
  }
}
