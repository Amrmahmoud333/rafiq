import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/post_like_API.dart';
import 'package:rafiq/data/models/post/is_like_model.dart';
import 'package:rafiq/data/models/post/post_like.dart';
import 'package:rafiq/data/models/post/unlike_model.dart';

part 'post_like_state.dart';

class PostLikeCubit extends Cubit<PostLikeState> {
  PostLikeAPI postLikeAPI;
  PostLikeCubit({required this.postLikeAPI}) : super(PostLikeInitial());

  late PostLikeModel postLikeModel;

  Future<void> makeLikeToPost({required String postId}) async {
    emit(PostLikeLoadingState());
    try {
      postLikeModel = await postLikeAPI.makeLikeToPost(postId: postId);
      emit(PostLikeSuccessState());
    } on DioError catch (error) {
      emit(PostLikeErrorState());
      print(error.response);
    }
  }

  late IsLikeModel isLikeModel;
  Future<void> iSLike({required String postId}) async {
    emit(IsLikeLoadingState());
    try {
      isLikeModel = await postLikeAPI.isLike(postId: postId);
      emit(IsLikeSuccessState());
    } on DioError catch (error) {
      emit(IsLikeErrorState());
      print(error.response);
    }
  }

  late UnlikeModel unlikeModel;
  Future<void> unLike({required String postId, required String userId}) async {
    emit(UnLikeLoadingState());
    try {
      unlikeModel = await postLikeAPI.unLike(postId: postId, userId: userId);
      emit(UnLikeSuccessState());
    } on DioError catch (error) {
      emit(UnLikeErrorState());
      print(error.response);
    }
  }
}
