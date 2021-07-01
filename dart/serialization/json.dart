import 'dart:convert';

main(List<String> args) {
  String jsonString =
      '{"data":[{"id":"24","type":"projects","attributes":{"code":"123","name":"Mussurunga","starts-at":"2021-05-20","finishs-at":"2023-12-13","status":"planejamento"},"relationships":{"tasks":{"data":[{"id":"29","type":"projects-tasks"},{"id":"30","type":"projects-tasks"},{"id":"31","type":"projects-tasks"},{"id":"32","type":"projects-tasks"},{"id":"33","type":"projects-tasks"},{"id":"34","type":"projects-tasks"},{"id":"35","type":"projects-tasks"},{"id":"36","type":"projects-tasks"},{"id":"37","type":"projects-tasks"}]}},"links":{"self":"http://localhost:3000/api/v1/projects"}},{"id":"25","type":"projects","attributes":{"code":"15138138","name":"Cajacity","starts-at":"2021-07-01","finishs-at":"2022-03-25","status":"planejamento"},"relationships":{"tasks":{"data":[{"id":"38","type":"projects-tasks"},{"id":"39","type":"projects-tasks"},{"id":"40","type":"projects-tasks"}]}},"links":{"self":"http://localhost:3000/api/v1/projects"}}],"included":[{"id":"29","type":"projects-tasks","attributes":{"description":"Parecer Técnico Ambiental (laudo) para extensão linear de 3,01 km até 5 km","quantity":"12.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/29/projects_tasks"}},{"id":"30","type":"projects-tasks","attributes":{"description":"Projeto de 1001 a 5000 Pontos Baremo","quantity":"10.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/30/projects_tasks"}},{"id":"31","type":"projects-tasks","attributes":{"description":"Atualização de cadastro de rede c/ verificação em campo nas rodovias / ferrovias – AUTOCAD / SAGRE","quantity":"9.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/31/projects_tasks"}},{"id":"32","type":"projects-tasks","attributes":{"description":"Verificação da existência de rede nas rodovias / ferrovias","quantity":"8.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/32/projects_tasks"}},{"id":"33","type":"projects-tasks","attributes":{"description":"Testes para aceitação de emenda e enlace em cabos ópticos com OTDR","quantity":"6.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/33/projects_tasks"}},{"id":"34","type":"projects-tasks","attributes":{"description":"MND para 2 duto com 125mm fornecimento PEAD Contratada(com fornec. material)","quantity":"5.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/34/projects_tasks"}},{"id":"35","type":"projects-tasks","attributes":{"description":"Gestão de condomínio","quantity":"2.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/35/projects_tasks"}},{"id":"36","type":"projects-tasks","attributes":{"description":"Cenário 6 - lançamento de até 150m de cabo telefônico de até 200 pares com desobstrução dutos, construção de até 15m de linha de duto e construção de duto lateral","quantity":"18.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/36/projects_tasks"}},{"id":"37","type":"projects-tasks","attributes":{"description":"Transferir ou substituir por manutenção: ferragens e/ou mensageiro de cabo espinado ou cabo auto-sustentado ao poste existente ou novo","quantity":"200.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/37/projects_tasks"}},{"id":"38","type":"projects-tasks","attributes":{"description":"Crítica Sagre Oper","quantity":"1551.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/38/projects_tasks"}},{"id":"39","type":"projects-tasks","attributes":{"description":"Levantamento de localidade","quantity":"155.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/39/projects_tasks"}},{"id":"40","type":"projects-tasks","attributes":{"description":"Cadastrar projetos nos sistemas informáticos e de facilidades para redes FTTX","quantity":"48.0","executed-quantity":null,"status":"pendente"},"links":{"update-executed-quantity":"http://localhost:3000/api/v1/projects/40/projects_tasks"}}]}';

  Map projectsMap = jsonDecode(jsonString);
  // print(jsonString);
  // print("-------------------------------------------");
  var projectsList =
      (projectsMap['data'] as List).map((e) => Project.fromJson(e));
      
  projectsList.forEach((element) {
    print(element.name);
  });
}

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

  factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      id: int.parse(json['id']),
      code: json['attributes']['code'],
      name: json['attributes']['name'],
      startsAt: json['attributes']['starts-at'],
      finishsAt: json['attributes']['finishs-at']);
  // tasks: List<Task>.from(json['included'].map((x) => Task.fromJson(x))));

  //   ​Map<String, dynamic> toJson() => {
  //    ​"bookList": List<dynamic>.from(books.map((x) => x.toJson())),
  //  ​};
}

class Task {
  int id;
  String description;
  double plannedQuantity;
  double? executedQuantity;

  Task({
    required this.id,
    required this.description,
    required this.plannedQuantity,
    this.executedQuantity,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: int.parse(json['id']),
      description: json['attributes']['description'],
      plannedQuantity: json['attributes']['quantity'],
      executedQuantity: json['attributes']['executed-quantity']);
}
