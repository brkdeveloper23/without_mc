
import 'dart:async';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportResponseDTO.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenOperations/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreChooseService{

StoreChooseService(){

}


Future<StoreChooseResponeDTO> storeListRequest() async {

StoreChooseResponeDTO userResponse ;

String token =  await TokenService.getAuthToken();
    var response = await http.post(
     
     
      Uri.encodeFull(UrlConst.getStoreAllUrl),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode("")
    );



    if (response.statusCode == 200) {

//StoreChooseResponeDTO
 userResponse = StoreChooseResponeDTO.fromJson(json.decode(response.body));
userResponse.stores.insert(0, 
setTumMagazalar()
);
 
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post ' + response.statusCode.toString() + ' ' );
  }

    return userResponse;
  }


  Future<StoreReportResponseDTO> storeReport(StoreReportRequestDTO parameter) async{
  StoreReportResponseDTO responseDTO;

  String token =  await TokenService.getAuthToken();
  Map<String, dynamic> body = parameter.toMap();
    var response = await http.post(
     
     
      Uri.encodeFull(UrlConst.getStoreReportOtherUrl),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode(body)
    );

    

if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
     responseDTO = StoreReportResponseDTO.fromJson(json.decode(response.body));
    
     return responseDTO;
}

  }



Future saveCurrentStore(Stores store) async{

final prefs = await SharedPreferences.getInstance();

if(prefs.getString(SharedPreferencesConstant.currentStore) != "")
prefs.remove(SharedPreferencesConstant.currentStore);

Map<String, dynamic>  asass  = store.toMap();
String jsonString = json.encode(asass);

prefs.setString(SharedPreferencesConstant.currentStore, jsonString.toString());
}

Future deleteCurrentStore() async{
final prefs = await SharedPreferences.getInstance();
prefs.remove(SharedPreferencesConstant.currentStore);
}

Future<Stores> getCurrentStore() async{
final prefs = await SharedPreferences.getInstance();
String currentStore = "";
currentStore = prefs.getString(SharedPreferencesConstant.currentStore);

Stores ss;
ss = Stores.fromJson((json.decode(currentStore)));

return ss; 
}

Stores setTumMagazalar(){
  return Stores(countryRef: 48,depoRef: 0,depoYerlesimTip: "",isOutlet: 0,magazaMudur1: "",magazaMudur2: "",
  musteriProfil: "",operasyonelBolgeTanim: "",personelSayisi: 0,storeCode: "0",storeName: "TÜM MAĞAZALAR",toplamM2: 0);
}

}
