void main(){
  serverCall(printIt);
}
serverCall(Function fn){
  var data ;
print("Inside DB ");
for(int i = 1; i<=100000; i++){
  for(int j = 1; j<=10000; j++){

  }
}
data = "Now Data Rec from server";
fn(data);
}
printIt(data){
  print("DB Values Rec from Server $data");
}