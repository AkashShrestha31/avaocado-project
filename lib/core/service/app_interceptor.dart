import 'dart:core';
import 'package:dio/dio.dart';

class AppInterceptors extends QueuedInterceptor {
  bool isRefreshTokenApplied = false;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
