import 'dart:io';
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
}

void main() {
  print("Informe uma expressão matematica pos-fixa:");
  final entrada =  stdin.readLineSync();
  List expressao = entrada!.split(" "); 
  Lista pilhaNum = Lista();
  if(expressao.length > 1){
      calculadoraPosFixa(pilhaNum, expressao);
    } 
  print(pilhaNum.lista);
  
}
calculadoraPosFixa(var pilha, var expressao){
  for(int t = 0; t < expressao.length; t++){
       if(expressao[t] == "+" || expressao[t] == "-" || expressao[t] == "*" || expressao[t] == "/"){
         pilha.push(calculos(pilha.pop(),pilha.pop(),expressao[t]));
       }else{
         pilha.push(double.parse(expressao[t]));
      } 
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
