import 'package:get/get.dart';
import 'package:getx_pattern_kauemurakami/data/providers/remote/my_api_client.dart';
import 'package:getx_pattern_kauemurakami/data/repositories/posts_repository.dart';
import 'package:getx_pattern_kauemurakami/modules/home/home_controller.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
