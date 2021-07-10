import 'dart:convert';
import 'dart:io';

import 'package:api_demo2/getx_imageview_app/exception/httpexception.dart';
import 'package:api_demo2/getx_imageview_app/modelclass/image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioServices {
  BaseOptions _options = BaseOptions(
    baseUrl: 'https://api.unsplash.com/',
    followRedirects: false,
    validateStatus: (status) => true

  );

  Future getAPI(String url) async {
    try {
      final _dioInstance = Dio(_options);
      _dioInstance.options.headers['Authorization'] =
          'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
      final response = await _dioInstance
          .request(url, options: Options(method: 'GET'))
          .catchError((error) {
       throw HttpException(500, message:  "Server error");
      });
         print(response.statusCode);

      if (response.statusCode! < 200 || response.statusCode! > 226) {

       throw HttpException(response.statusCode);

      } else {
        List<dynamic> jsonString = response.data;
        String jsondata = json.encode(jsonString);
       // print(jsonString.toString());
        print(response.data);
        return imageFromJson(jsondata);
      }
    }

    catch (e) {
      throw e;
    }
  }
  Future<dynamic> postAPI() async {
    final _dioInstance = Dio(_options);
    final response = await _dioInstance.request(
      '/api',
      options: Options(method: 'POST'),
    );
  }
}
// on SocketException catch (e) {
//   throw NoInternetException('No Internet');
// }