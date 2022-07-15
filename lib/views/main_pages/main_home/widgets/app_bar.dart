import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';
import 'package:rafiq/views/search_image/widget/options.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.newContext,
  }) : super(key: key);
  final BuildContext? newContext;
  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(newContext!).size.height * (55 / 851));
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(newContext!).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = BlocProvider.of<SearchCubit>(context);

    return AppBar(
      backgroundColor: const Color(0xffE8DEEB),
      title: InkWell(
        onTap: () {
          // showSearch(context: context, delegate: MySearchDelegate());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: w(200),
                  height: h(32),
                  padding: const EdgeInsets.all(5.5),
                  decoration: const BoxDecoration(
                    color: Color(0xff9C9BB7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      onChanged: (value) async {
                        cubit.searchPlace(place: value);
                      },
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5B618A),
                      ),
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                          color: Color(0xffCFCBDC),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffEBEBEBB5),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: h(32),
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
                width: w(32),
                height: h(32),
                decoration: BoxDecoration(
                  color: const Color(0xff5B618A).withOpacity(0.9),
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
    );
  }
}
