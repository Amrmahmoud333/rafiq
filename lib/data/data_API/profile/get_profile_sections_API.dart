// ignore_for_file: file_names
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/get_profile_posts_model.dart';
import 'package:rafiq/data/models/profile_image_model.dart';
import 'package:rafiq/data/repositories/profile/get_profile_sections_repo.dart';

class GetProfileSectionsAPI extends GetProfileSectionsRepo {
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
  Future<ProfileImageModel> getSomeUserPhotos() async {
    final response = await DioHelper.getWithHeader(
      // TODO useName
      url: '$URL/api/v1/users/amrma/posts/images',
      header: {'access-token': token},
    );
    return ProfileImageModel.fromJson(response.data);
  }

  @override
  void getSomeUserVideos() {
    // TODO: implement getSomeUserVideos
  }
}
