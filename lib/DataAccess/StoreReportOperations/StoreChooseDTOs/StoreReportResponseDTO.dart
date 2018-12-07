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
   final List<StoreFilterDto> filters;
   final List<StorePeriodFilterDTO> periodFilterList;
   String errorMessage;
   bool isSuccess;
   bool isAuthorized;

StoreReportResponseDTO({this.magazaTrafik,this.bY_SatisAdet,this.adetBuyume,this.bY_SatisTutar_KDVsiz,this.bY_HedefTutar,this.magazaHedefTutturmaYuzdesi,
this.gY_SatisAdet,this.gY_SatisTutar_KDVsiz,this.conversionRate,this.tutarBuyume,this.sepetBuyukAdet,this.sepetBuyukTutarKDVsiz,this.stokDevirHizi,this.m2Verimlilik,
this.filters,this.periodFilterList,this.errorMessage,this.isSuccess,this.isAuthorized});

factory StoreReportResponseDTO.fromJson(Map<String, dynamic> json) {
    var filters = json['filters'] as List;
var periodFilterList = json['periodFilterList'] as List;

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
    filters: filters.map((i) => StoreFilterDto.fromJson(i)).toList(),
    periodFilterList: periodFilterList.map((i) => StorePeriodFilterDTO.fromJson(i)).toList(),
    errorMessage: json['errorMessage'] ,
    isSuccess: json['isSuccess'] ,
    isAuthorized: json['isAuthorized'] 
    //errorMessage: json['m2Verimlilik'] ,
  );

}

}




class StoreFilterDto 
    {
        
        final int yilHafta;
        final bool ytd;
      final bool mtd;
      final bool wtd;


        StoreFilterDto({this.yilHafta,this.ytd,this.mtd,this.wtd});

factory StoreFilterDto.fromJson(Map<String, dynamic> json) {


  return StoreFilterDto(
     yilHafta: json['yilHafta'],
     ytd: json['ytd'],
     mtd: json['mtd'],
     wtd: json['wtd']
    
  );
}
    }


    
class StorePeriodFilterDTO 
    {
        
        final int id;
        final String deger;


        StorePeriodFilterDTO({this.id,this.deger});

factory StorePeriodFilterDTO.fromJson(Map<String, dynamic> json) {


  return StorePeriodFilterDTO(

     id: json['id'],
     deger: json['deger']
    
  );
}




    }