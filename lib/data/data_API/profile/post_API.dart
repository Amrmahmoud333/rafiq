import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/add_post_model.dart';
import 'package:rafiq/data/repositories/profile/post_repo.dart';

class PostAPI extends PostRepo {
  @override
  Future<AddPostModel> addPost({String? text, List<File>? photoOrVideo}) async {
    FormData formData = FormData();
    for (var file in photoOrVideo!) {
      formData.files.addAll([
        MapEntry('post', await MultipartFile.fromFile(file.path)),
      ]);
    }

    text ??= '';
    formData.fields.add(MapEntry('text', text));

    /*  for (int i = 0; i < photo!.length; i++) {
       String fileName = photo[i].path.split('/').last;
    formData. = FormData.fromMap({
        'post': await MultipartFile.fromFile(
          photo[i].path,
          filename: fileName,
          contentType: MediaType("image", "jpeg"),
        ),
      });
    }*/

    final response = await DioHelper.postDataWithHeader(
      url: '$URL/api/v1/users/$userName/posts/',
      header: {'access-token': token},
      data: formData,
    );
    return AddPostModel.fromJson(response.data);
  }
}
