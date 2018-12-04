class FavoriteStoreListDto{

String _magazaKod;

 // LoginPageEntryRequestDTO(this._username, this._password);

    set setMagazaKod(String magazaKod) {
      _magazaKod = magazaKod;
    }
   

  String get getMagazaKod => _magazaKod;

  

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["MagazaKod"] = _magazaKod;
    
    return map;
  }

   static fromJson(Map<String, dynamic> json) {
  
   FavoriteStoreListDto adf = new FavoriteStoreListDto();
    adf._magazaKod =  json['MagazaKod'];

return adf;
}

}
