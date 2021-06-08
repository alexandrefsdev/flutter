import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/shared/rest_client.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RestClient());
  }
}
