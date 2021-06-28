import 'package:core_mobile/app/data/models/project.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProjectsAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Project>?> getAllProjects() async {
    final response = await _dio.get('projects?user_id=3');
    print(response.data['data'].toString());
    return (response.data['data'] as List)
        .map((e) => Project.fromJson(e))
        .toList();
  }
}
