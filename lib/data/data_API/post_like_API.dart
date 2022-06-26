// ignore_for_file: file_names
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/post/is_like_model.dart';
import 'package:rafiq/data/models/post/post_like.dart';
import 'package:rafiq/data/models/post/unlike_model.dart';

class PostLikeAPI {
  Future<PostLikeModel> makeLikeToPost({required String postId}) async {
    final response = await DioHelper.putWithHeader(
      url: '$URL/api/v1/users/abc/posts/$postId/like',
      header: {'access-token': token},
    );
    return PostLikeModel.fromJson(response.data);
  }

  Future<IsLikeModel> isLike({required String postId}) async {
    final response = await DioHelper.getWithHeader(
      url: '$URL/api/v1/users/abc/posts/$postId/isLiked',
      header: {'access-token': token},
    );
    return IsLikeModel.fromJson(response.data);
  }

  Future<UnlikeModel> unLike(
      {required String postId, required String userId}) async {
    final response = await DioHelper.deleteWithHeader(
      url: '$URL/api/v1/users/$userId/posts/$postId/like',
      header: {'access-token': token},
    );
    return UnlikeModel.fromJson(response.data);
  }
}
