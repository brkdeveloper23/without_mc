class BestWorstOptionListResponseList{

int _depoRef;
int _modelRef;
int _renkRef;
String _urunAd;
String _modelKod;
String _renkKod;
String _merchAltGrupKod;
String _buyerGrupTanim;
String _merchMarkaYasGrupKod;
String _merchGrupKod;

    set setDepoRef(int depoRef) {
      _depoRef = depoRef;
    }
    set setMerchGrupKod(String merchGrupKod) {
      _merchGrupKod = merchGrupKod;
    }
    set setMerchMarkaYasGrupKod(String merchMarkaYasGrupKod) {
      _merchMarkaYasGrupKod = merchMarkaYasGrupKod;
    }
    set setMerchAltGrupKod(String merchAltGrupKod) {
      _merchAltGrupKod = merchAltGrupKod;
    }

    set setBuyerGrupTanim(String buyerGrupTanim) {
      _buyerGrupTanim = buyerGrupTanim;
    }

    set setModelRef(int modelRef) {
      _modelRef = modelRef;
    }

    set setRenkRef(int renkRef) {
      _renkRef = renkRef;
    }

    set setUrunAd(String urunAd) {
      _urunAd = urunAd;
    }

    set setModelKod(String modelKod) {
      _modelKod = modelKod;
    }

    set setRenkKod(String renkKod) {
      _renkKod = renkKod;
    }

  int get getDepoRef => _depoRef;
  String get getMerchGrupKod => _merchGrupKod;
  String get getMerchMarkaYasGrupKod => _merchMarkaYasGrupKod;
  String get getMerchAltGrupKod => _merchAltGrupKod;
  String get getBuyerGrupTanim => _buyerGrupTanim;
  int get getModelRef => _modelRef;
  int get getRenkRef => _renkRef;
  String get getUrunAd => _urunAd;
  String get getModelKod => _modelKod;
  String get getRenkKod => _renkKod;
  

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["depoRef"] = _depoRef;
    map["MerchGrupKod"] = _merchGrupKod;
    map["MerchMarkaYasGrupKod"] = _merchMarkaYasGrupKod;
    map["MerchAltGrupKod"] = _merchAltGrupKod;
    map["BuyerGrupTanim"] = _buyerGrupTanim;
    map["modelRef"] = _modelRef;
    map["renkRef"] = _renkRef;
    map["urunAd"] = _urunAd;
    map["modelKod"] = _modelKod;
    map["renkKod"] = _renkKod;
    
    return map;
  }


   static fromJson(Map<String, dynamic> json) {
  
   BestWorstOptionListResponseList adf = new BestWorstOptionListResponseList();
    adf._buyerGrupTanim =  json['buyerGrupTanim']; 
    adf._depoRef =  json['depoRef'];
    adf._merchAltGrupKod = json['merchAltGrupKod'];
    adf._merchMarkaYasGrupKod = json['merchMarkaYasGrupKod'];
    adf._merchGrupKod = json['MerchGrupKod'];
    adf._modelRef = json['modelRef'];
    adf._renkRef = json['renkRef'];
    adf._urunAd = json['urunAd'];
    adf._modelKod = json['modelKod'];
    adf._renkKod = json['renkKod'];

return adf;
}


   static fromList(dynamic row) {
  
   BestWorstOptionListResponseList adf = new BestWorstOptionListResponseList();
    adf._buyerGrupTanim =  row["depoRef"]; 
    adf._depoRef =  row['depoRef'];
    adf._merchAltGrupKod = row['merchAltGrupKod'];
    adf._merchMarkaYasGrupKod = row['merchMarkaYasGrupKod'];
    adf._modelRef = row['modelRef'];
    adf._renkRef = row['renkRef'];
    adf._urunAd = row['urunAd'];
    adf._modelKod = row['modelKod'];
    adf._renkKod = row['renkKod'];

return adf;
}




}
