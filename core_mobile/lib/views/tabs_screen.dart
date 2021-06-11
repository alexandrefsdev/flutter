import 'package:core_mobile/views/projects_screen.dart';
import 'package:core_mobile/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    ProjectsScreen(),
    ProjectsScreen(),
    // FavoriteScreen(),
  ];

  // final List<Map<String, Object>> _screens = [
  //   {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
  //   {'title': 'Meus Favoritos', 'screen': FavoriteScreen()}
  // ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: _selectedScreenIndex == 0 ? Text('Projetos') : Text('Perfil'),
        ),
        body: _screens[_selectedScreenIndex],
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.play_arrow_rounded),
              title: Text('Projetos'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.person),
              title: Text('Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
