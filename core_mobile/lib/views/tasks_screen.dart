import 'package:core_mobile/models/project.dart';
import 'package:core_mobile/models/task.dart';
import 'package:core_mobile/widgets/task_item_widget.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Project project =
        ModalRoute.of(context)!.settings.arguments as Project;
    final List<Task> tasks = project.tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: Column(
        children: [
          Expanded(
            // R2 -> LISTAGEM
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, index) => TaskItemWidget(
                tasks[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
