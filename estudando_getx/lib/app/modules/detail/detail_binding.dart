import 'package:estudando_getx/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),);
  }
}
