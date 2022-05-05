import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/models/get_profile_posts_model.dart';
import 'package:rafiq/data/repositories/profile/get_profile_sections_repo.dart';
import 'package:rafiq/views/profile/widgets/posts/post.dart';

part 'get_user_posts_state.dart';

class GetUserPostsCubit extends Cubit<GetUserPostsState> {
  GetProfileSectionsRepo getProfileSectionsRepo;
  GetUserPostsCubit({required this.getProfileSectionsRepo})
      : super(GetUserPostsInitial());

  late GetProfilePostsModel getProfilePostsModel;

  /*void loadPosts() {
    if (state is PostsLoading) return;

    // the current  state of this cubit 
    final currentState = state;

    var oldPosts = <Posts>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));

    getProfileSectionsRepo.fetchPosts(page).then((newPosts) {
      page++;

      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);    

      emit(PostsLoaded(posts));
    });
  }*/

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

  int page = 1;
  int x = 0;
  Future<void> getMorePosts({required String? userID}) async {
    emit(GetUserMorePostsLoadinngState());
    try {
      String lastPostId = getProfilePostsModel.posts![posts.length - 1].sId!;
      getProfilePostsModel = await getProfileSectionsRepo.getSomeUserPost(
        url: '$URL/api/v1/users/$userID/posts/morePosts/$lastPostId',
      );

      /*for (int i = 0; i < getProfilePostsModel.posts!.length; i++) {
        posts.add(getProfilePostsModel.posts![i]);
      }*/
      posts.addAll(getProfilePostsModel.posts!);
      print(posts.length);

      emit(GetUserMorePostsSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(GetUserMorePostsErrorState());
    }
  }

  bool morePosts = true;
  void changeMorePosts() {
    morePosts = !morePosts;
    emit(ChangeMorePostsState());
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
