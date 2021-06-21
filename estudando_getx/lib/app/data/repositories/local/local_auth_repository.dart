import 'package:estudando_getx/app/data/models/request_token.dart';
import 'package:estudando_getx/app/data/providers/local/local_auth.dart';
import 'package:get/get.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(RequestToken requestToken) =>
      _localAuth.setSession(requestToken);

  Future<RequestToken?> get session => _localAuth.getSession();
}
