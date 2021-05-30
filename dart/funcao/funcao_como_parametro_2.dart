void executarPor(int qtde, Function(String) fn, String valor) {
  for (int i = 0; i < qtde; i++) {
    fn("${i + 1} - ${valor}");
  }
}

int executarPor2(int qtde, Function(String) fn, String valor) {
  String textoCompleto = '';
  for (int i = 0; i < qtde; i++) {
    textoCompleto += fn(valor);
  }
  return textoCompleto.length;
}

main(List<String> args) {
  executarPor(10, print, "Muito legal!");

  var meuPrint = (String valor) {
    print(valor);
    return valor;
  };
  int tamanho = executarPor2(10, meuPrint, "Muito legalzão");
  print('O tamanho da string é ${tamanho}');
}
