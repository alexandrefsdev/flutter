main(List<String> args) {
  var alunos = [
    {'nome': 'Carmine', 'nota': 9.9},
    {'nome': 'Maurice', 'nota': 9.3},
    {'nome': 'Nigel', 'nota': 8.7},
    {'nome': 'Raymond', 'nota': 8.1},
    {'nome': 'Scottie', 'nota': 7.6},
    {'nome': 'Alek', 'nota': 6.8},
  ];

  var total = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => (nota as double).roundToDouble())
      .reduce((t, e) => t + e);
  print("O valor da média é: ${total / alunos.length}.");

  var notasFinais = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => (nota as double).roundToDouble())
      .where((nota) => nota >= 8);

  var totalMediaAlunosExpecionais = notasFinais.reduce((t, e) => t + e);

  print(
      "O valor da média dos alunos excepcionais é: ${totalMediaAlunosExpecionais / notasFinais.length}.");
}
