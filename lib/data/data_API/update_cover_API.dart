import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/update_cover_model.dart';
import 'package:rafiq/data/repositories/update_cover_repo.dart';

class UpdateCoverAPI extends UpdateCoverRepo {
  @override
  Future<UpdateCoverModel> updateCover() async {
    final response = await DioHelper.getcover(
        url: '$URL/api/v1/users/$USERNAME/cover',
        header: {'access-token': ACCESSTOKEN});

    return UpdateCoverModel.fromJson(response.data);
  }
}
