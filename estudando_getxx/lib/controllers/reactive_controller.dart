import 'dart:async';
import 'dart:collection';

import 'package:estudando_getxx/controllers/socket_client_controller.dart';
import 'package:estudando_getxx/models/pet.dart';
import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;

  RxList<String> items = <String>[].obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

  Pet myPet = Pet(name: 'Juma', age: 13);

  StreamSubscription<String>? _subscription;

  @override
  void onInit() {
    super.onInit();
    final SocketClientController socketClientController =
        Get.find<SocketClientController>();
    _subscription = socketClientController.message.listen((String data) {
      print("Message::: $data");
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void increment() {
    counter.value++;
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    // NÃO HÁ NECESSIDADE DE ADICIONAR O .VALUE PARA DADOS QUE NÃO SÃO PRIMITIVOS
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    // NÃO HÁ NECESSIDADE DE ADICIONAR O .VALUE PARA DADOS QUE NÃO SÃO PRIMITIVOS
    final String key = DateTime.now().toString();
    print(key);
    mapItems.addIf(true, key, key);
  }

  void removeMapItem(String key) {
    print(key);
    mapItems.remove(key);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void setPetAge(int age) {
    myPet.age = age;
    // myPet.value = myPet.value.copyWith(age: age);
  }
}
