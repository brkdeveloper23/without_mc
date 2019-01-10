
class CapacityPerformanceMetricResponseDTO {

String merchKod; 
String merchTanim;
String periyotReyonKapasiteLCMYuzde;
String brutKar;
String performansaGoreIdealKapasite;
String reyonLCMKapasite;
String satisTutar;
String satisAdet;
String reyonCoverMagaza;
String reyonCoverBolge;


CapacityPerformanceMetricResponseDTO({this.merchKod,this.merchTanim,
this.periyotReyonKapasiteLCMYuzde,this.brutKar,
this.performansaGoreIdealKapasite,this.reyonLCMKapasite,
this.satisTutar,this.satisAdet,
this.reyonCoverMagaza,this.reyonCoverBolge,
});


factory CapacityPerformanceMetricResponseDTO.fromJson(Map<String, dynamic> json) {

  return CapacityPerformanceMetricResponseDTO(
    merchKod: json['merchKod'], 
    merchTanim: json['merchTanim'], 
    periyotReyonKapasiteLCMYuzde: json['periyotReyonKapasiteLCMYuzde'] ,
    brutKar: json['brutKar'],
    performansaGoreIdealKapasite: json['performansaGoreIdealKapasite'],
    reyonLCMKapasite: json['reyonLCMKapasite'],
    satisTutar: json['satisTutar'],
    satisAdet: json['satisAdet'],
    reyonCoverMagaza: json['reyonCoverMagaza'],
    reyonCoverBolge: json['reyonCoverBolge'],
  );
}
}