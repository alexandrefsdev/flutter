import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getbuilder_getx_obx/controller.dart';
import 'getx_and_obx_state.dart';

class GetBuilderStateTestando extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetBuilder"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<ControllerTeste>(
                init: ControllerTeste(),
                builder: (controller) {
                  return Column(
                    children: [
                      Text("GetBuilder:"),
                      Text('${controller.valor}'),
                      RaisedButton(
                        child: Text("Alterar Valor"),
                        onPressed: () {
                          controller.alterarValor(20);
                        },
                      )
                    ],
                  );
                }),
            RaisedButton(
              child: Text("Alterar Valor"),
              onPressed: () {
                Get.to(GetxAndObxState());
              },
            )
          ],
        ),
      ),
    );
  }
}
