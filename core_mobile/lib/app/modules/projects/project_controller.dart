import 'package:core_mobile/app/data/models/project.dart';
import 'package:core_mobile/app/data/repositories/projects_repository.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  final ProjectsRepository _projectsRepository = Get.find<ProjectsRepository>();

  List<Project> _projects = [];
  List<Project> get projects => _projects;

  @override
  void onReady() {
    _load();
  }

  Future<void> _load() async {
    try {
      _projects = (await _projectsRepository.getAllProjects())!;
      print("projects:::::: ${_projects.length}");
    } on Exception catch (e) {
      print(e);
    }
  }
}
