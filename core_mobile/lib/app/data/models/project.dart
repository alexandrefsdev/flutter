import 'package:core_mobile/app/data/models/branch.dart';
import 'package:core_mobile/app/data/models/task.dart';

class Project {
  int id;
  String code;
  String name;
  String startsAt;
  String finishsAt;
  // Branch branch;
  // List<Task> tasks;

  Project({
    required this.id,
    required this.code,
    required this.name,
    required this.startsAt,
    required this.finishsAt,
    // required this.tasks,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: int.parse(json['id']),
        code: json['attributes']['code'],
        name: json['attributes']['name'],
        startsAt: json['attributes']['starts-at'],
        finishsAt: json['attributes']['finishs-at'],
      );
}
