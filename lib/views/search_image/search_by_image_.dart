import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';
import 'package:rafiq/views/search_image/widget/no_results_column.dart';
import 'package:rafiq/views/search_image/widget/options.dart';

class SearchByImage extends StatelessWidget {
  const SearchByImage({Key? key}) : super(key: key);

  static const routeName = '/search_by_image_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    var cubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      backgroundColor: const Color(0xffE8DEEB),
      body: Column(
        children: [
          SizedBox(
            height: h(10),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: w(8), top: h(22)),
                child: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color(0xff5B618A),
                  ),
                ),
              ),
              SizedBox(
                width: w(9),
              ),
              Padding(
                padding: EdgeInsets.only(top: h(20)),
                child: const AutoSizeText(
                  'Country',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff5B618A),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: w(15), right: w(13)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Row content  searchFormField && options DropdownButton
                Row(
                  children: [
                    Container(
                      width: w(213),
                      height: h(42),
                      padding: const EdgeInsets.all(5.5),
                      decoration: const BoxDecoration(
                        color: Color(0xff9C9BB7),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5B618A)),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: const Color(0xffebebebb5).withOpacity(0.71),
                          ),
                          hintText: 'Search for country',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffEBEBEBB5).withOpacity(0.71),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: h(42),
                      width: w(1.5),
                      color: const Color(0xffebebebb5).withOpacity(0.71),
                    ),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return OptionsDropDownButton(
                          items: cubit.listVals,
                          value: cubit.dropDownVal,
                        );
                      },
                    ),
                  ],
                ),

                // Container Search by image from gallery
                InkWell(
                  onTap: () async {
                    await searchImageFromGallery(context);
                  },
                  child: Container(
                    width: w(39),
                    height: h(40),
                    decoration: BoxDecoration(
                      color: Color(0xff5B618A).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/search_image/camera2.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const NoResultsColumn(),
        ],
      ),
    );
  }
}
