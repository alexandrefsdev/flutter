import 'package:core_mobile/app/modules/projects/project_controller.dart';
import 'package:core_mobile/app/modules/tabs/tabs_controller.dart';
import 'package:get/get.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabsController());
    Get.lazyPut(() => ProjectController());
  }
}
