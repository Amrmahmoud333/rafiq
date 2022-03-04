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
    @required Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      path!,
      queryParameters: query!,
    );
  }

  
}


