import 'package:estudando_getxx/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${_.user.firstName} ${_.user.lastName}'),
            SizedBox(height: 10),
            TextField(
              onChanged: _.onInputTextChanged,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _.goToBackWithData,
              child: Text('Aceitar'),
            ),
          ],
        ),
      ),
    );
  }
}
