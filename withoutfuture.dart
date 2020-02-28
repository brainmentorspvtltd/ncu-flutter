import 'dart:async';

serverCall(success,fail){

}

giveMeDataAfter3Sec(fn, fn2){
  Future.delayed(Duration(seconds: 3),(){
    print("I Will Call After 3 Sec");
    if(10>2){
    fn(1000);
    }
    else{
      fn2("Some Error Occur");
    }
   // return 1000;
  });
}
giveMeResult(result){
  print("::::::: Now the result is $result");
  // Future.delayed(Duration(seconds: 2),(){

  // });
}
showError(err){
  print("Error Occur $err");
}
void main(){
  print("I am Start");
  giveMeDataAfter3Sec(giveMeResult,showError);
  // try{
  // giveMeDataAfter3Sec(giveMeResult);
  // }
  // catch(e){

  // }
 // var result = giveMeDataAfter3Sec();
  //print("I am End $result");
  print("I am End");
}