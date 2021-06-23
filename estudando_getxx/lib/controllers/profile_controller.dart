import 'package:estudando_getxx/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late User _user;
  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this._user = Get.arguments as User;
    print("Get.arguments ${Get.arguments}");
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext!,
        builder: (_) => CupertinoActionSheet(
          title: Text("ERROR"),
          message: Text("Adicione um valor válido!"),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(),
            child: Text("Aceitar"),
          ),
        ),
      );
      // Get.dialog(
      //   AlertDialog(
      //     title: Text("ERROR"),
      //     content: Text("Adicione um valor válido!"),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Get.back();
      //         },
      //         child: Text(''),
      //       )
      //     ],
      //   ),
      // );
    }
  }
}
