import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/get_user_sections/get_user_photos_cubit/cubit/get_user_photo_cubit.dart';

class Images extends StatelessWidget {
  const Images({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.height * (n / 393);
    }

    GetUserPhotoCubit cubit = context.read<GetUserPhotoCubit>();
    cubit.getUserPhoto();
    return BlocBuilder<GetUserPhotoCubit, GetUserPhotoState>(
      builder: (context, state) {
        return state is GetUserPhotoLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffE5E5E5),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: w(5), vertical: h(5)),
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff5B618A),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(cubit
                              .profileImageModel.results!.data![index].url!),
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.profileImageModel.results!.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: w(10.0),
                    mainAxisSpacing: h(20.0),
                    mainAxisExtent: h(167),
                  ),
                ),
              );
      },
    );
  }
}
