import 'dart:io';

import 'package:rafiq/data/models/add_post_model.dart';

abstract class PostRepo {
  Future<AddPostModel> addPost(
      {String? text, List<File>? photoOrVideo, bool? isVideo});
}
