import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/main_home/main_home_cubit.dart';
import 'package:rafiq/views/shared/bottom_nav_bar.dart';
import 'package:rafiq/views/shared/floation_action_button.dart';
import '../widgets/app_bar.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);
  static const routeName = '/main_home_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainHomeCubit(),
      child: BlocConsumer<MainHomeCubit, MainHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<MainHomeCubit>(context);
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
