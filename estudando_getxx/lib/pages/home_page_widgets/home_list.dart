import 'package:estudando_getxx/controllers/home_controller.dart';
import 'package:estudando_getxx/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'users',
        builder: (_) {
          if (_.loading) {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final User user = _.users[index];
              return ListTile(
                title: Text(user.firstName),
                subtitle: Text(user.email),
              );
            },
            itemCount: _.users.length,
          );
        });
  }
}
