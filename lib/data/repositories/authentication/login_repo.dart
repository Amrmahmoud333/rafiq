import 'package:rafiq/data/models/login_model.dart';

abstract class LoginRepo {
  Future<LoginModel> loginRepo(
    RequestLoginModel requestLoginModel,
  );
}
