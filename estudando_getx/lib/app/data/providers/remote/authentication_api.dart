import 'package:dio/dio.dart';
import 'package:estudando_getx/app/data/models/request_token.dart';
import 'package:estudando_getx/app/data/utils/constants.dart';
import 'package:get/get.dart';

class AuthenticationApi {
  final Dio _dio = Get.find<Dio>();

  Future<RequestToken> newRequestToken() async {
    final response = await _dio.get(
      '/authentication/token/new',
      queryParameters: {
        "api_key": Constants.THE_MOVIE_DB_API_KEY,
      },
    );

    return RequestToken.fromJson(response.data);
  }

  Future<RequestToken> validateWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final response = await _dio.post(
      '/authentication/token/validate_with_login',
      queryParameters: {
        "api_key": Constants.THE_MOVIE_DB_API_KEY,
      },
      data: {
        "username": username,
        "password": password,
        "request_token": requestToken,
      },
    );

    return RequestToken.fromJson(response.data);
  }
}
