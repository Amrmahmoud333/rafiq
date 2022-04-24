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

  List<File>? imageOrVideoList;
  void fileAvatarImagePath(XFile imageOrVideo) {
    imageOrVideoList!.add(File(imageOrVideo.path));
    emit(GetImageOrVideoSuccess());
  }

// work with UI
  bool isChecked = false;
  Color color_1 = const Color(0xffE8DEEB),
      color_2 = const Color(0xffE8DEEB),
      color_3 = const Color(0xffE8DEEB);
  changeBackgroundColor(int index) {
    if (index == 1) {
      color_1 = const Color(0xff5B618A);
    } else if (index == 2) {
      color_2 = const Color(0xff5B618A);
    } else {
      color_3 = const Color(0xff5B618A);
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
}
