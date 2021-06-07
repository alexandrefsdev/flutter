import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/http/http_controller.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/repository/project_http_repository.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';

class HttpBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IProjectRepository>(ProjectHttpRepository());
    Get.put(HttpController(Get.find()));
  }
}
