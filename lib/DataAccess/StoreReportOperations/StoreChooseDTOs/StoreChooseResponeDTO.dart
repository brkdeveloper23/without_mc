// class StoreChooseResponeDTO 
//     {
//        List<Stores> stores;
//        String errorMessage;
//        bool isSuccess;
//        bool isAuthorized;

// StoreChooseResponeDTO({this.stores,this.errorMessage,this.isSuccess,this.isAuthorized});
  
// factory StoreChooseResponeDTO.fromJson(Map<String, dynamic> json1) {

// var storesList = json1['stores'] as List;

// return StoreChooseResponeDTO(
//      stores: storesList.map((i) => Stores.fromJson(i)).toList(),
//      errorMessage: json1['errorMessage'],
//      isSuccess: json1['isSuccess'],
//      isAuthorized: json1['isAuthorized']
     
//   );

// }

//     }

// class Stores{ 
  
//         final int depoRef;
//         final String storeCode;
//         final String storeName;
//         final int countryRef;
//         final int toplamM2;
//         final String musteriProfil;
//         final String operasyonelBolgeTanim;
//         final String depoYerlesimTip;
//         final int isOutlet;
//         final String magazaMudur1;
//         final String magazaMudur2;
//         final int personelSayisi;

//        Stores({
//          this.depoRef, this.storeCode,this.storeName, this.countryRef,
// this.toplamM2,this.musteriProfil,this.operasyonelBolgeTanim,this.depoYerlesimTip,this.isOutlet,
// this.magazaMudur1,this.magazaMudur2,this.personelSayisi
//        });

// factory Stores.fromJson(Map<String, dynamic> obj) {

//   return Stores(
    
// depoRef: obj['depoRef'],
// storeCode: obj['storeCode'],
// storeName: obj['storeName'],
// countryRef: obj['countryRef'],
// toplamM2: obj['toplamM2'],
// musteriProfil: obj['musteriProfil'],
// operasyonelBolgeTanim: obj['operasyonelBolgeTanim'],
// depoYerlesimTip: obj['depoYerlesimTip'],
// isOutlet: obj['isOutlet'],
// magazaMudur1: obj['magazaMudur1'],
// magazaMudur2: obj['magazaMudur2'],
// personelSayisi: obj['personelSayisi']
//   );
// }


//   Map<String, dynamic> toMap() {
//     var obj = new Map<String, dynamic>();
// obj['depoRef'] = depoRef;
// obj['storeCode'] =storeCode;
// obj['storeName'] = storeName;
// obj['countryRef'] = countryRef;
// obj['toplamM2'] =toplamM2;
// obj['musteriProfil'] = musteriProfil;
// obj['operasyonelBolgeTanim'] = operasyonelBolgeTanim;
// obj['depoYerlesimTip'] = depoYerlesimTip;
// obj['isOutlet'] = isOutlet;
// obj['magazaMudur1'] = magazaMudur1;
// obj['magazaMudur2'] =magazaMudur2;
// obj['personelSayisi'] = personelSayisi;
//     return obj;
//   }



// }




import 'package:lcwassist/DataAccess/ResponseBase.dart';

class StoreChooseResponeDTO 
    {
       List<Stores> stores;
       ResponseBase responseBase;

StoreChooseResponeDTO({this.stores});
  
factory StoreChooseResponeDTO.fromJson(Map<String, dynamic> json1) {

var storesList = json1['stores'] as List;

return StoreChooseResponeDTO(
     stores: storesList.map((i) => Stores.fromJson(i)).toList(),     
  );

}

    }

class Stores{ 
  
        final int depoRef;
        final String storeCode;
        final String storeName;
        final int countryRef;
        final int toplamM2;
        final String musteriProfil;
        final String operasyonelBolgeTanim;
        final String depoYerlesimTip;
        final int isOutlet;
        final String magazaMudur1;
        final String magazaMudur2;
        final int personelSayisi;

       Stores({
         this.depoRef, this.storeCode,this.storeName, this.countryRef,
this.toplamM2,this.musteriProfil,this.operasyonelBolgeTanim,this.depoYerlesimTip,this.isOutlet,
this.magazaMudur1,this.magazaMudur2,this.personelSayisi
       });

factory Stores.fromJson(Map<String, dynamic> obj) {

  return Stores(
    
depoRef: obj['depoRef'],
storeCode: obj['storeCode'],
storeName: obj['storeName'],
countryRef: obj['countryRef'],
toplamM2: obj['toplamM2'],
musteriProfil: obj['musteriProfil'],
operasyonelBolgeTanim: obj['operasyonelBolgeTanim'],
depoYerlesimTip: obj['depoYerlesimTip'],
isOutlet: obj['isOutlet'],
magazaMudur1: obj['magazaMudur1'],
magazaMudur2: obj['magazaMudur2'],
personelSayisi: obj['personelSayisi']
  );
}


  Map<String, dynamic> toMap() {
    var obj = new Map<String, dynamic>();
obj['depoRef'] = depoRef;
obj['storeCode'] =storeCode;
obj['storeName'] = storeName;
obj['countryRef'] = countryRef;
obj['toplamM2'] =toplamM2;
obj['musteriProfil'] = musteriProfil;
obj['operasyonelBolgeTanim'] = operasyonelBolgeTanim;
obj['depoYerlesimTip'] = depoYerlesimTip;
obj['isOutlet'] = isOutlet;
obj['magazaMudur1'] = magazaMudur1;
obj['magazaMudur2'] =magazaMudur2;
obj['personelSayisi'] = personelSayisi;
    return obj;
  }



}




