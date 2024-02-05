import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../app_exceptions.dart';
import '../shared_data.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  final Dio _dio = Dio();

  @override
  Future<dynamic> getApi(String url) async {
    String accessToken = AppData.getAccessToken();
    dynamic response;

    if (kDebugMode) {
      print(url);
      print(accessToken);
    }

    try {
      final apiResponse = await _dio
          .get(
            url,
            options: Options(
              headers: {
                'Authorization': 'Bearer $accessToken',
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
    } catch (error) {
      throw Exception(error);
    }

    if (kDebugMode) {
      print(response);
    }

    return response;
  }

  @override
  Future<List<dynamic>> getListApi(String url) async {
    String accessToken = AppData.getAccessToken();
    List<dynamic> response;

    if (kDebugMode) {
      print(url);
      print(accessToken);
    }

    try {
      final apiResponse = await _dio
          .get(
            url,
            options: Options(
              headers: {
                'Authorization': 'Bearer $accessToken',
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
    } catch (error) {
      throw Exception(error);
    }
    if (kDebugMode) {
      print(response);
    }
    return response;
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    // String accessToken = AppData.getAccessToken();
    dynamic response;

    if (kDebugMode) {
      print(url);
      print(data);
      // print(accessToken);
    }

    try {
      final apiResponse = await _dio
          .post(
            url,
            data: data,
            options: Options(
              headers: {
                // 'Authorization': 'Bearer $accessToken',
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
    } catch (error) {
      throw Exception(error);
    }
    if (kDebugMode) {
      print(response);
    }
    return response;
  }

  @override
  Future<dynamic> patchApi(dynamic data, String url) async {
    String accessToken = AppData.getAccessToken();
    dynamic response;

    if (kDebugMode) {
      print(url);
      print(data);
      print(accessToken);
    }

    try {
      final apiResponse = await _dio
          .patch(
            url,
            data: data,
            options: Options(
              headers: {
                'Authorization': 'Bearer $accessToken',
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
    } catch (error) {
      throw Exception(error);
    }
    if (kDebugMode) {
      print(response);
    }
    return response;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    String accessToken = AppData.getAccessToken();
    dynamic response;

    if (kDebugMode) {
      print(url);
      print(accessToken);
    }

    try {
      final apiResponse = await _dio
          .delete(
            url,
            options: Options(
              headers: {
                'Authorization': 'Bearer $accessToken',
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
    } catch (error) {
      throw Exception(error);
    }
    if (kDebugMode) {
      print(response);
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
      throw Exception(response.data);
  }
}
