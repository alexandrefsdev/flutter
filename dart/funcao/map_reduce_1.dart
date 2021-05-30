// Um MAP sempre retornará uma lista de mesmo tamanho
// Objetivo: transformar um elemento em outro

main(List<String> args) {
  var alunos = [
    {'nome': 'Carmine', 'nota': 9.9},
    {'nome': 'Maurice', 'nota': 9.3},
    {'nome': 'Nigel', 'nota': 8.7},
    {'nome': 'Raymond', 'nota': 8.1},
    {'nome': 'Scottie', 'nota': 7.6},
    {'nome': 'Alek', 'nota': 6.8},
  ];

  // Transforma a lista de map em uma lista de String
  String Function(Map elemento) pegarApenasONome = (aluno) => aluno['nome'];
  // Transforma a lista de String em uma lista de Int
  int Function(String) qtdeDeLetras = (texto) => texto.length;
  // Transforma a lista de int em uma lista de Int
  int Function(int) dobro = (numero) => numero * 2;

  var nomes = alunos.map(pegarApenasONome);
  var quantidadesdeLetras = nomes.map(qtdeDeLetras);

  var mesmaCoisaDeFormaEncadeadaQuantidadeLetradasDobrado = alunos
      .map(pegarApenasONome) // Gerou String
      .map(qtdeDeLetras)
      .map(dobro);

  print(nomes);
  print(quantidadesdeLetras);
  print(mesmaCoisaDeFormaEncadeadaQuantidadeLetradasDobrado);
}
