import 'package:estudando_getxx/controllers/global_controller.dart';
import 'package:estudando_getxx/controllers/socket_client_controller.dart';
import 'package:estudando_getxx/pages/home_page.dart';
import 'package:estudando_getxx/pages/reactive_page.dart';
import 'package:estudando_getxx/pages/reactive_pet_page.dart';
import 'package:estudando_getxx/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(SocketClientController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashPage(),
      home: ReactivePetPage(),
    );
  }
}
