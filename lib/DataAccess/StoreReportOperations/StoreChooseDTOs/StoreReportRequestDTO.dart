class StoreReportRequestDTO {
 int _storeRef;
 String _filterDonem;



 // LoginPageEntryRequestDTO(this._username, this._password);

    set setStoreRef(int storeRef) {
      _storeRef = storeRef;
    }
    set setFilterDonem(String filterDonem) {
      _filterDonem = filterDonem;
    }

  int get getStoreRef => _storeRef;
  String get getFilterDonem => _filterDonem;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["StoreRef"] = _storeRef;
    map["FilterDonem"] = _filterDonem;
    return map;
  }

}
