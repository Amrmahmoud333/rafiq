import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/profile/post_API.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/image_post_dialog.dart';
import 'package:rafiq/views/profile/widgets/posts/video_post_dialog.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/add_container.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/videos/videos.dart';

// TODO add name insted of user name

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  static const routeName = '/add_post';

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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(context.read<AddPostCubit>().isSuccess),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xffE8DEEB),
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFF5B618A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const AutoSizeText(
          'add post',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0XFF5B618A),
            fontFamily: 'DavidLibre',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h(851),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffDBD1EB),
                Color(0xffF7F4F8),
              ],
            ),
          ),
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
                      border:
                          Border.all(color: const Color(0xffE8DEEB), width: 2),
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
              SizedBox(
                height: h(360),
                width: w(370),
                child: BlocBuilder<AddPostCubit, AddPostState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Expanded(
                          child: TextField(
                            //expands: true,
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
                            onChanged: (text) {
                              context.read<AddPostCubit>().changeValue(text);
                            },
                          ),
                        ),
                        if (context.read<AddPostCubit>().isSelectAddImage &&
                            context
                                .read<AddPostCubit>()
                                .imageListFile
                                .isNotEmpty)
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  context
                                      .read<AddPostCubit>()
                                      .imageListFile[index],
                                  width: w(250),
                                  height: h(250),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              itemCount: context
                                  .read<AddPostCubit>()
                                  .imageListFile
                                  .length,
                            ),
                          )
                        else
                          Container(),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: h(30)),
              if (context.read<AddPostCubit>().clickableImage)
                BlocBuilder<AddPostCubit, AddPostState>(
                  builder: (context, state) {
                    return (context.read<AddPostCubit>().clickableImage)
                        ? InkWell(
                            onTap: () async {
                              showSelectionImagePostDialog(context: context);
                              context
                                  .read<AddPostCubit>()
                                  .changeBackgroundColor(1);
                              await context.read<AddPostCubit>().nonclickable();
                            },
                            child: AddContainer(
                              imagePath: 'assets/images/add_image.svg',
                              text: 'Add Image/s',
                              index: 1,
                            ),
                          )
                        : context.read<AddPostCubit>().singleImageFromCamera !=
                                null
                            ? AddContainer(
                                imagePath: 'assets/images/add_image.svg',
                                text: 'Add Image/s',
                                index: 1,
                              )
                            : InkWell(
                                onTap: () async {
                                  showSelectionImagePostDialog(
                                      context: context);
                                  context
                                      .read<AddPostCubit>()
                                      .changeBackgroundColor(1);
                                  await context
                                      .read<AddPostCubit>()
                                      .nonclickable();
                                },
                                child: AddContainer(
                                  imagePath: 'assets/images/add_image.svg',
                                  text: 'Add Image/s',
                                  index: 1,
                                ),
                              );
                  },
                ),
              SizedBox(height: h(20)),
              BlocBuilder<AddPostCubit, AddPostState>(
                builder: (context, state) {
                  return context.read<AddPostCubit>().clickableImage
                      ? InkWell(
                          onTap: () async {
                            showSelectionVideoPostDialog(context: context);
                            context
                                .read<AddPostCubit>()
                                .changeBackgroundColor(2);
                            await context.read<AddPostCubit>().nonclickable();
                          },
                          child: AddContainer(
                            imagePath: 'assets/images/add_video.svg',
                            text: 'Add Video',
                            index: 2,
                          ),
                        )
                      : AddContainer(
                          imagePath: 'assets/images/add_video.svg',
                          text: 'Add Video',
                          index: 2,
                        );
                },
              ),
              SizedBox(height: h(20)),
              BlocBuilder<AddPostCubit, AddPostState>(
                builder: (context, state) {
                  return context.read<AddPostCubit>().clickableImage
                      ? InkWell(
                          onTap: () async {
                            context
                                .read<AddPostCubit>()
                                .changeBackgroundColor(3);
                            await context.read<AddPostCubit>().nonclickable();
                          },
                          child: AddContainer(
                            imagePath: 'assets/images/add_image.svg',
                            text: 'Tag people/ cities',
                            index: 3,
                          ),
                        )
                      : AddContainer(
                          imagePath: 'assets/images/add_image.svg',
                          text: 'Tag people/ cities',
                          index: 3,
                        );
                },
              ),
              SizedBox(height: h(40)),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: w(20)),
                  child: BlocConsumer<AddPostCubit, AddPostState>(
                    listener: (context, state) async {
                      if (state is AddPostSuccessState) {
                        showTosat(
                            msg: 'Post created successfully', state: true);
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<AddPostCubit>(context).addPost(
                            text: context.read<AddPostCubit>().textPost,
                            postOrVideo: BlocProvider.of<AddPostCubit>(context)
                                .imageListFile,
                          );
                        },
                        child: ConditionalBuilder(
                          condition: (state is! AddPostLoadingState),
                          builder: (context) {
                            context.read<AddPostCubit>().isSuccess = true;
                            return Container(
                              height: h(45),
                              width: w(141),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF5B618A),
                              ),
                              child: const Center(
                                child: AutoSizeText(
                                  'Post',
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
                            context.read<AddPostCubit>().isSuccess = false;
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
