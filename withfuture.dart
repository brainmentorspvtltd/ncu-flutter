import 'dart:async';
Future giveMeFutureValue(){
  return Future((){
    return 9000;
  });
}
Future asyncFunction2(){

    
     Future f= Future.delayed(Duration(seconds: 5),(){
        return 20000;
      //  a + b * c;
        //throw new Exception("Future Exception is ");
          
      });
  
    return f;
}
Future asyncFunction(){

    
     Future f= Future.delayed(Duration(seconds: 3),(){
        return 10000;
      //  a + b * c;
       // throw new Exception("Future Exception is ");
          
      });
  
    return f;
}
void main(){
  print("Main Starts");
  Future f1 = asyncFunction();
 // Future f2 = asyncFunction2();
   print("After Call Future is  $f1 ");
  f1.then((result){
    print("F1 Result is $result");
    Future f2 = asyncFunction2(); 
    f2.then((result){
    print("F2 Result is $result");
  }).catchError((err){
    print("Error is $err");
  });
  }).catchError((err){
    print("Error is $err");
  });
   
  print("Main Ends $f1");
}