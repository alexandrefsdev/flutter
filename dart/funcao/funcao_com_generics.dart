Object segundoElementoLista(List lista) {
  return lista.length >= 2 ? lista[1] : null;
}

E? segundoElementoListaUsandoGenerics<E>(List<E> lista) {
  return lista.length >= 2 ? lista[1] : null;
}

main(List<String> args) {
  var lista = [3, 6, 7, 12, 45, 78, 1];

  print(segundoElementoLista(lista));

  int? segundoElemento = segundoElementoListaUsandoGenerics<int>(lista);
  print(segundoElemento);

}
