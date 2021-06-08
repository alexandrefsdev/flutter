import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/dio/repository/project_repository_dio.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';

import 'dio_controller.dart';

class DioBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<IProjectRepository>(ProjectRepositoryDio(Get.find()));
    Get.put(DioController(Get.find()));
  }
}
