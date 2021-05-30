main(List<String> args) {
  int a = 2;
  // tipo nome = valor;
  int Function(int, int) soma1 = somaFnPreDefinida;
  print(soma1(20, 313));

  // Função anonima
  int Function(int, int) soma2 = (x, y) {
    return x + y;
  };
  print(soma2(55, 313));

  // Por inferencia
  var soma3 = (int x,int y) {
    return x + y;
  };
  print(soma3(888, 313));
}

int somaFnPreDefinida(int a, int b) {
  return a + b;
}
