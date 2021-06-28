import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_pattern_kauemurakami/modules/details/details_bindings.dart';
import 'package:getx_pattern_kauemurakami/modules/details/details_page.dart';
import 'package:getx_pattern_kauemurakami/modules/home/home_page.dart';
import 'package:getx_pattern_kauemurakami/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()), //dependencias de details via rota
  ];
}
