import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/notification/screens/notification_screen.dart';

// TODO add name insted of user name

class SharePost extends StatelessWidget {
  const SharePost({Key? key}) : super(key: key);

  static const routeName = '/share_post';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    // String avatar = CahchHelper.getData(key: 'avatar');
    var cubit = context.read<UserDataCubit>();
    var addPostCubit = context.read<AddPostCubit>();
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffDBD1EB),
            elevation: 5.0,
            bottomOpacity: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0XFF5B618A)),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, NotificationScreen.routeName);
              },
            ),
            title: AutoSizeText(
              'Share',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              //   height: h(860),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffDBD1EB),
                    Color(0xffDBD1EB),
                    Color(0xffF7F4F8),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: h(200)),
                      child: Column(
                        children: [
                          SizedBox(height: h(24)),
                          Row(
                            children: [
                              SizedBox(width: w(16)),
                              Container(
                                width: w(50),
                                height: h(50),
                                decoration: BoxDecoration(
                                  color: const Color(0xff5B618A),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffE8DEEB), width: 2),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(cubit.avatar!),
                                  ),
                                ),
                              ),
                              SizedBox(width: w(9)),
                              BlocBuilder<UserDataCubit, UserDataState>(
                                builder: (context, state) {
                                  if (state is UserGetDataLoadingState) {
                                    return const AutoSizeText(
                                      '',
                                    );
                                  } else {
                                    return AutoSizeText(
                                      '${cubit.firstName} ${cubit.lastName}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0XFF5B618A),
                                        fontFamily: 'DavidLibre',
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: h(32)),
                          Padding(
                            padding: EdgeInsets.only(left: w(16)),
                            child: SizedBox(
                              height: h(81),
                              child: TextField(
                                maxLines: null,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color(0xFF6E75A0),
                                  fontWeight: FontWeight.w500,
                                ),
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'add text...',
                                  hintStyle: TextStyle(
                                      fontSize: 25.0, color: Color(0xFF6E75A0)),
                                ),
                                onChanged: (text) {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: w(9)),
                            child: Container(
                              color: const Color(0xff666666).withOpacity(.15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: w(7), top: h(10)),
                                        child: Container(
                                          width: w(50),
                                          height: h(50),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff5B618A),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: const Color(0xffE8DEEB),
                                                width: 2),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:
                                                  NetworkImage(cubit.avatar!),
                                            ),
                                          ),
                                        ),
                                      ),
                                      BlocBuilder<UserDataCubit, UserDataState>(
                                        builder: (context, state) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                left: w(6), top: h(17)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                (state is UserGetDataLoadingState)
                                                    ? const AutoSizeText(
                                                        '',
                                                      )
                                                    : AutoSizeText(
                                                        '${cubit.firstName} ${cubit.lastName}',
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0XFF5B618A),
                                                          fontFamily:
                                                              'DavidLibre',
                                                        ),
                                                      ),
                                                (state is UserGetDataLoadingState)
                                                    ? const AutoSizeText(
                                                        '',
                                                      )
                                                    : Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: w(10)),
                                                        child: AutoSizeText(
                                                          '${cubit.userName}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0XFF5B618A),
                                                            fontFamily:
                                                                'DavidLibre',
                                                          ),
                                                        ),
                                                      )
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: w(21),
                                      right: w(22),
                                      bottom: h(21),
                                      top: h(14),
                                    ),
                                    child: Text('kjsnkdfndkjfn'),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: h(40)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: h(85),
                    right: w(20),
                    child: BlocConsumer<AddPostCubit, AddPostState>(
                      listener: (context, state) async {
                        if (state is AddPostSuccessState) {
                          //replace with SharePostLoadingState
                          showTosat(
                              msg: 'Post created successfully', state: true);
                          Navigator.pop(context);
                          addPostCubit.resetAddPostScreen();
                        }
                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {},
                          child: ConditionalBuilder(
                            condition: (state
                                is! AddPostLoadingState), //replace with SharePostLoadingState
                            builder: (context) {
                              return Container(
                                height: h(45),
                                width: w(141),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF5B618A),
                                ),
                                child: const Center(
                                  child: AutoSizeText(
                                    'Share',
                                    style: TextStyle(
                                      color: Color(0xFFE8DEEB),
                                      fontSize: 25,
                                      fontFamily: 'DavidLibre',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            },
                            fallback: (context) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFF5B618A),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
