import 'package:dio/dio.dart';
import 'package:guia_definitivo_consumindo_uma_api/model/Project_model.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';

class ProjectRepositoryDio implements IProjectRepository {
  final Dio _dio;

  ProjectRepositoryDio(this._dio);

  @override
  Future<List<ProjectModel>> findAllProjects() async {
    try {
      final response = await _dio
          .get<List>('http://core.r2ti.com.br/api/v1/projects?user_id=2');

      return response.data!.map((e) => ProjectModel.fromMap(e)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
