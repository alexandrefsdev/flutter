/*
  - List
  - Set
  - Map
*/
main() {
  // List
  print('-------------------LIST-------------------');
  var aprovados = ['Ana', 'Carlos', 'Daniel', 'Rafael'];
  print(aprovados is List);
  print(aprovados);
  print(aprovados.elementAt(2));
  print(aprovados[0]);
  print(aprovados.length);
  aprovados.add('Daniel');
  print(aprovados);

  // No Map, a chave não aceita repetição
  print('-------------------MAP-------------------');
  var telefones = {
    'João': '+55 (11) 94914-1684',
    'Maria': '+55 (84) 1818-174684',
    'Pedro': '+55 (18) 14871-174684',
    'João': '+55 (11) 77777-7777',
  };

  print(telefones is Map);
  print(telefones);
  print(telefones[0]);
  print(telefones.length);
  print(telefones.values);
  print(telefones.keys);
  print(telefones.entries);

// Diferente da List o SET não permite repetição
  print('-------------------SET-------------------');
  var times = {'Vasco', 'Flamengo', 'Fortaleza', 'Corinthians'};
  print(times is Set);
  times.add('Vitória');
  times.add('Vitória');
  times.add('Vitória');
  print(times.length);
  print(times);
  print(times.contains('Vasco'));
  print(times.first);
  print(times.last);
}
