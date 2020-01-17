import 'dart:io';
void main(){
  var map = {"amit":2222,"ram":5555};
  Map<String, int> map2 = {"amit":2222};
  print(map2["amit"]);
  //var list =[];
  List<int> list = [];
  print("Enter the Range");
  int n = int.parse(stdin.readLineSync());
  for(int i = 1; i<=n; i++){
    print("Enter the Value to Store");
    int val = int.parse(stdin.readLineSync());
    list.add(val);
  }
  print("After Loop $list");
}