//This program calculates a 2nd degree equation

import 'dart:math';

main() {
  print("Dada a equação do segundo grau x^2 - 3x -54");

  int a = 1, b = -3, c = -54;

  print("O valor de delta é = " + calculaDelta(a, b, c).toString());

  calculaAsRaizes(a, b, c);
}

int calculaDelta(int a, int b, int c) =>
    int.parse(pow(b, 2).toString()) - (4 * a * c);

void calculaAsRaizes(int a, int b, int c) {
  double x1 = (-b + sqrt(calculaDelta(a, b, c))) / (2 * a);

  double x2 = (-b - sqrt(calculaDelta(a, b, c))) / (2 * a);

  print("A raízes são $x1 e $x2");
}