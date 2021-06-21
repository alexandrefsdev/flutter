import 'package:estudando_getx/app/data/models/request_token.dart';
import 'package:estudando_getx/app/data/repositories/local/local_auth_repository.dart';
import 'package:estudando_getx/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  // final AuthenticationRepository _repository =
  //     Get.find<AuthenticationRepository>();

  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    _init();
  }

  _init() async {
    try {
      // await Future.delayed(Duration(seconds: 2));
      // RequestToken requestToken = await _repository.newRequestToken();

      final RequestToken? requestToken = await _localAuthRepository.session;

      Get.offNamed(
        requestToken != null ? AppRoutes.HOME : AppRoutes.LOGIN,
        // arguments: requestToken.requestToken,
      );
    } catch (e) {
      print(e);
    }
  }
}
