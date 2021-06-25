import 'package:core_mobile/app/global_widgets/app_drawer.dart';
import 'package:core_mobile/app/modules/tabs/tabs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      builder: (_) => DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title:
                _.selectedScreenIndex == 0 ? Text('Projetos') : Text('Perfil'),
          ),
          body: _.screens[_.selectedScreenIndex],
          drawer: AppDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _.selectScreen,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _.selectedScreenIndex,
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
      ),
    );
  }
}
