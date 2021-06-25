import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_builder_state_testando.dart';

void main() {
  runApp(MyApp());
}

// só para não esquecer, se você está trabalhando com variáveis
// comuns, int, String você deve user GetBuilder, porém se está trabalhando
// com observáveis, .obs, deve usar GetX e Obx.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetBuilderStateTestando(),
    );
  }
}
