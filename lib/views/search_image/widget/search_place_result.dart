import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';

class SearchByPlaceReslut extends StatelessWidget {
  const SearchByPlaceReslut({Key? key}) : super(key: key);

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

      body: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
        return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: h(15)),
 
            itemCount: cubit.searchPlaceModel.results!.suggestions!.length,
            itemBuilder: (context, index) {
              return Container(
                width: w(357),
                height: h(110),
                color: const Color(0xffE8DEEB),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: w(141),
                      height: h(110),
                      decoration: BoxDecoration(
                        image: cubit.searchPlaceModel.results!
                                .suggestions![index].images!.isEmpty
                            ? const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/clouds.png'),
                              )
                            : DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(cubit.searchPlaceModel
                                    .results!.suggestions![index].images![0]),
                              ),
                      ),
                    ),
                    SizedBox(width: w(15)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          cubit.searchPlaceModel.results!.suggestions![index]
                              .firstName!,
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5B618A)),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                'assets/images/city_icons/location.svg'),
                            const AutoSizeText('Location'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
