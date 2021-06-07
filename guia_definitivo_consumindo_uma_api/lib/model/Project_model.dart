import 'dart:convert';

import 'package:guia_definitivo_consumindo_uma_api/model/Branch_model.dart';

class ProjectModel {
  int id;
  String code;
  String name;
  Branch branch;

  ProjectModel({
    required this.id,
    required this.code,
    required this.name,
    required this.branch,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'branch': branch.toMap(),
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'],
      code: map['code'],
      name: map['name'],
      branch: Branch.fromMap(map['branch']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source));
}
