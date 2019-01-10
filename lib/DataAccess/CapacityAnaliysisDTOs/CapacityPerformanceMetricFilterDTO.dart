
class CapacityPerformanceMetricFilterDTO {

String tarihFilter; 
String aksesuarUrun;
String merchYasGrupKod;
String merchMarkaYasGrupKod;

CapacityPerformanceMetricFilterDTO({this.tarihFilter,this.aksesuarUrun,this.merchYasGrupKod,this.merchMarkaYasGrupKod});


factory CapacityPerformanceMetricFilterDTO.fromJson(Map<String, dynamic> json) {


  return CapacityPerformanceMetricFilterDTO(
    tarihFilter: json['tarihFilter'], 
    aksesuarUrun: json['aksesuarUrun'], 
    merchYasGrupKod: json['merchYasGrupKod'] ,
    merchMarkaYasGrupKod: json['merchMarkaYasGrupKod']
    
  );
}
}