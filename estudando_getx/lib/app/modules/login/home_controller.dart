import 'package:dio/dio.dart';
import 'package:estudando_getx/app/data/models/request_token.dart';
import 'package:estudando_getx/app/data/repositories/remote/authentication_repository.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _repository = Get.find<AuthenticationRepository>();

  String _username = '', _password = '';

  void onUsernameChanged(String text) {
    _username = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<void> submit() async {
    try {
      RequestToken requestToken = await _repository.newRequestToken();
      print("requestToken:  $requestToken");
      final RequestToken authRequestToken = await _repository.authWithLogin(
        username: _username,
        password: _password,
        requestToken: requestToken.requestToken,
      );
      print("Login ok! ${authRequestToken.expiresAt}");
    } on Exception catch (e) {
      print(e);
      String title = "ERROR";
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response!.statusMessage!;
        } else {
          message = e.message;
        }
      }
      Get.dialog(
        AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    }
  }
}
