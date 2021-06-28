import 'package:core_mobile/app/data/models/project.dart';
import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  ProjectItem({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(
      //     "${Constants.THE_MOVIE_DB_IMG_PATH}${movie.posterPath}"),
      title: Text(project.name),
      subtitle: Text(project.code),
    );
  }
}
