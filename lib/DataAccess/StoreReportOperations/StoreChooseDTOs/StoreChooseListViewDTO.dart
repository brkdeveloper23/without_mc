
import 'package:json_annotation/json_annotation.dart';

class StoreChooseListViewDTO {
     int depoRef;
     String storeCode;
     String storeName;
     bool favorimi;

     int countryRef;
     int toplamM2;
     String musteriProfil;
     String operasyonelBolgeTanim;
     String depoYerlesimTip;
     int isOutlet;
     String magazaMudur1;
     String magazaMudur2;
     int personelSayisi;

StoreChooseListViewDTO({
this.depoRef,this.storeCode,this.storeName,this.favorimi,this.countryRef,this.toplamM2,this.musteriProfil,this.operasyonelBolgeTanim,this.depoYerlesimTip,
this.isOutlet,this.magazaMudur1,this.magazaMudur2,this.personelSayisi
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

     map["countryRef"] = countryRef;
     map["toplamM2"] = toplamM2;
     map["musteriProfil"] = musteriProfil;
     map["operasyonelBolgeTanim"] = operasyonelBolgeTanim;
     map["depoYerlesimTip"] = depoYerlesimTip;
     map["isOutlet"] = isOutlet;
     map["magazaMudur1"] = magazaMudur1;
     map["magazaMudur2"] = magazaMudur2;
     map["personelSayisi"] = personelSayisi;
     

    return map;
  }

  
factory StoreChooseListViewDTO.fromJson(Map<String, dynamic> json) {

  return StoreChooseListViewDTO(
    depoRef: json['depoRef'],
    storeCode: json['storeCode'],
    storeName: json['storeName'],
    favorimi: json['favorimi'],
    
countryRef: json['countryRef'],
toplamM2: json['toplamM2'],
musteriProfil: json['musteriProfil'],
operasyonelBolgeTanim: json['operasyonelBolgeTanim'],
depoYerlesimTip: json['depoYerlesimTip'],
isOutlet: json['isOutlet'],
magazaMudur1: json['magazaMudur1'],
magazaMudur2: json['magazaMudur2'],
personelSayisi: json['personelSayisi']

  );
}







}