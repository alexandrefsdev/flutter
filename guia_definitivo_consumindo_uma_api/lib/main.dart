import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/get_connect/get_connect_binding.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/home_bindings.dart';

import 'home/dio/dio_bindings.dart';
import 'home/dio/dio_page.dart';
import 'home/get_connect/get_connect_page.dart';
import 'home/home_page.dart';
import 'home/http/http_bindings.dart';
import 'home/http/http_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
          children: [
            GetPage(
              name: '/http',
              page: () => HttpPage(),
              binding: HttpBindings(),
            ),
            GetPage(
              name: '/getconnect',
              page: () => GetConnectPage(),
              binding: GetConnectBinding(),
            ),
            GetPage(
              name: '/dio',
              page: () => DioPage(),
              binding: DioBindings(),
            ),
          ],
          binding: HomeBindings(),
        )
      ],
    );
  }
}
