class LoginPageEntryResponseDTO {
  String _firstName;
  String _lastName;
  String _imagePath;
  String _authToken;
  String _resimBase64;
  LoginPageEntryResponseDTO(this._firstName, this._lastName,this._imagePath, this._authToken, this._resimBase64);


  LoginPageEntryResponseDTO.map(dynamic obj) {
    this._firstName = obj['firstName']; 
    this._lastName = obj['lastName'];
    this._imagePath = obj['imagePath'];
    this._authToken = obj['authToken'];
    this._resimBase64 = obj['resimBase64'];
  }

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get imagePath => _imagePath;
  String get authToken => _authToken;
  String get resimBase64 => _resimBase64;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["imagePath"] = _imagePath;
    map["resimBase64"] = _resimBase64;
    return map;
  }
}
