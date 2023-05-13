import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_models.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio _dio;
  AuthRepositoryImpl(this._dio);
  @override
  Future<AuthModels> login(String email, String senha) async {
    try {
      final result = await _dio.unauth().post(
        '/auth',
        data: {'email': email, 'password': senha, 'admin': true},
      );
      return AuthModels.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        print('Login ou senha inválidos');
        throw UnauthorizedException();
      }
      print('Erro ao realizar login');
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }
}
