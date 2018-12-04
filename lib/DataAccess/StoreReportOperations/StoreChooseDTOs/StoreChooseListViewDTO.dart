
import 'package:json_annotation/json_annotation.dart';

class StoreChooseListViewDTO {
     int depoRef;
     String storeCode;
     String storeName;
     bool favorimi;

StoreChooseListViewDTO({
this.depoRef,this.storeCode,this.storeName,this.favorimi
});

  // int get getDilId => _dilId;
  // String get getKod => _kod;
  // String get getDeger => _deger;
  
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["depoRef"] = depoRef;
    map["storeCode"] = storeCode;
    map["storeName"] = storeName;
     map["favorimi"] = favorimi;

    return map;
  }

  
factory StoreChooseListViewDTO.fromJson(Map<String, dynamic> json) {

  return StoreChooseListViewDTO(
    depoRef: json['depoRef'],
    storeCode: json['storeCode'],
    storeName: json['storeName'],
    favorimi: json['favorimi']
  );
}







}