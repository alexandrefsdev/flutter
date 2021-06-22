import 'package:estudando_getxx/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(

      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
