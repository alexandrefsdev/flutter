import 'package:core_mobile/app/data/models/project.dart';
import 'package:core_mobile/app/modules/projects/local_widget/project_item.dart';
import 'package:core_mobile/app/modules/projects/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProjectPage extends StatelessWidget {
  ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(
      builder: (_) => Scaffold(
        body: Container(
            // width: double.infinity,
            // height: double.infinity,
            // color: Colors.transparent,
            // child: ListView.builder(
            //   itemBuilder: (ctx, index) {
            //     final Project project = _.projects[index];
            //     return ProjectItem(project: project);
            //   },
            //   itemCount: _.projects.length,
            // ),
            ),
      ),
    );
  }
}
