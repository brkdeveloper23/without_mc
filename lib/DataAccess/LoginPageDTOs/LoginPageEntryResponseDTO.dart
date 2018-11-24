class LoginPageEntryResponseDTO {
  String _firstName;
  String _lastName;
  String _imagePath;
  String _authToken;

  LoginPageEntryResponseDTO(this._firstName, this._lastName,this._imagePath, this._authToken);


  LoginPageEntryResponseDTO.map(dynamic obj) {
    this._firstName = obj['firstName']; 
    this._lastName = obj['lastName'];
    this._imagePath = obj['imagePath'];
    this._authToken = obj['authToken'];
  }

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get imagePath => _imagePath;
  String get authToken => _authToken;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["imagePath"] = _imagePath;
    map["authToken"] = _authToken;
    return map;
  }
}
