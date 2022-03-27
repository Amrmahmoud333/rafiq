import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/user_data_model.dart';
import 'package:rafiq/data/repositories/user_data_repo.dart';

String? token = CahchHelper.getData(key: 'token');

class UserDataAPI extends UserDataRepo {
  @override
  Future<UserDataModel> getUserDataRepo() async {
    final resonse = await DioHelper.getWithHeader(
        //'$URL$GETUSERPROFILE/$USERNAME/'
        // https://travel-with-rafiq.herokuapp.com/api/v1/users/amrma

        url: '$URL/$GETUSERPROFILE/$USERNAME/',
        header: {'access-token': token});
    return UserDataModel.fromJson(resonse.data);
  }
}
