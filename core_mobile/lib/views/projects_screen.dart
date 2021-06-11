import 'package:core_mobile/data/dummy_data.dart';
import 'package:core_mobile/models/project.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  final List<Project> projects = DUMMY_PROJECTS.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Olá'),
      // ),
      body: Column(
        children: [
          Expanded(
            // R2 -> LISTAGEM
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (ctx, index) => projects[index].,
            ),
          ),
        ],
      ),
    );
  }
}
