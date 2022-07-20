import 'package:rafiq/data/models/get_profile_posts_model.dart';
import 'package:rafiq/data/models/profile_image_model.dart';

abstract class GetProfileSectionsRepo {
  Future<GetProfilePostsModel> getSomeUserPost({String? lastId, String? url});
  Future<ProfileImageModel> getSomeUserPhotos();
  void getSomeUserVideos();
}
