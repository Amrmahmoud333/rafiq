// ignore_for_file: file_names

import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/login_model.dart';
import 'package:rafiq/data/repositories/authentication/login_repo.dart';

class LoginAPI extends LoginRepo {
  @override
  Future<LoginModel> loginRepo(RequestLoginModel requestLoginModel) async {
    final response = await DioHelper.postData(
        url: '$URL/$LOGIN', data: requestLoginModel.toJson());

    return LoginModel.fromJson(response.data);
  }
}
