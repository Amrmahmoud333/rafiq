import 'package:rafiq/data/models/register_model.dart';

abstract class RegisterRepo {
  Future<RegisterModel> registerRepo(
    RequsetRegisterModel requsetRegisterModel,
  );
}
