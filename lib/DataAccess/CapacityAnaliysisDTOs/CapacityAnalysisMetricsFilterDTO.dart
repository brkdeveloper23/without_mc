import 'dart:convert';

import 'package:lcwassist/DataAccess/ResponseBase.dart';

class CapacityAnalysisMetricsFilterDTO  implements ResponseBase{


  List<MerchHierarchiesDTO> merchHierarchiesList;
   String errorMessage;
   bool isSuccess;
   bool isAuthorized;

CapacityAnalysisMetricsFilterDTO({this.merchHierarchiesList,this.errorMessage,this.isSuccess,this.isAuthorized});




factory CapacityAnalysisMetricsFilterDTO.fromJson(Map<String, dynamic> json) {

var merchHierarchies = json['merchHierarchies'] as List;
  return CapacityAnalysisMetricsFilterDTO(
     
    merchHierarchiesList: merchHierarchies.map((i) => MerchHierarchiesDTO.fromJson(i)).toList(),

    errorMessage: json['errorMessage'],
    isSuccess: json['isSuccess'],
    isAuthorized: json['isAuthorized'] 
  );
}






//    final List<String> merchAltGroupKodList;
//    final List<String>  merchYasGrupKodList;
//    final List<String>  buyerGrupTanimList;
//    final List<String>  aksesuarUrunList;


// CapacityAnalysisMetricsFilterDTO({this.merchAltGroupKodList,this.merchYasGrupKodList,this.buyerGrupTanimList,this.aksesuarUrunList});
  


// factory CapacityAnalysisMetricsFilterDTO.fromJson(Map<String, dynamic> json1) {

// var merchAltGroupKodList_ = json1['merchAltGroupKodList'] as List;
// var merchYasGrupKodList_ = json1['merchYasGrupKodList'] as List;
// var buyerGrupTanimList_ = json1['buyerGrupTanimList'] as List;
// var aksesuarUrunList_ = json1['aksesuarUrunList'] as List;

//   return CapacityAnalysisMetricsFilterDTO(
     
//      merchAltGroupKodList: merchAltGroupKodList_.map((i) => i.toString()).toList(),
//   merchYasGrupKodList:merchYasGrupKodList_.map((i) => i.toString()).toList(),
//   buyerGrupTanimList:buyerGrupTanimList_.map((i) => i.toString()).toList(),
//   aksesuarUrunList:aksesuarUrunList_.map((i) => i.toString()).toList()
//   );
// }





}

class MerchHierarchiesDTO{
final String merchGrupKod; 
final String merchMarkaYasGrupKod;
final String  merchAltGrupKod;
final String  buyerGrupTanim;
final String  aksesuarUrun;

MerchHierarchiesDTO({this.merchGrupKod,this.merchMarkaYasGrupKod,this.merchAltGrupKod,this.buyerGrupTanim,this.aksesuarUrun});


factory MerchHierarchiesDTO.fromJson(Map<String, dynamic> json) {


  return MerchHierarchiesDTO(
    merchGrupKod: json['merchGrupKod'], 
    aksesuarUrun: json['aksesuarUrun'], 
    merchMarkaYasGrupKod: json['merchMarkaYasGrupKod'] ,
    merchAltGrupKod: json['merchAltGrupKod'],
    buyerGrupTanim: json['buyerGrupTanim'] 
    
  );
}


}


class MerchGrupDTO{
int kod;
String tanim;

MerchGrupDTO({this.kod,this.tanim});

}

class MerchAltGroupDTO{

int kod;
String tanim;
MerchAltGroupDTO({this.kod,this.tanim});
}

class MerchMarkaYasGrupDTO{
int kod;
String tanim;

MerchMarkaYasGrupDTO({this.kod,this.tanim});
}

class BuyerGrupTanimDTO{
int kod;
String tanim;

BuyerGrupTanimDTO({this.kod,this.tanim});
}

class AksesuarUrunDTO{
int kod;
String tanim;

AksesuarUrunDTO({this.kod,this.tanim});

}

class BestWorstOptionDTO{
int kod;
String tanim;

BestWorstOptionDTO({this.kod,this.tanim});

}


class BestWorstOptionSiralamaTipi{
int kod;
String tanim;

BestWorstOptionSiralamaTipi({this.kod,this.tanim});

}