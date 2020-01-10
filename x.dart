void main(){
  const int MAX = 1000;
  final int x = 100;
  final Student ram = new Student(1001, "Ram");
  ram.printing();
  ram.id++;
  ram.printing();
}
class Student{
  int id;
  String name;
  Student(int id, String name){
    this.id = id;
    this.name = name;
  }
  void printing(){
    print("id $id and name $name");
  }
}