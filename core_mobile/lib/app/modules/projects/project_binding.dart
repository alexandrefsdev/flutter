import 'package:core_mobile/app/modules/projects/project_controller.dart';
import 'package:get/get.dart';

class ProjectBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController());
  }
}
