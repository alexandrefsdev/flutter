import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // final AuthenticationRepository _authenticationRepository =
  //     Get.find<AuthenticationRepository>();
  // final LocalAuthRepository _localAuthRepository =
  //     Get.find<LocalAuthRepository>();

  String _username = '', _password = '';

  void onUsernameChanged(String text) {
    _username = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  // Future<void> submit() async {
  //   try {
  //     RequestToken requestToken =
  //         await _authenticationRepository.newRequestToken();
  //     print("requestToken:  $requestToken");
  //     final RequestToken authRequestToken =
  //         await _authenticationRepository.authWithLogin(
  //       username: _username,
  //       password: _password,
  //       requestToken: requestToken.requestToken,
  //     );
  //     await _localAuthRepository.setSession(authRequestToken);
  //     print("Login ok! ${authRequestToken.expiresAt}");
  //     Get.offNamed(AppRoutes.HOME);
  //   } on Exception catch (e) {
  //     print(e);
  //     String title = "ERROR";
  //     String message = "";
  //     if (e is DioError) {
  //       if (e.response != null) {
  //         message = e.response!.statusMessage!;
  //       } else {
  //         message = e.message;
  //       }
  //     }
  //     Get.dialog(
  //       AlertDialog(
  //         title: Text(title),
  //         content: Text(message),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Get.back(),
  //             child: Text('Ok'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
}
