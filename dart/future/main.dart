main(List<String> args) {
  int r1 = soma(7, 3);
  print(r1);

  print('antes...');
  somaDoFuturo(70, 30)
      .then((r2) => r2 * 2)
      .then((r2) => r2 * 10)
      .then((r2) => r2 / 5)
      // .catchError(onError)
      .then((value) => print(value));
  print('depois...');
}

int soma(int a, int b) {
  return a + b;
}

Future<int> somaDoFuturo(int a, int b) {
  return Future(() {
    return a + b;
  });
}
