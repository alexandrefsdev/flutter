import 'package:get/get.dart';
import 'package:getx_pattern_kauemurakami/data/providers/remote/my_api_client.dart';
import 'package:getx_pattern_kauemurakami/data/repositories/posts_repository.dart';
import 'package:getx_pattern_kauemurakami/modules/details/details_controller.dart';
import 'package:http/http.dart' as http;

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
