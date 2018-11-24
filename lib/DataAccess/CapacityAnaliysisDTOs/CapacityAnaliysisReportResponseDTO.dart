import 'package:lcwassist/DataAccess/ResponseBase.dart';

class CapacityAnaliysisReportResponseDTO implements ResponseBase{
   final String toplamFiiliDolulukLCM;
   final String netNihaiLCMDoluluk;
   final String reyonDolulukLCM;
   final String depoDolulukLCM;
   final String onayLimiti;
   final String toplamKapOverNetNihai; 
   final String reyonStokAdet;
   final String depoStokAdet;
   final String toplamStokAdet;
   final String sonYediGunSatis;
   final String fiiliCover;
   final String yolStokAdet;
   final String onayliOnaysizRezerveAdet;
   final String transferInOut;
   String errorMessage;
   bool isSuccess;
   bool isAuthorized;

CapacityAnaliysisReportResponseDTO({this.toplamFiiliDolulukLCM,this.netNihaiLCMDoluluk,this.reyonDolulukLCM,this.depoDolulukLCM,this.onayLimiti,this.toplamKapOverNetNihai,
this.reyonStokAdet,this.depoStokAdet,this.toplamStokAdet,this.sonYediGunSatis,this.fiiliCover,this.yolStokAdet,this.onayliOnaysizRezerveAdet,this.transferInOut,
this.errorMessage,this.isSuccess,this.isAuthorized});

factory CapacityAnaliysisReportResponseDTO.fromJson(Map<String, dynamic> json) {
  
  return CapacityAnaliysisReportResponseDTO(
    toplamFiiliDolulukLCM: json['toplamFiiliDolulukLCM'] ,
    netNihaiLCMDoluluk: json['netNihaiLCMDoluluk'],
    reyonDolulukLCM: json['reyonDolulukLCM'] ,
    depoDolulukLCM: json['depoDolulukLCM'] ,
    onayLimiti: json['onayLimiti'] ,
    toplamKapOverNetNihai: json['toplamKapOverNetNihai'] ,
    reyonStokAdet: json['reyonStokAdet'] ,
    depoStokAdet: json['depoStokAdet'] ,
    toplamStokAdet: json['toplamStokAdet'] ,
    sonYediGunSatis: json['sonYediGunSatis'] ,
    fiiliCover: json['fiiliCover'] ,
    yolStokAdet: json['yolStokAdet'] ,
    onayliOnaysizRezerveAdet: json['onayliOnaysizRezerveAdet'] ,
    transferInOut: json['transferIN_OUT'] ,
    errorMessage: json['errorMessage'] ,
    isSuccess: json['isSuccess'] ,
    isAuthorized: json['isAuthorized'] 

  );

}

}