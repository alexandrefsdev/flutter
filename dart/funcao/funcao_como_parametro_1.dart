import 'dart:math';

void executar({Function? funcPar, Function? funcImpar}) {
  var sorteado = Random().nextInt(10);
  sorteado % 2 == 0 ? funcPar!(sorteado) : funcImpar!(sorteado);
}

main(List<String> args) {
  var minhaFuncPar = (num) => print("Eita! O $num é par!");
  var minhaFuncImpar = (num) => print("Legal! O $num é impar!");

  executar(funcPar: minhaFuncPar,funcImpar: minhaFuncImpar);
}
