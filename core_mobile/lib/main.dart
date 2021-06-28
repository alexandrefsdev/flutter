import 'package:core_mobile/app/modules/login/login_binding.dart';
import 'package:core_mobile/app/modules/login/login_page.dart';
import 'package:core_mobile/app/modules/projects/project_binding.dart';
import 'package:core_mobile/app/modules/projects/project_page.dart';
import 'package:core_mobile/app/modules/splash/splash_binding.dart';
import 'package:core_mobile/app/modules/splash/splash_page.dart';
import 'package:core_mobile/app/modules/tabs/tabs_binding.dart';
import 'package:core_mobile/app/modules/tabs/tabs_controller.dart';
import 'package:core_mobile/app/modules/tabs/tabs_page.dart';
import 'package:core_mobile/app/routes/app_pages.dart';
import 'package:core_mobile/app/routes/app_routes.dart';
import 'package:core_mobile/app/theme/theme.dart';
import 'package:core_mobile/app/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
  DependencyInjection.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: AppRoutes.SPLASH,
    initialBinding: LoginBinding(),
    getPages: AppPages.pages,
    home: LoginPage(),
    title: 'R2 Telecomunicações',
    theme: appThemeData,
    locale: Locale('pt', 'BR'), // Língua padrão
    // onGenerateRoute: ,
    // onUnknownRoute: ,
  ));
}
