class Person{
  String name;
  int age;
  int len;
  Person(this.name, this.age, this.len);
  @override
  String toString() {
    // TODO: implement toString
    return "Name is $name, Age is $age, Length is $len";
  }
  // Person(String name, int age, int len){
  //   this.name=name;
  //   this.age=age;
  //   this.len=len;
  // }
}
void main()
{
  List<int > list=[10,2,34,53,53,5,6,77];
  List<Person> persons = [Person("dheeraj", 20, 7), Person("gaurav", 19, 6)];
  persons.sort((f,s)=>f.len-s.len);
  print("persons after sort $persons");
  // for(int i in list)
  // {
  //   print (i);
  // }
  List<String> names=["ram","dheeraj","divyansh","gaurav"];
  print("ram".compareTo('dheeraj'));
  names.sort((a, b)=>a.compareTo(b));
  print("After sorting names $names");
  list.forEach((x)=>print(x));
 list.sort((a,b)=>a-b) ;
 print("After sort $list"); 
  List <Function> l=calculator();
  Function add=l[0];
  int z=add(1,2);
  print("Ans is $z");
  print(calculator()[0](1,2));
//print(calculator()(1,2));
//Function b=calculator();
//int z=b(1,2);
//print("sum is $z");
A a=new A();
}
 List <Function> calculator()

{ print ("i am in calc ");

  add(x,y){
    return x+y;
    
  }
  sub(a,b){
    return a-b;
  }
  return [add,sub];
}
 class A{

 }