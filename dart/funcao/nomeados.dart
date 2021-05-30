main(List<String> args) {
  saudarPessoa(nome: "Alexandre", idade: 33);
  saudarPessoa(idade: 47, nome: "Maria");

  imprimirData();
  imprimirData(ano: 2021);
  imprimirData(ano: 2021, dia: 13);
}

saudarPessoa({required String nome, required int idade}) {
  print("Olá $nome, nem parece que você tem $idade anos.");
}

imprimirData({int dia = 1, int ano = 1970, int mes = 1}) {
  print('$dia/$mes/$ano');
}
