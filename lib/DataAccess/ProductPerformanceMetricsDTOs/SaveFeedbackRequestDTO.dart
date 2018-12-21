class SaveFeedbackRequestDTO {
 String _username;
 int _userHRef;
 String _message;
 int _barcode;
 String _storeName;
 String _storeCode;
 int _feedBackType;


 // LoginPageEntryRequestDTO(this._username, this._password);

    set setUserName(String username) {
      _username = username;
    }
    set setUserHRRef(int userHRef) {
      _userHRef = userHRef;
    }
    set setMessage(String userHRef) {
      _message = userHRef;
    }

    set setBarcode(int barcode) {
      _barcode = barcode;
    }

    set setStoreName(String storeName) {
      _storeName = storeName;
    }

    set setStoreCode(String storeCode) {
      _storeCode = storeCode;
    }

    set setFeedBackType(int feedBackType) {
      _feedBackType = feedBackType;
    }

  
//Map edilmiş datayı verdiğinde objeye çeviriyor.
  // LoginPageEntryRequestDTO.map(dynamic obj) {
  //   this._username = obj['username'];
  //   this._password = obj['password'];
  // }

  String get getUserName => _username;
  int get getUserHRRef => _userHRef;
  String get getMessage => _message;
  int get getBarcode => _barcode;
  String get getStoreName => _storeName;
  String get getStoreCode => _storeCode;
  int get getFeedBackType => _feedBackType;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Username"] = _username;
    map["UserHRRef"] = _userHRef;
    map["Message"] = _message;
    map["Barcode"] = _barcode;
    map["StoreName"] = _storeName;
    map["StoreCode"] = _storeCode;
    map["FeedBackType"] = _feedBackType;
    return map;
  }

}
