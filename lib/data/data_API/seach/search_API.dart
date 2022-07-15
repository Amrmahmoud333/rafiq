// ignore_for_file: file_names

import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/search/search_place_model.dart';
import 'package:rafiq/data/models/search/search_user_model.dart';

class SearchAPI {
  Future<SearchUserModel> searchByUser({required String user}) async {
    final response = await DioHelper.getWithHeader(
        url: '$URL/api/v1/search/liveSearch?type=user&q=$user',
        header: {'access-token': token});
    return SearchUserModel.fromJson(response.data);
  }

  Future<SearchPlaceModel> searchPlace({required String place}) async {
    final response = await DioHelper.getWithHeader(
        url: '$URL/api/v1/search/liveSearch?type=place&q=$place',
        header: {'access-token': token});
    return SearchPlaceModel.fromJson(response.data);
  }
}
