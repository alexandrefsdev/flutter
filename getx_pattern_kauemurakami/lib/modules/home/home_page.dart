import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_kauemurakami/modules/home/home_controller.dart';
import 'package:http/http.dart' as http;

class HomePage extends GetView<HomeController> {
//repository and controller  injection bindings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        child: GetX<HomeController>(initState: (state) {
          Get.find<HomeController>().getAll();
        }, builder: (_) {
          return _.postList.length < 1
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_.postList[index].title),
                      subtitle: Text(_.postList[index].body),
                    );
                  },
                  itemCount: _.postList.length,
                );
        }),
      ),
    );
  }
}
