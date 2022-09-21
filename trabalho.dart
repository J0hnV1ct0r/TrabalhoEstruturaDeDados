import 'dart:io';
// Classe Lista
class Lista{
  var lista = [];
  var tamanho;

  //funçao push

  //função pop
  
  
}

void main() {
  print("Informe uma expreção matematica esquisita:");
  final expressao =  stdin.readLineSync();
  List pilha = expressao!.split(" ");
  var rep = true;
  List<int> pilha2 = [int.parse(pilha[0])];  
  //print(pilha2);
  //do{
    if(pilha.length > 1){
      for(int t = 1; t < pilha.length; t++){
       if(pilha[t] == "+" || pilha[t] == "-" || pilha[t] == "*" || pilha[t] == "/"){
         //print(calculos(pilha[t - 2], pilha[t - 1],pilha[t]));
         pilha2[pilha2.length - 1] = calculos(pilha2[(pilha2.length) - 2], pilha2.last,pilha[t]);
         //print(pilha2);
     }else{
         pilha2.add(int.parse(pilha[t]));
         print(pilha2);
     }
        rep = false;
   }  
    }//else{
      //rep = false;
    //}
  //}while(rep);
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

