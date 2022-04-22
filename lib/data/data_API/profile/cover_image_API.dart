import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/delete_cover_avatar.dart';
import 'package:rafiq/data/models/set_cover_avatar_model.dart';
import 'package:rafiq/data/repositories/profile/cover_image_repo.dart';
import 'package:http_parser/http_parser.dart';

// user name dons not deleted
class CoverImageAPI extends CoverImageRepo {
  @override
  Future<SetCoverModel> setCoverRepo({File? file}) async {
    String fileName = file!.path.split('/').last;
    FormData formData = FormData.fromMap({
      'cover': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType("image", "jpeg"),
      ),
    });
    print('cover image api' + USERNAME.toString());
    final response = await DioHelper.putWithHeader(
        url: '$URL/api/v1/users/$USERNAME/cover/',
        data: formData,
        header: {'access-token': ACCESSTOKEN});
    return SetCoverModel.fromJson(response.data);
  }

  @override
  Future<SetAvatarModel> setImageRepo({File? file}) async {
    String fileName = file!.path.split('/').last;
    FormData formData = FormData.fromMap({
      'avatar': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType("image", "jpeg"),
      ),
    });

    final response = await DioHelper.putWithHeader(
        url: '$URL/api/v1/users/$USERNAME/avatar/',
        data: formData,
        header: {'access-token': ACCESSTOKEN});
    return SetAvatarModel.fromJson(response.data);
  }

  @override
  Future<DeleteCoverModel> deleteCoverRepo() async {
    final response = await DioHelper.deleteWithHeader(
        url: '$URL/api/v1/users/$USERNAME/cover/',
        header: {'access-token': ACCESSTOKEN});

    return DeleteCoverModel.fromjson(response.data);
  }

  @override
  Future<DeleteAvatarModel> deleteAvatarRepo() async {
    final response = await DioHelper.deleteWithHeader(
        url: '$URL/api/v1/users/$USERNAME/cover/',
        header: {'access-token': ACCESSTOKEN});

    return DeleteAvatarModel.fromjson(response.data);
  }
}
