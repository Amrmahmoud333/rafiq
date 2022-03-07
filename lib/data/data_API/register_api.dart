import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/register_model.dart';
import 'package:rafiq/data/repositories/register_repo.dart';

class RegisterAPI extends AuthRepo {
  @override
  Future<RegisterModel> registerRepo(
    AuthRequsetModel authRequsetModel,
  ) async {
    final response = await DioHelper.postData(
      url: 'http://localhost:3000/api/v1/auth/register/',
      data: authRequsetModel.toJson(),
    );
    //print(RegisterModel.fromJson(response.data).success);
    return RegisterModel.fromJson(response.data);
  }
}
