import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';

class SearchUserReslut extends StatelessWidget {
  const SearchUserReslut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    SearchCubit cubit = context.read<SearchCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: h(5)),
          itemCount: cubit.searchUserModel.results!.suggestions!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                width: w(350),
                height: h(60),
                color: const Color(0xffE8DEEB),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: w(60),
                      height: h(60),
                      decoration: BoxDecoration(
                        image: cubit.searchUserModel.results!
                                    .suggestions![index].avatar ==
                                null
                            ? const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/default.png'),
                              )
                            : DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(cubit.searchUserModel
                                    .results!.suggestions![index].avatar!),
                              ),
                      ),
                    ),
                    SizedBox(width: w(15)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          '${cubit.searchUserModel.results!.suggestions![index].firstName!} ${cubit.searchUserModel.results!.suggestions![index].lastName!}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5B618A)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
