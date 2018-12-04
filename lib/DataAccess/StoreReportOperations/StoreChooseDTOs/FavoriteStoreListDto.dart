// class FavoriteStoreListDto{

// String _magazaKod;

//  // LoginPageEntryRequestDTO(this._username, this._password);

//     set setMagazaKod(String magazaKod) {
//       _magazaKod = magazaKod;
//     }
   

//   String get getMagazaKod => _magazaKod;

  

//   Map<String, dynamic> toMap() {
//     var map = new Map<String, dynamic>();
//     map["MagazaKod"] = _magazaKod;
    
//     return map;
//   }

//    static fromJson(Map<String, dynamic> json) {
  
//    FavoriteStoreListDto adf = new FavoriteStoreListDto();
//     adf._magazaKod =  json['MagazaKod'];

// return adf;
// }

// }
import 'package:json_annotation/json_annotation.dart';

class FavoriteStoreListDto {
  String magazaKod;
FavoriteStoreListDto({
this.magazaKod
});

  // int get getDilId => _dilId;
  // String get getKod => _kod;
  // String get getDeger => _deger;
  
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["magazaKod"] = magazaKod;

    return map;
  }

  
factory FavoriteStoreListDto.fromJson(Map<String, dynamic> json) {

  return FavoriteStoreListDto(
    magazaKod: json['magazaKod'],
  );
}

}