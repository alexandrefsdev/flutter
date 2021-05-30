class Data {
  late int dia;
  late int mes;
  late int ano;

  // SIMPLIFICADO DART
  Data([this.dia = 13, this.mes = 12, this.ano = 2021]);

  // PADRÃO DE OUTRAS LINGUAGENS
  // Data(int dia, int mes, int ano) {
  //   this.dia = dia;
  //   this.mes = mes;
  //   this.ano = ano;
  // }

  // CONSTRUTUOR NOMEADO
  Data.com({this.dia = 1, this.mes = 1, this.ano = 1970});
  Data.ultimoDiaDoAno(this.ano) {
    dia = 31;
    mes = 12;
  }

  String obterFormatada() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return obterFormatada();
  }
}

main(List<String> args) {
  var dataAniversario = new Data(13, 12, 2021);
  dataAniversario.dia = 13;
  dataAniversario.mes = 12;
  dataAniversario.ano = 2021;

  Data dataCompra = Data(05, 05, 2021);
  dataCompra.dia = 05;
  dataCompra.mes = 06;
  dataCompra.ano = 2021;

  // print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano} ");
  // print("${dataCompra.dia}/${dataCompra.mes}/${dataCompra.ano} ");
  String d1 = dataAniversario.obterFormatada();

  print("A data do aniversário é $d1");
  print("A data da compra é ${dataCompra.obterFormatada()}");
  print(dataAniversario);
  print(dataCompra.toString());

  print(new Data());
  print(Data(31));

  print(Data.com(ano: 2022));

  var dataFinal = Data.com(dia: 12, mes: 7, ano: 2024);
  print("O Mickey será público em $dataFinal");
  print(Data.ultimoDiaDoAno(2023));
}
