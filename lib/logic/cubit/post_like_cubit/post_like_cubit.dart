import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/post_like_API.dart';
import 'package:rafiq/data/models/post_like.dart';

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
}
