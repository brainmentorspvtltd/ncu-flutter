import 'dart:io';
void main(){
  File file = new File("/Users/amit/Documents/ncu-flutter/functional2.dart");
  //String result = file.readAsStringSync();
   print("Before Future ");
  Future future = file.readAsString();
  future.then((data)=>print("Data is $data")).catchError((err)=>print("Error is $err"));
  print("After Future ");
  for(int i = 1;i<=10; i++){
    print("Time Pass $i");
  }
}