main(List<String> args) {
  var notas = [8.2, 7.1, 6.2, 4.4, 3.9, 8.8, 9.1, 5.1];

  bool Function(double) notasBoasFunc = (double nota) => nota >= 7;
  bool Function(double) notasMuitoBoasFunc = (double nota) => nota >= 8.8;

  var notasBoas = notas.where(notasBoasFunc);
  var notasMuitoBoas = notas.where(notasMuitoBoasFunc);
  print(notas);
  print(notasBoas);
  print(notasMuitoBoas);
}
