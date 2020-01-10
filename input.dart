import 'dart:collection';
import 'dart:io';
void main(){
  print("Enter the first number");
  int firstNumber = int.parse(stdin.readLineSync());
  stdout.write("Enter the Second number");
  int secondNumber = int.parse(stdin.readLineSync());
  int result = firstNumber + secondNumber;
  String t = "Hello";
  String rr = t[0];
  HashMap<String , int> map3 = new HashMap<String,int>();
  map3["amit"] = 2222;
  map3["ram"] = 3333;
  Iterable<String> keys = map3.keys;
  Iterator<String> itr= keys.iterator;
  while(itr.moveNext()){
    var key = itr.current;
    print("Keys are ${key} Value ${map3[key]}");
  }
  Iterable<int> values = map3.values;
  print("Map3 $map3");

  if(firstNumber>secondNumber){

  }
  else{

  }
  for(int i = 1; i<=10; i++){

  }
  String user;
  print("Welcome ${user??'User'}");
  String temp = firstNumber>secondNumber?"First is Greater":"Second is Greater";
  print("Result is $result");
}