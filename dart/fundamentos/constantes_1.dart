import 'dart:io';

main() {
  // Área da circunferência = PI * raio * raio
  // DIFERANÇA ENTRE CONST E FINAL
  // Const só pode ser definida na compilação, enquanto final em tempo de execução
  const PI = 3.1415;

  // stdout -> é um print sem \n
  stdout.write("Informe o raio: ");
  String? entradaDoUsuario = stdin.readLineSync();
  final double raio = double.parse(entradaDoUsuario!);

  final area = PI * raio * raio;

  print("O valor da área é: " + area.toString());
}
