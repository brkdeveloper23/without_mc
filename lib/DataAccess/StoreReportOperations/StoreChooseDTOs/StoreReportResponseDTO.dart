import 'package:lcwassist/DataAccess/ResponseBase.dart';

class StoreReportResponseDTO implements ResponseBase{
   final String magazaTrafik;
   final String bY_SatisAdet;
   final String adetBuyume;
   final String bY_SatisTutar_KDVsiz;
   final String bY_HedefTutar;
   final String magazaHedefTutturmaYuzdesi; 
   final String gY_SatisAdet;
   final String gY_SatisTutar_KDVsiz;
   final String conversionRate;
   final String tutarBuyume;
   final String sepetBuyukAdet;
   final String sepetBuyukTutarKDVsiz;
   final String stokDevirHizi;
   final String m2Verimlilik;
   String errorMessage;
   bool isSuccess;
   bool isAuthorized;

StoreReportResponseDTO({this.magazaTrafik,this.bY_SatisAdet,this.adetBuyume,this.bY_SatisTutar_KDVsiz,this.bY_HedefTutar,this.magazaHedefTutturmaYuzdesi,
this.gY_SatisAdet,this.gY_SatisTutar_KDVsiz,this.conversionRate,this.tutarBuyume,this.sepetBuyukAdet,this.sepetBuyukTutarKDVsiz,this.stokDevirHizi,this.m2Verimlilik,
this.errorMessage,this.isSuccess,this.isAuthorized});

factory StoreReportResponseDTO.fromJson(Map<String, dynamic> json) {
  
  return StoreReportResponseDTO(
    magazaTrafik: json['magazaTrafik'] ,
    bY_SatisAdet: json['bY_SatisAdet'],
    adetBuyume: json['adetBuyume'] ,
    bY_SatisTutar_KDVsiz: json['bY_SatisTutar_KDVsiz'] ,
    bY_HedefTutar: json['bY_HedefTutar'] ,
    magazaHedefTutturmaYuzdesi: json['magazaHedefTutturmaYuzdesi'] ,
    gY_SatisAdet: json['gY_SatisAdet'] ,
    gY_SatisTutar_KDVsiz: json['gY_SatisTutar_KDVsiz'] ,
    conversionRate: json['conversionRate'] ,
    tutarBuyume: json['tutarBuyume'] ,
    sepetBuyukAdet: json['sepetBuyukAdet'] ,
    sepetBuyukTutarKDVsiz: json['sepetBuyukTutarKDVsiz'] ,
    stokDevirHizi: json['stokDevirHizi'] ,
    m2Verimlilik: json['m2Verimlilik'] ,
    errorMessage: json['errorMessage'] ,
    isSuccess: json['isSuccess'] ,
    isAuthorized: json['isAuthorized'] 
    //errorMessage: json['m2Verimlilik'] ,
  );

}

  // // TODO: implement errorMessage
  // @override
  // String get errorMessage => null;

  // // TODO: implement isAuthorized
  // @override
  // bool get isAuthorized => null;

  // // TODO: implement isSuccess
  // @override
  // bool get isSuccess => null;


}