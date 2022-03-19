import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: '',
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
  }

  static Future<Response> getData({
    @required String? path,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      path!,
      queryParameters: query!,
    );
  }

  static Future<Response> postData({
    @required String? url,
    @required Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url!,
      data: data,
    );
  }

  static Future<Response> getcover({
    @required String? url,
    @required Map<String, dynamic>? header,
  }) async {
    return await dio.get(
      url!,
      options: Options(headers: header),
    );
  }
}
