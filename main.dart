import 'dart:io';
// Classe Lista:
class Lista{
  var lista = [];
  // Construtor da classe:
  Lista(){
    this.lista = []; 
  }
  // funçao push:
  void push(var add){
    this.lista = this.lista + [add];
  }
  // função pop:
  pop(){
   var temp = this.lista;
   var retorno = this.lista[lista.length - 1];
   this.lista = [];
   for(int t = 0; t < temp.length - 1; t++){
     this.lista = this.lista + [temp[t]];
   }
   return retorno;
 }
}
// Principal:
void main() {
  print("Informe uma expressão matematica pos-fixa:");
  final entrada =  stdin.readLineSync();
  List expressao = entrada!.split(" "); 
  Lista pilhaNum = Lista();
  var test = true;
  for(int t = 0; t < expressao.length; t++){
    if(expressao[t] != "+" || expressao[t] != "-" || expressao[t] != "*" || expressao[t] != "/"){
    if(!isNumeric(expressao[t])) print("entrou");
    }else{
      print("ERRO: Operador não valido");
      test = false;
    } 
  } 
  if(test == true) calculadoraPosFixa(pilhaNum, expressao);
}
//Calculadora pos-fixa:
calculadoraPosFixa(var pilha, var expressao){
  // Verificação de erro:
 if(expressao[0] == "+" || expressao[0] == "-" || expressao[0] == "*" || expressao[0] == "/"){
    print("ERRO: expressão dada é invalida"); 
 }else{
   // Calculo pos-fixo:
    for(int t = 0; t < expressao.length; t++){
      if(expressao[t] == "+" || expressao[t] == "-" || expressao[t] == "*" || expressao[t] == "/"){
        pilha.push(calculos(pilha.pop(),pilha.pop(),expressao[t]));
      }else{
        pilha.push(double.parse(expressao[t]));
      } 
    }
   // Verificação de erro:
    if(pilha.lista.length > 1){
      print("ERRO: Faltou um operador");
      print(pilha.lista);
    }else{
   // Resposta:
      print(pilha.lista);
    } 
  }

}
// Calculos:
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
bool isNumeric(String str) {
  try{
    var value = double.parse(str);
  } on FormatException {
    return false;
  } finally {
    return true;
  }
}
