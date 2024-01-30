import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/data/app_exceptions.dart';
import 'package:untitled/data/network/base_api_services.dart';
import 'package:untitled/data/shared_data.dart';

class NetworkApiServices extends BaseApiServices {
  final Dio _dio = Dio();
  final _preference = AppData();

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic response;
    try {
      final apiResponse = await _dio
          .get(
            url,
            options: Options(
              headers: {
                'Authorization': 'Bearer ${_preference.getAccessToken()}',
                'Content-Type': 'application/json; charset=UTF-8',
              },
            ),
          )
          .timeout(const Duration(seconds: 10));
      response = returnResponse(apiResponse);
    } on SocketException {
      throw InternetExceptions();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }

    return response;
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic response;
    try {
      final apiResponse = await _dio
          .post(
            url,
            data: data,
            options: Options(
              headers: {
                'Authorization': 'Bearer ${_preference.getAccessToken()}',
                'Content-Type': 'application/json; charset=UTF-8',
              },
            ),
          )
          .timeout(const Duration(seconds: 10));
      response = returnResponse(apiResponse);
    } on SocketException {
      throw InternetExceptions();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }

    return response;
  }
}

dynamic returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 401:
      throw Exception('Unauthorized');
    case 404:
      throw Exception('Not found');
    case 500:
      throw Exception('Internal server error');
    default:
      throw Exception('An unexpected error occurred');
  }
}
