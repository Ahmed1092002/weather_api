import 'package:dio/dio.dart';

class DioHelper {

  static Dio? dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://api.weatherapi.com/v1/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData(
      {
    required String url,
    Map<String,dynamic> ?query,
  }
  )
  async {
    return await dio!.get(url,queryParameters:query );
  }





  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) {

    dio!.options.headers = {
      'content-type':'application/json',
    };
    return dio!.post(url, queryParameters: query, data: data);
  }









}