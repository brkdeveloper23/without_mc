class CapacityAnaliysisReportRequestDTO{

String _magazaKod;
String _merchYasGrupKod;
String _merchAltGrupKod;
String _buyerGrupTanim;
String _aksesuarUrun;

 // LoginPageEntryRequestDTO(this._username, this._password);

    set setMagazaKod(String magazaKod) {
      _magazaKod = magazaKod;
    }
    set setMerchYasGrupKod(String merchYasGrupKod) {
      _merchYasGrupKod = merchYasGrupKod;
    }
    set setMerchAltGrupKod(String merchAltGrupKod) {
      _merchAltGrupKod = merchAltGrupKod;
    }

    set setBuyerGrupTanim(String buyerGrupTanim) {
      _buyerGrupTanim = buyerGrupTanim;
    }

    set setAksesuarUrun(String aksesuarUrun) {
      _aksesuarUrun = aksesuarUrun;
    }

  String get getMagazaKod => _magazaKod;
  String get getMerchYasGrupKod => _merchYasGrupKod;
  String get getMerchAltGrupKod => _merchAltGrupKod;
  String get getBuyerGrupTanim => _buyerGrupTanim;
  String get getAksesuarUrun => _aksesuarUrun;
  

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["MagazaKod"] = _magazaKod;
    map["MerchYasGrupKod"] = _merchYasGrupKod;
    map["MerchAltGrupKod"] = _merchAltGrupKod;
    map["BuyerGrupTanim"] = _buyerGrupTanim;
    map["AksesuarUrun"] = _aksesuarUrun;
    
    return map;
  }


   static fromJson(Map<String, dynamic> json) {
  
   CapacityAnaliysisReportRequestDTO adf = new CapacityAnaliysisReportRequestDTO();
    adf._aksesuarUrun = json['AksesuarUrun'];
    adf._buyerGrupTanim =  json['BuyerGrupTanim']; 
    adf._magazaKod =  json['MagazaKod'];
    adf._merchAltGrupKod = json['MerchAltGrupKod'];
    adf._merchYasGrupKod = json['MerchYasGrupKod'];

return adf;
}

}
