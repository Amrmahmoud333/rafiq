import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/forget_model.dart';
import 'package:rafiq/data/repositories/authentication/forget_repo.dart';

class ForgetApi extends ForgetPasswordRepo {
  @override
  Future<void> forgetPasswordRepo(RequestForgetModel requestForgetModel) async {
    await DioHelper.postData(
      url: '$URL$FORGET',
      data: requestForgetModel.toJson(),
    );
  }
}
