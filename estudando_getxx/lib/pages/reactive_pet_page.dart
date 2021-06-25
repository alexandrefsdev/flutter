import 'package:estudando_getxx/controllers/reactive_controller.dart';
import 'package:estudando_getxx/controllers/socket_client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReactivePetPage extends StatelessWidget {
  ReactivePetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sockeController = Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Obx(
            //   () => Text('Age ${_.myPet.age}'),
            // ),
            TextField(
              onChanged: (text) {
                sockeController.setSearchText(text);
              },
            ),
            Obx(
              () => Text(sockeController.message.value),
            ),
            TextButton(
                onPressed: () {
                  _.setPetAge(_.myPet.age + 1);
                },
                child: Text("Set AGE"))
          ],
        ),
      ),
    );
  }
}
