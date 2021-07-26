import 'dart:io';
import 'dart:math';

num calculateDelta(int a, int b, int c){
  return pow(b, 2) - 4 * a * c;
}

void calculateRoots(int a, int b, int c){
  var x1 = (-b + sqrt(calculateDelta(a, b, c))) / (2 * a);
  var x2 = (-b - sqrt(calculateDelta(a, b, c))) / (2 * a);

  if(x1.isNaN || x2.isNaN){
    print("Não existe raizes reais!");
  }else{
    print("S = {$x1,$x2}");
  }
}

void main(){
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  int c = int.parse(stdin.readLineSync()!);

  calculateRoots(a, b, c);
}