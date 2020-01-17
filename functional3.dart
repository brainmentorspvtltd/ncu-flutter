import 'dart:io';
int n;
void main(){
  print("Enter the Range");
  n = int.parse(stdin.readLineSync());
  forEach((num)=>num%2==0?"Even $num":"Odd $num");
  //list.forEach((x)=>print(x));
  //forEach(cube);
 // forEach(table);
}
void forEach(Function fn){
  for(int i = 1; i<=n; i++){
    print(fn(i));
  }
}
final evenOdd = (num)=>num%2==0?"Even $num":"Odd $num";
final cube = (num)=>num*num*num;
final table = (num)=>5*num;