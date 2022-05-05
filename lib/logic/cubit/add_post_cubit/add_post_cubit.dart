import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/add_post_model.dart';
import 'package:rafiq/data/repositories/profile/post_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  PostRepo postRepo;
  AddPostCubit({required this.postRepo}) : super(AddPostInitial());

  late AddPostModel addPostModel;

  Future<void> addPost({String? text, List<File>? postOrVideo}) async {
    emit(AddPostLoadingState());
    try {
      addPostModel =
          await postRepo.addPost(text: text, photoOrVideo: postOrVideo);
      emit(AddPostSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(AddPostErrorState());
    }
  }

  List<XFile> imagesList = [];
  List<File> imageListFile = [];

  void convert() {
    for (int i = 0; i < imagesList.length; i++) {
      imageListFile.add(File(imagesList[i].path));
    }
  }

  File? singleImageFromCamera;
  void addSingleImagepostFiles(XFile images) {
    singleImageFromCamera = (File(images.path));
    imageListFile.add(singleImageFromCamera!);
    emit(GetSingleImageSuccess());
  }

  File? videoPostFile;
  void addVideopostFiles(XFile video) {
    videoPostFile = (File(video.path));
    imageListFile.add(videoPostFile!);
    emit(GetVideoSuccess());
  }

// work with UI
  bool isSelectAddImage = false;
  bool isChecked = false;
  Color color_1 = const Color(0xffE8DEEB),
      color_2 = const Color(0xffE8DEEB),
      color_3 = const Color(0xffE8DEEB);
  changeBackgroundColor(int index) {
    if (index == 1) {
      isSelectAddImage = true;
      color_1 = const Color(0xff5B618A);
      color_2 = Colors.grey;
      color_3 = Colors.grey;
    } else if (index == 2) {
      isSelectAddImage = false;
      color_2 = const Color(0xff5B618A);
      color_1 = Colors.grey;
      color_3 = Colors.grey;
    } else {
      color_3 = const Color(0xff5B618A);
      color_2 = Colors.grey;
      color_1 = Colors.grey;
    }
    isChecked = !isChecked;
    emit(ChangeColorState());
  }

  Color getColor(index) {
    if (index == 1) {
      return color_1;
    } else if (index == 2) {
      return color_2;
    } else {
      return color_3;
    }
  }

  String textPost = "";
  void changeValue(text) {
    textPost = text;
    emit(ChangeValueState());
  }

  bool clickableImage = true, clickableVideo = true, clickableTag = true;
  Future<void> nonclickable() async {
    clickableImage = false;
    clickableVideo = false;
    clickableTag = false;
    emit(NonClickableState());
  }
}
