import 'dart:io';
//Nome: Joâo Victor de Souza Albuquerque
//Matricula:20211045050314
//Classe Excecao:
class Excecao implements Exception {
  String causa;
  Excecao(this.causa);
}
//
//Classe Lista:
class Lista {
  var lista = [];
  //Construtor:
  Lista() {
    this.lista = [];
  }
  //funçao Push:
  void push(var add) {
    this.lista = this.lista + [add];
  }
  //função Pop:
  pop() {
    var temp = this.lista;
    var retorno = this.lista[lista.length - 1];
    this.lista = [];
    for (int t = 0; t < temp.length - 1; t++) {
      this.lista = this.lista + [temp[t]];
    }
    return retorno;
  }
  // Função Get:
  get() {
    return lista[0];
  }
}
//
//Função Principal:
void main() {
  // Declarando Pilha de Número:
  Lista pilhaNum = Lista();
  //Entrada de Dados:
  print("Informe uma expressão matematica pos-fixa:");
  final entrada = stdin.readLineSync();
  List expressao = entrada!.split(" ");
  //Verificando se Caracter Existe Caracter Difrente de Número ou Operador:
  for (int t = 0; t < expressao.length; t++) {
    if (expressao[t] != "+" ||
        expressao[t] != "-" ||
        expressao[t] != "*" ||
        expressao[t] != "/") {
      try {
        if (!testeNumerico(expressao[t])) {
          //throw new Excecao('ERROR: Expressão dada é invalida');
        }
      } on Excecao {
        print("ERROR: expressão dada é invalida");
        print("OBS: Utilize apenas números ou operadores");
      }
    }
  }
  //Chamando Calculadora Pós-Fixa:
  calculadoraPosFixa(pilhaNum, expressao);
}
//
//Calculadora Pos-fixa:
calculadoraPosFixa(var pilha, var expressao) {
  try {
    //Verificando Erros:
    if (expressao[0] == "+" ||
        expressao[1] == "+" ||
        expressao[0] == "-" ||
        expressao[1] == "-" ||
        expressao[0] == "*" ||
        expressao[1] == "*" ||
        expressao[0] == "/" ||
        expressao[1] == "/") {
      throw new Excecao('ERROR: Expressão dada é invalida');
    } else {
      //
      for (int t = 0; t < expressao.length; t++) {
        if (expressao[t] == "+" ||
            expressao[t] == "-" ||
            expressao[t] == "*" ||
            expressao[t] == "/") {
          //Calculo dos Numeros:
          pilha.push(calculos(pilha.pop(), pilha.pop(), expressao[t]));
        } else {
          //preenchendo a pilha de Números:
          pilha.push(double.parse(expressao[t]));
        }
        //
      }
      if (pilha.lista.length != 1) {
        //Verificando Erros:
        throw new Excecao('ERROR: Expressão dada é invalida');
      } else {
        //Resultado:
        print('Resultadado: ${pilha.get()}');
      }
    }
  } on Excecao {
    print("ERROR: expressão dada é invalida");
    print("OBS: Confira se passou a expressão corretamente");
  }
}
//
//Calculos:
calculos(var a, var b, String operador) {
  switch (operador) {
    case "+":
      return b + a;
      break;
    case "-":
      return b - a;
      break;
    case "*":
      return b * a;
      break;
    case "/":
      return b / a;
      break;
  }
}
//
//Testando se é numero:
bool testeNumerico(String s) {
  final number = num.tryParse(s);
  if (number == null) {
    return false;
  }
  return true;
}
