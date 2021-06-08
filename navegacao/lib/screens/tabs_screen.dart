import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen(),
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
          title: _selectedScreenIndex == 0
              ? Text('Lista de Categorias')
              : Text('Meus Favoritos'),
        ),
        body: _screens[_selectedScreenIndex],
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
              icon: Icon(Icons.category),
              title: Text('Categorias'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favoritos'),
            ),
          ],
        ),
      ),
    );
  }
}
