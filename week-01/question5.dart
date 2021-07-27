// This program checks if a word is an anagram of another

import 'dart:io';

main() {
  print("Digite a primeira palavra:");
  String s1 = stdin.readLineSync()!;

  print("Digite a segunda palavra:");
  String s2 = stdin.readLineSync()!;

  print(anagrama(s1, s2));
}

bool anagrama(String s1, String s2) {
  //Dividindo as letras de cada palavra
  var s1Array = s1.split('');
  var s2Array = s2.split('');

  //Colocando as letras em ordem alfabética
  s1Array.sort();
  s2Array.sort();

  //Verificando se são iguais, logo, se uma é anagrama da outra
  if (s1Array.toString() == s2Array.toString()) {
    return true;
  } else {
    return false;
  }
}
