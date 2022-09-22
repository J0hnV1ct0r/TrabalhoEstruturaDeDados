import 'dart:io';
class Excecao implements Exception {
  String causa;
  Excecao(this.causa);
}
// Classe Lista
class Lista{
  var lista = [];
  Lista(){
    this.lista = []; 
  }
  //funçao push
  void push(var add){
    this.lista = this.lista + [add];
  }
  //função pop
  pop(){
   var temp = this.lista;
   var retorno = this.lista[lista.length - 1];
   this.lista = [];
   for(int t = 0; t < temp.length - 1; t++){
     this.lista = this.lista + [temp[t]];
   }
   return retorno;
 }
  // Função get
  get(){
    return lista[0];
  }
}

void main() {
  print("Informe uma expressão matematica pos-fixa:");
  final entrada =  stdin.readLineSync();
  List expressao = entrada!.split(" "); 
  Lista pilhaNum = Lista();
  for(int t = 0; t < expressao.length; t++){
    if(expressao[t] != "+" || expressao[t] != "-" || expressao[t] != "*" || expressao[t] != "/"){
      try{
        if(!testeNumerico(expressao[t])){
          throw new Excecao('ERROR: Expressão dada é invalida');
        }
      } on Excecao{
        print("ERROR: expressão dada é invalida");
        print("OBS: Utilize apenas números ou operadores");
      }
    }
  }
  calculadoraPosFixa(pilhaNum, expressao);
}

calculadoraPosFixa(var pilha, var expressao){
  // Verificação de erro:
   try{
     if(expressao[0] == "+" || expressao[1] == "+" || expressao[0] == "-" || expressao[1] == "-" || expressao[0] == "*" || expressao[1] == "*" || expressao[0] == "/" || expressao[1] == "/"){
        throw new Excecao('ERROR: Expressão dada é invalida');
     }else{
       for(int t = 0; t < expressao.length; t++){
         if(expressao[t] == "+" || expressao[t] == "-" || expressao[t] == "*" || expressao[t] == "/"){
           pilha.push(calculos(pilha.pop(),pilha.pop(),expressao[t])); 
         }else{
           pilha.push(double.parse(expressao[t]));
         }    
       }
       if(pilha.lista.length != 1){
         throw new Excecao('ERROR: Expressão dada é invalida');
       }else{
         print('Resultadado: ${pilha.get()}');
       } 
     }
   }on Excecao{
     print("ERROR: expressão dada é invalida");
     print("OBS: Confira se passou a expressão corretamente");
  }
}

//Calculadora pos-fixa
calculos(var a,var b, String operador){
  switch(operador){
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

// Testando se é numero:
 bool testeNumerico(String str) {
  try{
    var numero = double.parse(str);
  } on FormatException {
    return false;
  } finally {
    return true;
  }
}
