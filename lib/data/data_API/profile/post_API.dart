// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/add_post_model.dart';
import 'package:rafiq/data/models/post/delete_post.dart';
import 'package:rafiq/data/repositories/profile/post_repo.dart';
import 'package:http_parser/http_parser.dart';

class PostAPI extends PostRepo {
  @override
  Future<AddPostModel> addPost(
      {String? text, List<File>? photoOrVideo, bool? isVideo}) async {
    FormData formData = FormData();
    for (var file in photoOrVideo!) {
      String fileName = file.path.split('/').last;
      formData.files.addAll([
        MapEntry(
          'post',
          await MultipartFile.fromFile(file.path,
              filename: fileName,
              contentType: isVideo!
                  ? MediaType(
                      "video",
                      "mp4",
                    )
                  : MediaType(
                      "image",
                      "jpeg",
                    )),
        ),
      ]);
    }

    text ??= '';
    formData.fields.add(MapEntry('text', text));

    final response = await DioHelper.postDataWithHeader(
      url: '$URL/api/v1/users/$userName/posts/',
      header: {'access-token': token},
      data: formData,
    );
    return AddPostModel.fromJson(response.data);
  }

  @override
  Future<DeletePostModel> deletePostRepo({required String postId}) async {
    final response = await DioHelper.deleteWithHeader(
        url: '$URL/api/v1/users/$userName/posts/$postId',
        header: {'access-token': token});
    return DeletePostModel.fromjson(response.data);
  }
}
