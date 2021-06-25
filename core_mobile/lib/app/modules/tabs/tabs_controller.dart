import 'package:core_mobile/app/modules/projects/project_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    ProjectPage(),
    ProjectPage(),
    // FavoriteScreen(),
  ];

  int get selectedScreenIndex => _selectedScreenIndex;
  List<Widget> get screens => _screens;

  selectScreen(int index) {
    _selectedScreenIndex = index;
  }

  // final List<Map<String, Object>> _screens = [
  //   {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
  //   {'title': 'Meus Favoritos', 'screen': FavoriteScreen()}
  // ];
}
