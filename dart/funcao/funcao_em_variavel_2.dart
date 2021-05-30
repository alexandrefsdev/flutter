main(List<String> args) {
  var adicao = (int a, int b) => a + b;
  var subtracao = (int a, int b) => a - b;
  var multiplicacao = (int a, int b) => a * b;
  var divisao = (int a, int b) => a / b;

  print(adicao(5, 20));
  print(subtracao(9, -13));
  print(multiplicacao(9, -13));
  print(divisao(9, -13));
}
