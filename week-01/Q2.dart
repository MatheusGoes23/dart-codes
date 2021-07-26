import 'dart:io';

void main(){
  List<List<int>> matrix = [];
  String choice;

  do{
    print("Digite a linha da matriz separando os números por espaço: ");
    //Entrada de dados
    String line = stdin.readLineSync()!;

    //Separa a string por espaço
    List<String> listString = line.split(" ");

    List<int> matrixLine = [];
    listString.forEach((string) {
      //Adiciona a linha de string para ser a linha de inteiros
      matrixLine.add(int.parse(string));
    });

    //Adiciona a linha na matriz
    matrix.add(matrixLine);

    print("Deseja adicionar mais uma linha na matriz?(S/N)");
    choice = stdin.readLineSync()!;
  }while(choice.toUpperCase() == "S");
  

  //Mostrar os números formatado
  matrix.forEach((matrixLine) {
    String string = matrixLine.toString();
    string = string.replaceAll("[", "").replaceAll("]", "").replaceAll(",", "");

    print(string);
  });
}