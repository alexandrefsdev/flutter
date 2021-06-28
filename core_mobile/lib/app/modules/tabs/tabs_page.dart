import 'package:core_mobile/app/global_widgets/app_drawer.dart';
import 'package:core_mobile/app/modules/projects/project_page.dart';
import 'package:core_mobile/app/modules/tabs/tabs_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: controller.selectedScreenIndex == 0
              ? Text('Projetos')
              : Text('Perfil'),
        ),
        body: SafeArea(
            child: IndexedStack(
          index: controller.selectedScreenIndex,
          children: [
            ProjectPage(),
          ],
        )),
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          onTap: controller.changedTabIndex,
          currentIndex: controller.selectedScreenIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Projetos',
            ),
            _bottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Perfil',
            ),
            // BottomNavigationBarItem(
            //   backgroundColor: Theme.of(context).primaryColor,
            //   icon: Icon(Icons.play_arrow_rounded),
            //   title: Text('Projetos'),
            // ),
            // BottomNavigationBarItem(
            //   backgroundColor: Theme.of(context).primaryColor,
            //   icon: Icon(Icons.person),
            //   title: Text('Perfil'),
            // ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({required Icon icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
