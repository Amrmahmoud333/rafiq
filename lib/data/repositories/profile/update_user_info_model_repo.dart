import 'package:rafiq/data/models/update_user_info_model.dart';

abstract class UpdataUserInfoRepo {
  Future<UpdateUserInfoResModel> updateUserInfoRepo(
      UpdateUserInfoReqModel updateUserInfoReqModel);
}
