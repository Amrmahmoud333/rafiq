import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/user_data_model.dart';
import 'package:rafiq/data/repositories/profile/user_data_repo.dart';

class UserDataAPI extends UserDataRepo {
  @override
  Future<UserDataModel> getUserDataRepo() async {
    final resonse = await DioHelper.getWithHeader(
        //'$URL$GETUSERPROFILE/$USERNAME/'
        // https://travel-with-rafiq.herokuapp.com/api/v1/users/amrma

//$URL/$GETUSERPROFILE/$USERNAME/

        url: '$URL/$GETUSERPROFILE/$userName/',
        header: {'access-token': token});
    return UserDataModel.fromJson(resonse.data);
  }
}
