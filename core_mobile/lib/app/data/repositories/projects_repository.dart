import 'package:core_mobile/app/data/models/project.dart';
import 'package:core_mobile/app/data/providers/projects_api.dart';
import 'package:get/get.dart';

class ProjectsRepository {
  final ProjectsAPI _projectsAPI = Get.find<ProjectsAPI>();

  Future<List<Project>?> getAllProjects() async =>
      _projectsAPI.getAllProjects();
}
