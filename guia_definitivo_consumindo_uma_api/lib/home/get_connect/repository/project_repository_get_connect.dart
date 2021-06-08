import 'package:guia_definitivo_consumindo_uma_api/model/Project_model.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';
import 'package:guia_definitivo_consumindo_uma_api/shared/rest_client.dart';

class ProjectRepositoryGetConnect implements IProjectRepository {
  final RestClient restClient;

  ProjectRepositoryGetConnect(this.restClient);

  @override
  Future<List<ProjectModel>> findAllProjects() async {
    final response = await restClient.get(
      'http://core.r2ti.com.br/api/v1/projects?user_id=2',
      decoder: (body) {
        if (body is List) {
          return body
              .map<ProjectModel>((resp) => ProjectModel.fromMap(resp))
              .toList();
        }
        return null;
      },
    );
    if (response.hasError) {
      throw Exception('Erro ao buscar usuários');
    }
    return response.body!;
    // List<dynamic> data = response.body;
    // return data
    //     .map<ProjectModel>((resp) => ProjectModel.fromMap(resp))
    //     .toList();
  }
}
