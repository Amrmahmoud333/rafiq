import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
}
