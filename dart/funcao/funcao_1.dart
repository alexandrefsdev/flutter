import 'dart:math';

main() {
  somaDoisNumerosQuaisquer();
  int resultado = somar(2, 3);
  resultado *= 2;
  print("O dobro do resultado é $resultado");
  print("O resultado é ${somarNumerosAleatorios()}");
}

// Função sem retorno
void somaDoisNumerosQuaisquer() {
  int n1 = Random().nextInt(11);
  int n2 = Random().nextInt(11);

  print('Os valores sorteados foram: $n1 e $n2.');
  print(n1 + n2);
}

int somar(int a, int b) {
  return a + b;
}

int somarNumerosAleatorios() {
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);
  return a + b;
}
