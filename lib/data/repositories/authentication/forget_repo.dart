import 'package:rafiq/data/models/forget_model.dart';

abstract class ForgetPasswordRepo {
  Future<void> forgetPasswordRepo(RequestForgetModel requestForgetModel);
}
