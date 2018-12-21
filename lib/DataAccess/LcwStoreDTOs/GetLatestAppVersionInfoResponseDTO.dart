import 'package:json_annotation/json_annotation.dart';

class GetLatestAppVersionInfoResponseDTO {
  AppVersion appVersion;
  bool resultCode;
  String resultMessage;

GetLatestAppVersionInfoResponseDTO({
this.appVersion,this.resultCode,this.resultMessage
});

  // int get getDilId => _dilId;
  // String get getKod => _kod;
  // String get getDeger => _deger;
  
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["appVersion"] = appVersion;
    map["resultCode"] = resultCode;
    map["resultMessage"] = resultMessage;

    return map;
  }

  
factory GetLatestAppVersionInfoResponseDTO.fromJson(Map<String, dynamic> json) {

  return GetLatestAppVersionInfoResponseDTO(
    appVersion: AppVersion.fromJson(json['AppVersion']),
    resultCode: json['ResultCode'],
    resultMessage: json['ResultMessage']
  );
}

}




class AppVersion {
  int id;
  int appId;
  String buildFile;
  String versionCode;
  String versionKey;
  String versionNotes;
  bool forced;
  bool isActive;
  String minimumOSVersion;
  String minValidVersionCodeToForce;
  String created;
  String downloadUrl;

AppVersion({
this.id,this.appId,this.buildFile,this.versionCode,this.versionKey,this.versionNotes,
this.forced,this.isActive,this.minimumOSVersion,this.minValidVersionCodeToForce,
this.created,this.downloadUrl
});


  // Map<String, dynamic> toMap() {
  //   var map = new Map<String, dynamic>();

  //   map["appVersion"] = appVersion;
  //   map["resultCode"] = resultCode;
  //   map["resultMessage"] = resultMessage;

  //   return map;
  // }

  
factory AppVersion.fromJson(Map<String, dynamic> json) {

  return AppVersion(
   id: json['Id'],
   appId: json['AppId'],
   buildFile: json['BuildFile'],
   versionCode: json['VersionCode'],
   versionKey: json['VersionKey'],
   versionNotes: json['VersionNotes'],
   forced: json['Forced'],
   isActive: json['IsActive'],
   minimumOSVersion: json['MinimumOSVersion'],
   minValidVersionCodeToForce: json['MinValidVersionCodeToForce'],
   created: json['Created'],
   downloadUrl: json['DownloadUrl']

  );
}







}