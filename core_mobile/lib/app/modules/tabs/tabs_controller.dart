import 'package:core_mobile/app/modules/projects/project_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  int _tabIndex = 0;
  final List<Widget> _screens = [
    ProjectPage(),
    ProjectPage(),
    // FavoriteScreen(),
  ];

  int get selectedScreenIndex => _tabIndex;
  List<Widget> get screens => _screens;

  void changedTabIndex(int index) {
    _tabIndex = index;
    update();
  }

  // final List<Map<String, Object>> _screens = [
  //   {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
  //   {'title': 'Meus Favoritos', 'screen': FavoriteScreen()}
  // ];
}
