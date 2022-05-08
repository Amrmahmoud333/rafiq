import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/image_post_dialog.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/video_post_dialog.dart';
import 'package:rafiq/views/profile/widgets/posts/widgets/add_container.dart';

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
    var addPostCubit = context.read<AddPostCubit>();
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffE8DEEB),
            elevation: 5,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0XFF5B618A)),
              onPressed: () {
                Navigator.of(context).pop();
                addPostCubit.resetAddPostScreen();
              },
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
                  SizedBox(
                    height: h(360),
                    width: w(370),
                    child: Column(
                      children: [
                        Expanded(
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
                            onChanged: (text) {
                              addPostCubit.changeValue(text);
                            },
                          ),
                        ),
                        if (addPostCubit.isSelectAddImage &&
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
                                  addPostCubit.imageListFile[index],
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
                          Container(
                            height: h(150),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: h(30)),
                  (addPostCubit.clickableImage)
                      ? InkWell(
                          onTap: () async {
                            context.read<AddPostCubit>().imageListFile = [];
                            context.read<AddPostCubit>().imagesList = [];
                            await context
                                .read<AddPostCubit>()
                                .nonclickable(index: 1);
                            await showSelectionImagePostDialog(
                                context: context);
                            context
                                .read<AddPostCubit>()
                                .changeBackgroundColor(1);
                          },
                          child: AddContainer(
                            imagePath: 'assets/images/add_image.svg',
                            text: 'Add Image/s',
                            index: 1,
                          ),
                        )
                      : AddContainer(
                          imagePath: 'assets/images/add_image.svg',
                          text: 'Add Image/s',
                          index: 1,
                        ),
                  SizedBox(height: h(20)),
                  addPostCubit.clickableVideo
                      ? InkWell(
                          onTap: () async {
                            context.read<AddPostCubit>().imageListFile = [];
                            context.read<AddPostCubit>().imagesList = [];
                            await context
                                .read<AddPostCubit>()
                                .nonclickable(index: 2);
                            await showSelectionVideoPostDialog(
                                context: context);
                            context
                                .read<AddPostCubit>()
                                .changeBackgroundColor(2);
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
                        ),
                  SizedBox(height: h(20)),
                  addPostCubit.clickableTag
                      ? InkWell(
                          onTap: () async {
                            await context
                                .read<AddPostCubit>()
                                .nonclickable(index: 3);
                            context
                                .read<AddPostCubit>()
                                .changeBackgroundColor(3);
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
                            addPostCubit.resetAddPostScreen();
                          }
                        },
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              addPostCubit.addPost(
                                text: addPostCubit.textPost,
                                postOrVideo: addPostCubit.imageListFile,
                              );
                            },
                            child: ConditionalBuilder(
                              condition: (state is! AddPostLoadingState),
                              builder: (context) {
                                addPostCubit.isSuccess = true;
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
                                addPostCubit.isSuccess = false;
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
      },
    );
  }
}
