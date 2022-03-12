import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/register_model.dart';
import 'package:rafiq/data/repositories/authentication/register_repo.dart';

class RegisterAPI extends RegisterRepo {
  @override
  Future<RegisterModel> registerRepo(
      RequsetRegisterModel requsetRegisterModel) async {
    final response = await DioHelper.postData(
        url: '$URL/$REGISTER', data: requsetRegisterModel.toJson());
    return RegisterModel.fromJson(response.data);
  }
}
