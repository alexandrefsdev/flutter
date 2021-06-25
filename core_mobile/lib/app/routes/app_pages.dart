import 'package:core_mobile/app/modules/login/login_binding.dart';
import 'package:core_mobile/app/modules/login/login_page.dart';
import 'package:core_mobile/app/modules/projects/project_binding.dart';
import 'package:core_mobile/app/modules/projects/project_page.dart';
import 'package:core_mobile/app/modules/splash/splash_binding.dart';
import 'package:core_mobile/app/modules/splash/splash_page.dart';
import 'package:core_mobile/app/modules/tabs/tabs_binding.dart';
import 'package:core_mobile/app/modules/tabs/tabs_page.dart';
import 'package:core_mobile/app/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.TABS,
      page: () => TabsPage(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.PROJECTS,
      page: () => ProjectPage(),
      binding: ProjectBinding(),
    ),
  ];
}
