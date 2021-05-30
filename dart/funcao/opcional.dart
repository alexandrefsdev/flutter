import 'dart:math';

main(List<String> args) {
  int n1 = numeroAleatorio(100);
  print(n1);

  int n2 = numeroAleatorio();
  print(n2);

  print("--------DATAS--------");
  imprimirData(13, 12, 1987);
  imprimirData(13, 12);
  imprimirData(13);

}

// Colocando o parametro entre [colchetes] ele vira opcional
int numeroAleatorio([int maximo = 11]) {
  return Random().nextInt(maximo);
}

imprimirData(int dia, [int mes = 1, int ano = 1970]) {
  print('$dia/$mes/$ano');
}
