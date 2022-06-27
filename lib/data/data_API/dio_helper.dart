import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:rafiq/core/constants/authentication_const.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: '',
      receiveDataWhenStatusError: true,
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

  static Future<Response> postDataWithHeader({
    @required String? url,
    @required dynamic data,
    @required Map<String, dynamic>? header,
  }) async {
    return await dio.post(
      url!,
      data: data,
      options: Options(headers: header),
    );
  }

  static Future<Response> getWithHeader({
    @required String? url,
    @required Map<String, dynamic>? header,
  }) async {
    return await dio.get(
      url!,
      options: Options(headers: header),
    );
  }

  static Future<Response> putWithHeader({
    @required String? url,
    @required Map<String, dynamic>? header,
    dynamic data,
  }) async {
    return await dio.put(
      url!,
      options: Options(headers: header),
      data: data,
    );
  }

  static Future<Response> putWithHeaderAndParameters({
    @required String? url,
    @required Map<String, dynamic>? header,
    @required Map<String, dynamic>? parameters,
    dynamic data,
  }) async {
    return await dio.put(
      url!,
      queryParameters: parameters,
      options: Options(headers: {'access-token': token}),
      data: data,
    );
  }

  static Future<Response> deleteWithHeader({
    required String? url,
    required Map<String, dynamic>? header,
  }) async {
    return await dio.delete(
      url!,
      options: Options(headers: header),
    );
  }
}
