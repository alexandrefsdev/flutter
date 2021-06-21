import 'package:estudando_getx/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
