import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_zenn_api_freezed/services/api/api_error.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIService {
  APIService._() {
    _dio = Dio();
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static final instance = APIService._();
  late Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    Response _response;

    final endpoint = '$_baseUrl$path';

    try {
      if (queryParameters == null) {
        _response = await _dio.get(endpoint);
      } else {
        _response = await _dio.get(
          endpoint,
          queryParameters: queryParameters,
        );
      }

      switch (_response.statusCode) {
        case 200:
          return _response.data;
        case 500:
          throw const APIError.serviceUnavailable();
        default:
          throw const APIError.unknown();
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw const APIError.noInternetConnection();
      }

      throw const APIError.unknown();
    }
  }
}
