import 'package:rafiq/data/models/user_data_model.dart';

abstract class UserDataRepo {
  Future<UserDataModel> getUserDataRepo();
}
