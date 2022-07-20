import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';
import 'package:rafiq/views/main_pages/main_home/widgets/app_bar.dart';
import 'package:rafiq/views/search_image/widget/no_results_column.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<SearchCubit>(context).isSearchScreen = false;
        BlocProvider.of<SearchCubit>(context).isChange = false;
        return true;
      },
      child: Scaffold(
        appBar: MyAppBar(newContext: context),
        body: const NoResultsColumn(),
      ),
    );
  }
}
