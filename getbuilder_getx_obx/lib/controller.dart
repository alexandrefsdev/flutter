import 'package:get/get.dart';

class ControllerTeste extends GetxController {
  List? items = [].obs;
  int get count => items!.length;

  int valor = 0;

  alterarValor(int num) {
    valor = num;
    update();
  }
}
