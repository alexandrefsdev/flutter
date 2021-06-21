import 'package:estudando_getx/app/data/models/request_token.dart';
import 'package:estudando_getx/app/data/providers/remote/authentication_api.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  final AuthenticationApi _api = Get.find<AuthenticationApi>();

  Future<RequestToken> newRequestToken() => _api.newRequestToken();
  Future<RequestToken> authWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) =>
      _api.validateWithLogin(
        username: username,
        password: password,
        requestToken: requestToken,
      );
}
