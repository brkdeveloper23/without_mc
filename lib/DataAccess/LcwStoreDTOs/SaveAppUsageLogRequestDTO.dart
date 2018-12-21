import 'package:json_annotation/json_annotation.dart';

class SaveAppUsageLogRequestDTO {

  String packageId;
    String deviceId;
      String versionCode;

SaveAppUsageLogRequestDTO({
this.packageId,this.deviceId,this.versionCode
});

  // int get getDilId => _dilId;
  // String get getKod => _kod;
  // String get getDeger => _deger;
  
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["packageId"] = packageId;
    map["deviceId"] = deviceId;
    map["versionCode"] = versionCode;

    return map;
  }

  
factory SaveAppUsageLogRequestDTO.fromJson(Map<String, dynamic> json) {

  return SaveAppUsageLogRequestDTO(
    packageId: json['packageId'],
    deviceId: json['deviceId'],
    versionCode: json['versionCode']
  );
}

}
