import 'package:core_mobile/models/project.dart';
import 'package:core_mobile/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ProjectItemWidget extends StatelessWidget {
  final Project project;

  const ProjectItemWidget(this.project);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.TASKS,
          arguments: project,
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('${project.branch.name}'),
                ),
              ),
            ),
            title: Text(project.name),
            subtitle: Text(
              'Poderia ter o endereço aqui para o técnico se basear....',
            ),
            isThreeLine: true,
            trailing: Chip(
              label: Text(
                "${project.tasks.length}",
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.headline6!.color,
                  fontSize: 10,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
