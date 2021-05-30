// O reduce serve para transforma a lista em qualquer coisa...
// objeto, numero, string...

main(List<String> args) {
  List<double> notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10];
  var total = notas.reduce(somar);
  print(total);

  var nomes = ['Gustavo', 'Gabriel', 'Alexandre', 'Flavia', 'Agnaldo', 'Eliene'];
  print(nomes.reduce(juntar));
}

double somar(double acumulador, double elemento) {
  print("$acumulador + $elemento = ${acumulador + elemento}");
  return acumulador + elemento;
}

String juntar(String acumulador, String elemento) {
  print("$acumulador, $elemento");
  return "$acumulador, $elemento";
}
