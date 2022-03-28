import 'dart:io';

import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/set_cover_image_model.dart';
import 'package:rafiq/data/repositories/cover_image_repo.dart';

String? token = CahchHelper.getData(key: 'token');

class CoverImageAPI extends CoverImageRepo {
  @override
  Future<SetCoverModel> setCoverRepo({File? file}) async {
    final response = await DioHelper.putWithHeader(
        url: '$URL/api/v1/users/$USERNAME/cover/',
        file: file,
        header: {'access-token': token});
    return SetCoverModel.fromJson(response.data);
  }

  @override
  Future<SetAvatarModel> setImageRepo({File? file}) async {
    final response = await DioHelper.putWithHeader(
        url: '$URL/api/v1/users/$USERNAME/avatar/',
        file: file,
        header: {'access-token': token});
    return SetAvatarModel.fromJson(response.data);
  }
}
