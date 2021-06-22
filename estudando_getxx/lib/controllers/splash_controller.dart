import 'package:estudando_getxx/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.off(
          HomePage(),
          transition: Transition.fadeIn,
        );
      },
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("same as dispose");
    super.onClose();
  }
}
