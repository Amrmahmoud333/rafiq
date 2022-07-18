// ignore_for_file: file_names

import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/models/newsfeed_model.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';

class NewsFeedAPI {
  Future<NewsfeedModel> getPosts() async {
    final response = DioHelper.getWithHeader(
        url: '$URL/api/v1/newsFeed', header: {'access-token': token});
    return NewsfeedModel.fromJson(response.data);
  }
}
