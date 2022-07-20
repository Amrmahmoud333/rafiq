import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';
import 'package:rafiq/views/main_pages/main_home/widgets/app_bar.dart';
import 'package:rafiq/views/search_image/widget/no_results_column.dart';
import 'package:rafiq/views/search_image/widget/search_place_result.dart';
import 'package:rafiq/views/search_image/widget/search_user_result.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = context.read<SearchCubit>();
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<SearchCubit>(context).isSearchScreen = false;
        BlocProvider.of<SearchCubit>(context).isChange = false;
        return true;
      },
      child: Scaffold(
        appBar: MyAppBar(newContext: context),
        body: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
          return cubit.dropDownVal == 'Users'
              ? state is SearchByUserLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffE5E5E5),
                      ),
                    )
                  : cubit.searchUserModel.results!.suggestions!.isEmpty
                      ? const NoResultsColumn()
                      : const SearchUserReslut()
              : state is SearchPlaceLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffE5E5E5),
                      ),
                    )
                  : cubit.searchPlaceModel.results!.suggestions!.isEmpty
                      ? const NoResultsColumn()
                      : const SearchByPlaceReslut();
        }),
      ),
    );
  }
}
