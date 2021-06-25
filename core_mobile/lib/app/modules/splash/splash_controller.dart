import 'package:core_mobile/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  // final AuthenticationRepository _repository =
  //     Get.find<AuthenticationRepository>();

  // final LocalAuthRepository _localAuthRepository =
  //     Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    _init();
  }

  _init() async {
    try {
      Get.offNamed(
        AppRoutes.TABS,
        // arguments: requestToken.requestToken,
      );
    } catch (e) {
      print(e);
    }
  }
}
