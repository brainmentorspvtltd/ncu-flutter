void main(){
 int result = add(y: 90);
 print("result is $result");
 AppBar(backgroundColor: 'red');
}
AppBar({String title:'',String backgroundColor:''}){

}
//int add([int x=0 , int y=0]){
  int add({int x = 0, int y = 0}){
  return x + y;
}
// add(x,y){
//   return x + y;
// }
// final add = (x,y)=>x+y;