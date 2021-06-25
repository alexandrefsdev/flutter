import 'package:core_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem vindo Usuário!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.PROJECTS,
              );
            },
          ),
          Divider(),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Pedidos'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed(
          //       AppRoutes.ORDERS,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
