import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/http/http_controller.dart';
import 'package:guia_definitivo_consumindo_uma_api/model/Project_model.dart';

class HttpPage extends GetView<HttpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final ProjectModel item = state[index];
            return ListTile(
              title: Text("${item.name}"),
              subtitle:
                  Text("Cidade: ${item.branch.name} - Cód: ${item.code} "),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error!),
              TextButton(
                onPressed: () => controller.findProjects(),
                child: Text('Tentar Novamente'),
              )
            ],
          ),
        );
      }),
    );
  }
}
