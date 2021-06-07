import 'dart:convert';

import 'package:guia_definitivo_consumindo_uma_api/model/Project_model.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';
import 'package:http/http.dart' as http;

class ProjectHttpRepository implements IProjectRepository {
  @override
  Future<List<ProjectModel>> findAllProjects() async {
    var url = Uri.parse('http://core.r2ti.com.br/api/v1/projects?user_id=2');
    final response = await http.get(url);
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<ProjectModel>((resp) => ProjectModel.fromMap(resp))
        .toList();
  }
}
