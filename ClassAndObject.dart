class Student{
  var _id;
  String _name;
  String _course;
  _show(){
    
  }
  Student(int id , String name){
    this._id = id;
    this._name = name;
  }
  void set id(int id){
    if(id<=0){
      print("Invalid ID $id");
      return ;
    }
    this._id = id;
  } 
  int get id{
    return this._id;
  }
  Student.basicInfo(int id, String name, String course){
    this._id = id;
    this._name = name;
    this._course  = course;
  }
  void printDetails(){
    print("id is $_id Name is $_name Course is $_course");
  }
  @override
  String toString() {
    // TODO: implement toString
    return "id is $_id Name is $_name Course is $_course";
  }
}
void main(){
  //Student student = new Student(1001, "Ram");
  //Student student = Student(1001, "Ram");
  //var student  = Student(1001,"Ram");
  Student(1001,"Ram");
  Student student= Student.basicInfo(1001, "Ram", "Java");
  student.id = 1002;
  
  print("Student is $student");
  print(student.id);
  //student.printDetails();
}