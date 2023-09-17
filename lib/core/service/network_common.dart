import 'package:avocado/core/constants/string_constants.dart';
import 'package:avocado/core/service/app_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkCommon {
  static final NetworkCommon _singleton = NetworkCommon._internal();

  factory NetworkCommon() {
    return _singleton;
  }

  NetworkCommon._internal();

  static Dio? _dio;
  static const Duration _defaultTimeOut = Duration(seconds: 30);

  // global configuration
  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
          baseUrl: Constants.baseUrl,
          connectTimeout: _defaultTimeOut,
          receiveTimeout: _defaultTimeOut,
          sendTimeout: _defaultTimeOut));
      _dio?.interceptors.add(AppInterceptors());

      if (!kReleaseMode) {
        _dio?.interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 500));
      }
    }
    return _dio!;
  }
}
