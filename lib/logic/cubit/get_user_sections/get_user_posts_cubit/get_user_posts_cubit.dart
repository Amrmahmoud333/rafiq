import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/models/get_profile_posts_model.dart';
import 'package:rafiq/data/repositories/profile/get_profile_sections_repo.dart';

part 'get_user_posts_state.dart';

class GetUserPostsCubit extends Cubit<GetUserPostsState> {
  GetProfileSectionsRepo getProfileSectionsRepo;
  GetUserPostsCubit({required this.getProfileSectionsRepo})
      : super(GetUserPostsInitial());

  late GetProfilePostsModel getProfilePostsModel;

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

      emit(GetUserMorePostsSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(GetUserMorePostsErrorState());
    }
  }

  String checkPostList({required int index}) {
    String messege = '';

    if (posts[index].content!.text == "" &&
        posts[index].content!.files!.isNotEmpty) {
      if (posts[index].content!.files![0].contains('jpg')) {
        messege = 'justPhoto';
      } else {
        messege = 'justVideo';
      }
    } else if (posts[index].content!.text == "" &&
        posts[index].content!.files!.isEmpty) {
      messege = 'justText';
    } else if (posts[index].content!.text != "" &&
        posts[index].content!.files!.isNotEmpty) {
      if (posts[index].content!.files![0].contains('jpg')) {
        messege = 'photoAndText';
      }
    } else {
      messege = 'videoAndText';
    }
    return messege;
  }

  // UI logic
  bool isMore = true;
  String label = 'See More';

  changeSeeMore() {
    isMore = !isMore;
    isMore ? label = 'See More...' : label = 'See Less...';
    emit(ChangeSeeMoreSuccessState());
  }
}
