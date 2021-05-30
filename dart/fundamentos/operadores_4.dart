import 'dart:io';
import 'dart:io';

main() {
  print("Está chovendo? (s/n)");
  bool estaChovendo = stdin.readLineSync() == "s";

  print("Está frio? (s/n)");
  bool estaFrio = stdin.readLineSync() == "s";

  String resultado = estaChovendo || estaFrio ? "Ficar em casa" : "Sair!!!";

  print(resultado);
}
