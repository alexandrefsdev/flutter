import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getbuilder_getx_obx/controller.dart';

class GetxAndObxState extends StatelessWidget {
  final c = Get.put(ControllerTeste());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX e Obx"),
      ),
      body: Column(
        children: [
          GetX<ControllerTeste>(
            builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.count,
                  itemBuilder: (BuildContext context, int index) {
                    return new Text(controller.items![index]);
                  },
                ),
              );
            },
          ),
          Obx(() => Text('${c.count}')),
          RaisedButton(
            child: Text("Alterar Valor"),
            onPressed: () {
              c.items!.add('FlutterBrasil');
            },
          )
        ],
      ),
    );
  }
}
