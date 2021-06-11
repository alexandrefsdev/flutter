import 'package:core_mobile/models/branch.dart';
import 'package:core_mobile/models/task.dart';

class Project {
  int id;
  String code;
  String name;
  Branch branch;
  List<Task> tasks;

  Project({
    required this.id,
    required this.code,
    required this.name,
    required this.branch,
    required this.tasks,
  });
}
