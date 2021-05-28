import 'package:conversor_moedas/app/views/home_view.dart';
import 'package:flutter/material.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData.dark(),
        // theme: ThemeData.dark(),
        home: HomeView(),
      );

  }
}
