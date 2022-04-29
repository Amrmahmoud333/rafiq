import 'package:rafiq/data/models/get_profile_posts_model.dart';

abstract class GetPorfileSectionsRepo {
  Future<GetProfilePostsModel> getSomeUserPost({String? lastId});
  void getSomeUserPhotos();
  void getSomeUserVideos();
}
