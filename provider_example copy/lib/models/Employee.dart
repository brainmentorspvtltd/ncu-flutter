class Employee {
  int id;
  String name;
  double salary;
  Employee(this.id, this.name, this.salary);

  @override
  String toString() {
    return 'Employee{id: $id, name: $name, salary: $salary}';
  }
}
