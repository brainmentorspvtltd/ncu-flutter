class User {
  String _userid;
  String _password;

  String get userid => _userid;

  set userid(String value) {
    _userid = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  Map<String, dynamic> toJson() {
    return {"userid": _userid, "password": _password};
  }
}
