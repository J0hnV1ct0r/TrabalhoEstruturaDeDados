import 'dart:io';
// Classe Lista
class Lista{
  var lista = [];
  var tamanho;
  Lista(){
    this.lista = [];
  }
  Lista(List listaEntrada){
    this.lista = listaEntrada;
  }

  //funçao push
  void push(var add){
    this.lista = this.lista + [add];
  }
  //função pop
  int pop(){
   var temp = this.lista;
   var retorno = this.lista.last;
   this.lista = [];
   for(int t = 0; t < temp.length - 1; t++){
     this.lista = this.lista + [temp[t]];
   }
   print("lista:");
   print(this.lista)
   return retorno;
 }
}

void main() {
  print("Informe uma expreção matematica esquisita:");
  final expressao =  stdin.readLineSync();
  List pilha = expressao!.split(" ");
  List<int> pilha2 = [int.parse(pilha[0])];  
  Lista pilha3 = Lista();
    if(pilha.length > 1){
      for(int t = 1; t < pilha.length; t++){
       if(pilha[t] == "+" || pilha[t] == "-" || pilha[t] == "*" || pilha[t] == "/"){
        
         pilha2[pilha2.length - 1] = calculos(pilha2[(pilha2.length) - 2], pilha2.last,pilha[t]);
         
     }else{
         pilha2.add(int.parse(pilha[t]));
         print(pilha2);
     }
        rep = false;
     }  
    }
  print(pilha2);
}

//Calculadora pos-fixa
calculos(var a,var b, String operador){
  
  switch(operador){
    case "+":
      return a+b;
      break;
    case "-":
      return a-b;
      break;
    case "*":
      return a*b;
      break;
    case "/":
      return a/b;
      break;
  } 
}

