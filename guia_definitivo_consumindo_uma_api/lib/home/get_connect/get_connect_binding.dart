import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/get_connect/get_connect_controller.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/get_connect/repository/project_repository_get_connect.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';

class GetConnectBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IProjectRepository>(ProjectRepositoryGetConnect(Get.find()));
    Get.put(GetConnectController(Get.find()));
  }
}
