import 'package:rafiq/data/models/login_model.dart';
import 'package:rafiq/data/models/register_model.dart';

abstract class AuthRepo{

/*"firstName": "userB",
    "lastName": "userB",
    "userName": "userB",
    "email": "userB@gmail.com",
    "password": "password",
    "confirmPassword": "password",
    "country": "Egypt",
    "gender": "Male",
    "dateOfBirth": "2002-12-09"*/
  Future<RegisterModel> registerRepo(
   AuthRequsetModel authRequsetModel,
    );
 // Future<LoginModel> loginRepo();

}