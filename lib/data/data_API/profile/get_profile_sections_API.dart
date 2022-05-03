// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/get_profile_posts_model.dart';
import 'package:rafiq/data/repositories/profile/get_profile_sections_repo.dart';

class GetProfileSectionsAPI extends GetProfileSectionsRepo {
  /* @override
  Future<List<dynamic>> fetchPosts(int page, String? lastPostId,
      {required userID}) async {
    try {
      if (page == 1) {
        final response = await DioHelper.getWithHeader(
          url: '$URL/api/v1/users/$userID/posts?limit=1,10',
          header: {'access-token': token},
        );
        return GetProfilePostsModel.fromJson(response.data) as List<dynamic>;
      } else {
        final response = await DioHelper.getWithHeader(
          url: '$URL/api/v1/users/$userID/posts/morePosts/$lastPostId',
          header: {'access-token': token},
        );
        return GetProfilePostsModel.fromJson(response.data) as List<dynamic>;
      }
    } on DioError catch (error) {
      return [];
    }
  }*/

  /*
  to get posts of user  
  first request get 10 posts, to get more posts we change the api (URL) 
  and add last id of the last post 
  we make thet change in UI or cubit ,
  */
  @override
  Future<GetProfilePostsModel> getSomeUserPost(
      {String? lastId, String? url}) async {
    final response = await DioHelper.getWithHeader(
      url: url,
      header: {'access-token': token},
    );
    return GetProfilePostsModel.fromJson(response.data);
  }

  @override
  void getSomeUserPhotos() {
    // TODO: implement getSomeUserPhotos
  }

  @override
  void getSomeUserVideos() {
    // TODO: implement getSomeUserVideos
  }
}
