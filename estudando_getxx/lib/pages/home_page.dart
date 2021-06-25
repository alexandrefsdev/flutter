import 'package:estudando_getxx/controllers/global_controller.dart';
import 'package:estudando_getxx/controllers/home_controller.dart';
import 'package:estudando_getxx/pages/home_page_widgets/home_label.dart';
import 'package:estudando_getxx/pages/home_page_widgets/home_list.dart';
import 'package:estudando_getxx/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          print("build home");
          return Scaffold(
            // body: HomeList(),
            appBar: AppBar(
              actions: [
                GetBuilder<GlobalController>(
                  id: 'favorites',
                  builder: (_) => TextButton(
                    onPressed: () {},
                    child: Text("Favoritos (${_.favorites.length})"),
                    style: TextButton.styleFrom(
                      primary: Colors.amberAccent,
                    ),
                  ),
                )
              ],
            ),
            body: ProductList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _.increment(),
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
