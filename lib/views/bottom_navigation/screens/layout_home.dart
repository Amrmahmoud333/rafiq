import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/bottom_nav_state_cubit/cubit/bottom_nav_cubit.dart';
import 'package:rafiq/views/bottom_navigation/widgets/app_bar.dart';
import 'package:rafiq/views/shared/bottom_nav_bar.dart';
import 'package:rafiq/views/shared/floation_action_button.dart';

class LayoutHomeScreen extends StatelessWidget {
  const LayoutHomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocConsumer<BottomNavCubit, BottomNavState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<BottomNavCubit>(context);
          return Scaffold(
            drawer: Drawer(),
            appBar: MyAppBar(newContext: context),
            // change between list of screens in the same page to navigate between them
            body: cubit.bottumNavScreen[cubit.currentIndex],
            // add floatingActionButton to the CustomBottomNavgiationBar
            floatingActionButton: const CustomFloationActionButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomNavgiationBar(),
          );
        },
      ),
    );
  }
}

/*
class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
*/
