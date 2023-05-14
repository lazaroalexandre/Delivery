// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../global/constants.dart';
import '../../storage/storage.dart';
import '../../global/gobal_context.dart';

class AuthInterceptor extends Interceptor {
  final Storage storage;
  AuthInterceptor({
    required this.storage,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = storage.getData(SessionStorageKey.acessTokens.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      GobalContext.instance.loginExpire();
    } else {
      handler.next(err);
    }
    super.onError(err, handler);
  }
}
