import 'package:estudando_getx/app/modules/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => Scaffold(),
    );
  }
}
