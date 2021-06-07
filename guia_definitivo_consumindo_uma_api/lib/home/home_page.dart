import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia acesso API'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Get.toNamed('/http'),
              child: Text('HTTP', style: TextStyle(fontSize: 28)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('DIO', style: TextStyle(fontSize: 28)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('GetConnect', style: TextStyle(fontSize: 28)),
            ),
          ],
        ),
      ),
    );
  }
}
