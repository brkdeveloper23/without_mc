class LoginPageEntryRequestDTO {
 String _username;
 String _password;

 // LoginPageEntryRequestDTO(this._username, this._password);

    set setUserName(String userName) {
      _username = userName;
    }
    set setPassword(String password) {
      _password = password;
    }

  
//Map edilmiş datayı verdiğinde objeye çeviriyor.
  // LoginPageEntryRequestDTO.map(dynamic obj) {
  //   this._username = obj['username'];
  //   this._password = obj['password'];
  // }

  String get getUsername => _username;
  String get getPassword => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

}
