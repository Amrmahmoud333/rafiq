import 'dart:io';

import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/add_post_model.dart';

import 'package:rafiq/data/repositories/profile/post_repo.dart';

class PostAPI extends PostRepo {
  @override
  Future<AddPostModel> addPost({String? text, File? photo, File? video}) async {
    final response = await DioHelper.postDataWithHeader(
        url: url, data: data, header: header);
  }
}
