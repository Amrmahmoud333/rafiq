// ignore_for_file: file_names
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/update_user_info_model.dart';
import 'package:rafiq/data/repositories/profile/update_user_info_model_repo.dart';

class UpdateUserInfoAPI extends UpdataUserInfoRepo {
  @override
  Future<UpdateUserInfoResModel> updateUserInfoRepo(
      UpdateUserInfoReqModel updateUserInfoReqModel) async {
    final response = await DioHelper.putWithHeader(
      //{{URL}}/api/v1/users/amrma/info
      url: '$URL/api/v1/users/$userName/info',
      header: {'access-token': token},
      data: updateUserInfoReqModel.toJson(),
    );
    return UpdateUserInfoResModel.fromJson(response.data);
  }
}
