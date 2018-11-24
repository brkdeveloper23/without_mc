class ProductMetricsRequestDTO {
 String _barcode;
 String _modelCode;
 String _storeRef;
 String _storeCode;
 String _colorCode;
 String _countryRef;


 // LoginPageEntryRequestDTO(this._username, this._password);

    set setBarcode(String barcode) {
      _barcode = barcode;
    }
    set setModelCode(String modelCode) {
      _modelCode = modelCode;
    }
    set setStoreRef(String storeRef) {
      _storeRef = storeRef;
    }

    set setStoreCode(String storeCode) {
      _storeCode = storeCode;
    }

    set setColorCode(String colorCode) {
      _colorCode = colorCode;
    }

    set setCountryRef(String countryRef) {
      _countryRef = countryRef;
    }



  
//Map edilmiş datayı verdiğinde objeye çeviriyor.
  // LoginPageEntryRequestDTO.map(dynamic obj) {
  //   this._username = obj['username'];
  //   this._password = obj['password'];
  // }

  String get getBarcode => _barcode;
  String get getModelCode => _modelCode;
  String get getStoreRef => _storeRef;
  String get getStoreCode => _storeCode;
  String get getColorCode => _colorCode;
  String get getCountryRef => _countryRef;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Barcode"] = _barcode;
    map["ModelCode"] = _modelCode;
    map["StoreRef"] = _storeRef;
    map["StoreCode"] = _storeCode;
    map["ColorCode"] = _colorCode;
    map["CountryRef"] = _countryRef;
    return map;
  }

}
