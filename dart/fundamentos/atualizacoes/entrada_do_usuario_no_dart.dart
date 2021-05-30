// Fala pessoal, tranquilo?

// Recentemente, foi lançada uma nova versão do Dart. Agora, ao salvar valores feitos via Input pelo usuário do código, é preciso usar uma interrogação na tipagem do dado. Por exemplo:

import 'dart:io';
 
main() {
String? teste = stdin.readLineSync();
print(teste);
String teste2 = stdin.readLineSync()!;
print(teste2);
}
// Essa interrogação significa que o dado que vai vir pode não ser uma String, mas que será convertido assim que for recebido. Ou seja, você pode digitar números e mesmo assim eles serão tratados como String depois.

// Caso você utilize tipagem dinâmica (ou seja, utilize 'var' ao invés do tipo exato de dado), é preciso fazer essa indicação no input mesmo, com uma '!' ao invés de uma '?'. Essa solução é válida também ao se utilizar a tipagem.

// Dessa forma:

// import 'dart:io';
 
// main() {

// }
// Bons estudos, galera!