abstract class Account{
  int _id;
  String _name;
  void set id(int id){
    this._id = id;
  }
  int get id{
    return _id;
  }
  void roi();
  // roi(){
  //   print("Account ROI");
  // }
  void withDraw(){
    print("Account WithDraw...");
  }
  // Account(int id , String name){
  //   _id = id;
  //   _name = name;
  // }
  Account(this._id , this._name);
}
class SavingAccount extends Account{
  double _balance;
  void roi11(){
    print("SA ROI");
  }
  SavingAccount(double balance):super(1001,"SA"){
   
    this._balance = balance;
  }
  void services(){
    print("SA Service");
  }
  @override
  void withDraw(){
    super.withDraw();
    print("SA WithDraw Call");
  }
}
class CurrentAccount extends Account{
  CurrentAccount():super(1001,"SA"){
   
   
  }
  noLimit(){
    print("No Limit of CA");
  }
  roi(){
    print("CA ROI");
  }
}
// Polymorphic method
callAccount(Account account){
 account.roi();
 account.withDraw();
 if(account is SavingAccount){
   SavingAccount s = account;
   s.services();
 }
 if(account is CurrentAccount){
   CurrentAccount ca = account;
   ca.noLimit();
 }
 //account.noLimit();

}
void main(){
  //callAccount(Account(1,"A"));
  callAccount(new SavingAccount(999));
  callAccount(new CurrentAccount());
  //  Account sa = new SavingAccount(999);
  // sa.roi();
  // sa.withDraw();
  // sa = new CurrentAccount();
  // sa.withDraw();
  // sa.noLimit();
  // sa.roi();
  // SavingAccount sa = new SavingAccount(999);
  // sa.roi();
  // sa.withDraw();
  // CurrentAccount ca = new CurrentAccount();
  // ca.withDraw();
  // ca.noLimit();
  // ca.roi();
//   Account ac = new SavingAccount(9000);
//   ac.withDraw();
//   ac.limit();
 }