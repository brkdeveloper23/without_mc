import 'package:json_annotation/json_annotation.dart';

class LcwAssistLanguagesDTO {
  int dilId;
  String kod;
  String deger;

LcwAssistLanguagesDTO({
this.dilId,this.deger,this.kod
});

  // int get getDilId => _dilId;
  // String get getKod => _kod;
  // String get getDeger => _deger;
  
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["dilId"] = dilId;
    map["kod"] = kod;
    map["deger"] = deger;

    return map;
  }

  
factory LcwAssistLanguagesDTO.fromJson(Map<String, dynamic> json) {

  return LcwAssistLanguagesDTO(
    dilId: json['dilId'],
    kod: json['kod'],
    deger: json['deger']
  );
}







}
