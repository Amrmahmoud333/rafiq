// ignore_for_file: file_names

import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/city/city_information_model.dart';

class CityInformationAPI {
  Future<CityInformationModel> getCityInfo() async {
    final response = await DioHelper.getWithHeader(
        // city id for cairo 1392685764
        url: '$URL/api/v1/cities/1392685764/',
        header: {'access-token': token});
    return CityInformationModel.fromJson(response.data);
  }
}
