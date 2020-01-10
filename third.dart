void main(){
  var arr = [10,20,30,40,50];
  for(int i = 0; i<arr.length; i++){
    print("ARR IS ${arr[i]}");
  }
  if(arr is List){
    print("it is a list");
  }
  List<int> list = [10,20,30,40,50];
  var sets  = {10,20,30,40,10};
  Set<int> set2  = {100,200,100,200};
  print("Sets is $sets");
  var map = {"delhi":12,"mumbai":23};
  Map<String,int> map2 = {"delhi":12,"mumbai":23};
  Map<String,List<int>> phone = {"amit":[2222,3333,4444]};
  
}