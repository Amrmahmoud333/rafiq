import 'dart:io';

import 'package:rafiq/data/models/add_post_model.dart';
import 'package:rafiq/data/models/post/delete_post.dart';

abstract class PostRepo {
  Future<AddPostModel> addPost(
      {String? text, List<File>? photoOrVideo, bool? isVideo});

  Future<DeletePostModel> deletePostRepo({required String postId});
}
