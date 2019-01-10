
class CapacityPerformanceMetricRequestDTO {

int tarihFilter; 
String aksesuarUrun;
String merchYasGrupKod;
int depoRef;

CapacityPerformanceMetricRequestDTO({this.tarihFilter,this.aksesuarUrun,this.merchYasGrupKod,this.depoRef});


factory CapacityPerformanceMetricRequestDTO.fromJson(Map<String, dynamic> json) {

  return CapacityPerformanceMetricRequestDTO(
    tarihFilter: json['tarihFilter'], 
    aksesuarUrun: json['aksesuarUrun'], 
    merchYasGrupKod: json['merchYasGrupKod'] ,
    depoRef: json['depoRef']
    
  );
}

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["tarihFilter"] = tarihFilter;
    map["aksesuarUrun"] = aksesuarUrun;
    map["merchYasGrupKod"] = merchYasGrupKod;
    map["depoRef"] = depoRef;
    
    return map;
  }






}