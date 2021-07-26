import 'dart:io';

class Product{
  String name = "";
  double price = 0;

  Product register(){
    stdout.write("Digite o nome do produto: ");
    this.name = stdin.readLineSync()!;

    stdout.write("Digite o valor do produto: ");
    this.price = double.parse(stdin.readLineSync()!);
    return this;
  }

  void edit(String name, double price){
    this.name = name;
    this.price = price;
  }
}

void clearTerminal(){
  if(Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout); 
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

void showOptions(){
  print("-------------------------");
  print("| 1 - Cadastrar produto |\n| 2 - Listar produtos   |\n| 3 - Buscar produto    |\n| 4 - Editar produto    |\n| 5 - Remover produto   |\n| 6 - Sair              |");
  print("-------------------------");
  stdout.write("Escolha uma opção: ");
}

void main(){
  List<Product> products = [];

  int option;
  do{
    showOptions();
    option = int.parse(stdin.readLineSync()!);

    switch(option){

      //Cadastrar os produtos
      case 1:
        clearTerminal();
        Product product = new Product();
        products.add(product.register());
        clearTerminal();
        break;

      //Listar os produtos
      case 2:
        clearTerminal();
        int index = 1;
        
        print("-------------------------");
        print("        Produtos         ");
        print("-------------------------");
        products.forEach((product) {
          print("$index - ${product.name} - R\$ ${product.price.toStringAsFixed(2)}",);
          index++;
        });
        break;
      
      //Buscar um produto
      case 3:
        clearTerminal();

        stdout.write("Digite o nome do produto que deseja buscar: ");
        String nameSearch = stdin.readLineSync()!;

        print("-------------------------");
        print("Produto(s) encontrado(s)");
        print("-------------------------");

        //Percorre buscando pelo nome do produto
        products.forEach((product) {
          if(product.name.toUpperCase() == nameSearch.toUpperCase()){
            print("${product.name} - R\$${product.price}");
          }
        });
        break;

      //Editar produto
      case 4:
        clearTerminal();
        stdout.write("Digite o número do produto a ser editado: ");
        int id = int.parse(stdin.readLineSync()!);

        Product product = new Product();

        try{
          product = products[id-1];
        }catch(err){
          print("Produto não encontrado!");
        }

        if(product.name != ""){
          print("Produto: ${product.name} - R\$${product.price}");

          stdout.write("Digite o novo nome do produto: ");
          String newName = stdin.readLineSync()!;

          stdout.write("Digite o novo valor do produto: ");
          double newPrice = double.parse(stdin.readLineSync()!);

          product.edit(newName, newPrice);
          print("Produto editado com sucesso!");
        }
        break;

      //Deletar produto
      case 5:
        clearTerminal();
        stdout.write("Digite o numero do produto que deseja remover: ");
        int id = int.parse(stdin.readLineSync()!);

        Product product = new Product();

        try{
          product = products[id-1];
        }catch(err){
          print("Produto não encontrado!");
        }
        
        if(product.name != ""){
          print("Tem certeza que deseja excluir o produto ${product.name}?(S/N)");
          String option = stdin.readLineSync()!;

          if(option.toUpperCase() == "S"){
            products.remove(product);
            print("Produto removido com sucesso!");
          }
        }
        break;
    }

  }while(option != 6);
  
}