// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/models/get_profile_posts_model.dart';
import 'package:rafiq/data/models/post/delete_post.dart';
import 'package:rafiq/data/repositories/profile/get_profile_sections_repo.dart';
import 'package:rafiq/data/repositories/profile/post_repo.dart';

part 'get_user_posts_state.dart';

class GetUserPostsCubit extends Cubit<GetUserPostsState> {
  GetProfileSectionsRepo getProfileSectionsRepo;
  PostRepo postRepo;
  GetUserPostsCubit(
      {required this.getProfileSectionsRepo, required this.postRepo})
      : super(GetUserPostsInitial());

  late GetProfilePostsModel getProfilePostsModel;
  late DeletePostModel deletePostModel;
  /*
  we will send in UI lastPostId 
  and the user name of the showen profile
  */
  List<Posts> posts = [];
  Future<void> getFirstPosts({@required userID}) async {
    emit(GetUserFirstPostsLoadinngState());
    try {
      posts = [];
      getProfilePostsModel = await getProfileSectionsRepo.getSomeUserPost(
        url: '$URL/api/v1/users/$userID/posts?limit=1,10',
      );
      for (int i = 0; i < getProfilePostsModel.posts!.length; i++) {
        posts.add(getProfilePostsModel.posts![i]);
      }

      print(posts.length);
      emit(GetUserFirstPostsSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(GetUserFirstPostsErrorState());
    }
  }

  int? lengthOfListThatComesFromRequest;
  Future<void> getMorePosts(
      {required String? userID, String? lastPostId}) async {
    emit(GetUserMorePostsLoadinngState());
    try {
      getProfilePostsModel = await getProfileSectionsRepo.getSomeUserPost(
        url: '$URL/api/v1/users/$userID/posts/morePosts/$lastPostId',
      );

      for (int i = 0; i < getProfilePostsModel.posts!.length; i++) {
        posts.add(getProfilePostsModel.posts![i]);
      }
      lengthOfListThatComesFromRequest = getProfilePostsModel.posts!.length;
      print(posts.length);
      isDeleted = false;
      emit(GetUserMorePostsSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(GetUserMorePostsErrorState());
    }
  }

  bool isDeleted = false;
  Future<void> deletePost({required String postId, required int index}) async {
    emit(DeletePostLoadingState());
    try {
      deletePostModel = await postRepo.deletePostRepo(postId: postId);
      posts.removeAt(index);
      isDeleted = true;
      emit(DeletePostSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(DeletePostErrorState());
    }
  }

  // UI logic
  String checkPostList({required int index}) {
    String messege = '';

    if (posts[index].content!.text == "" &&
        posts[index].content!.files!.isNotEmpty) {
      if (posts[index].content!.files![0].contains('jpg')) {
        messege = 'justPhoto';
      } else {
        messege = 'justVideo';
      }
    } else if (posts[index].content!.text != "" &&
        posts[index].content!.files!.isEmpty) {
      messege = 'justText';
    } else if (posts[index].content!.text != "" &&
        posts[index].content!.files!.isNotEmpty) {
      if (posts[index].content!.files![0].contains('jpg')) {
        messege = 'TextWithPhoto';
      }
    } else {
      messege = 'TextWithVideo';
    }
    return messege;
  }

  bool checkSeeMore(String latter) {
    int count = 0;
    for (int i = 0; i < latter.length; i++) {
      count++;
    }
    if (count > 84) return true;
    return false;
  }

  void changeIsMore(index) {
    posts[index].isMore = !posts[index].isMore;
    emit(ChangeISMoreState());
  }
}
