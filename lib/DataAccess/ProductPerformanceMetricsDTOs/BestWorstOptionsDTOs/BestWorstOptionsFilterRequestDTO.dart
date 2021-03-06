class BestWorstOptionsFilterRequestDTO{


//  public int depoRef { get; set; }
//         public string MerchGrupKod { get; set; }
//         public string MerchMarkaYasGrupKod { get; set; }
//         public string MerchAltGrupKod { get; set; }
//         public string BuyerGrupTanim { get; set; }
//         public int BestWorstSiralamaTipi { get; set; }
//         public int BestWorstTipi { get; set; }


int _depoRef;
String _merchGrupKod;
String _merchMarkaYasGrupKod;
String _merchAltGrupKod;
String _buyerGrupTanim;
int _bestWorstSiralamaTipi;
int _bestWorstTipi;

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

    set setBestWorstSiralamaTipi(int bestWorstSiralamaTipi) {
      _bestWorstSiralamaTipi = bestWorstSiralamaTipi;
    }

    set setBestWorstTipi(int bestWorstTipi) {
      _bestWorstTipi = bestWorstTipi;
    }

  int get getDepoRef => _depoRef;
  String get getMerchGrupKod => _merchGrupKod;
  String get getMerchMarkaYasGrupKod => _merchMarkaYasGrupKod;
  String get getMerchAltGrupKod => _merchAltGrupKod;
  String get getBuyerGrupTanim => _buyerGrupTanim;
  int get getBestWorstSiralamaTipi => _bestWorstSiralamaTipi;
  int get getBestWorstTipi => _bestWorstTipi;
  

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["depoRef"] = _depoRef;
    map["MerchGrupKod"] = _merchGrupKod;
    map["MerchMarkaYasGrupKod"] = _merchMarkaYasGrupKod;
    map["MerchAltGrupKod"] = _merchAltGrupKod;
    map["BuyerGrupTanim"] = _buyerGrupTanim;
    map["BestWorstSiralamaTipi"] = _bestWorstSiralamaTipi;
    map["BestWorstTipi"] = _bestWorstTipi;
    
    return map;
  }


   static fromJson(Map<String, dynamic> json) {
  
   BestWorstOptionsFilterRequestDTO adf = new BestWorstOptionsFilterRequestDTO();
    adf._buyerGrupTanim =  json['BuyerGrupTanim']; 
    adf._depoRef =  json['depoRef'];
    adf._merchAltGrupKod = json['MerchAltGrupKod'];
    adf._merchMarkaYasGrupKod = json['MerchMarkaYasGrupKod'];
    adf._bestWorstTipi = json['BestWorstTipi'];
    adf._bestWorstSiralamaTipi = json['BestWorstSiralamaTipi'];

return adf;
}

}
