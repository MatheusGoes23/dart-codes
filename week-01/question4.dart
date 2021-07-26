// This program counts the number of times the words in a sentence appear

main() {
  String frase = "estude muito sempre sempre estude";

  frase = frase + " ";

  Map<String, int> palavrasESuasQuantidades = new Map<String, int>();

  String palavra = "";
  String letra;

  //Lendo letra por letra da frase
  for (int i = 0; i < frase.length; i++) {
    letra = frase.substring(i, i + 1); //Guardando uma letra específica

    //Caso não encontre um espaço
    if (!letra.endsWith(" ")) {
      palavra = palavra + letra;
    } else {
      int quantidade = 1;

      //Caso a palavra atual ainda não tenha sido guardada
      if (!palavrasESuasQuantidades.containsKey(palavra)) {
        palavrasESuasQuantidades.addAll({palavra: quantidade});
      } else {
        //Atualiza a quantidade de aparições que a palavra já teve
        quantidade = palavrasESuasQuantidades[palavra]! + 1;
        palavrasESuasQuantidades.update(palavra, (value) => quantidade);
      }
      palavra = "";
    }
  }

  //Mostra na tela as palavras e a quantidade de aparições de cada uma
  for (String key in palavrasESuasQuantidades.keys) {
    print(key + "=" + palavrasESuasQuantidades[key].toString());
  }
}
