import 'dart:async';
Future giveMeFutureValue(){
  return Future((){
    return 9000;
  });
}
Future asyncFunction2(result){

    
     Future f= Future.delayed(Duration(seconds: 5),(){
        return 20000 + result;
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
void main() async{
  print("Main Starts");
  
  int result = await asyncFunction();
 // Future f2 = asyncFunction2();
   print("Function1 After Call Result is  $result ");
   int finalResult = await asyncFunction2(result);
  
   
  print("Main Ends $finalResult");
}