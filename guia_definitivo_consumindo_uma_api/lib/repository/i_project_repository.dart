import 'package:guia_definitivo_consumindo_uma_api/model/Project_model.dart';

abstract class IProjectRepository {
  Future<List<ProjectModel>> findAllProjects();
}