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
  int pop(){
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
  Lista pilha3 = Lista();
    if(expressao.length > 1){
      for(int t = 0; t < expressao.length; t++){
       if(expressao[t] == "+" || expressao[t] == "-" || expressao[t] == "*" || expressao[t] == "/"){
         pilha3.push(calculos(pilha3.pop(),pilha3.pop(),expressao[t]));
       }else{
         pilha3.push(int.parse(expressao[t]));
      } 
     }  
    }
  print(pilha3.lista);
}

//Calculadora pos-fixa
calculos(var a,var b, String operador){
  switch(operador){
    case "+":
      return b+a;
      break;
    case "-":
      return b-a;
      break;
    case "*":
      return b*a;
      break;
    case "/":
      return b/a;
      break;
  } 
}
