
import 'dart:async';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/FavoriteStoreListDto.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportResponseDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenOperations/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreChooseService{

StoreChooseService(){

}


Future<StoreChooseResponeDTO> storeListRequest() async {

StoreChooseResponeDTO userResponse ;
LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
CurrentLangugeDTO currentLanguage = new CurrentLangugeDTO();

currentLanguage = await applicationManager.languagesService.currentLanguage();

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
setTumMagazalar(currentLanguage.gettumMagazalar)
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

Stores setTumMagazalar(String tumMagazalarText){
  return Stores(countryRef: 48,depoRef: 0,depoYerlesimTip: "",isOutlet: 0,magazaMudur1: "",magazaMudur2: "",
  musteriProfil: "",operasyonelBolgeTanim: "",personelSayisi: 0,storeCode: "",storeName: tumMagazalarText,toplamM2: 0);
}

Future<void> saveFavoriteStore(String storeCode) async {
final prefs = await SharedPreferences.getInstance();
List<FavoriteStoreListDto> listFavoriteStores = new List<FavoriteStoreListDto>();

if(prefs.getString(SharedPreferencesConstant.favoriteStoreList) != null)
{
String jsonList = "";
jsonList = prefs.getString(SharedPreferencesConstant.favoriteStoreList);
Iterable l = json.decode(jsonList);
listFavoriteStores = l.map((i)=> FavoriteStoreListDto.fromJson(i)).toList();
}


if(listFavoriteStores.where((i) => i.getMagazaKod == storeCode).toList().length > 0)
{
  listFavoriteStores.remove(listFavoriteStores.where((i) => i.getMagazaKod == storeCode).first);
}else
{
  FavoriteStoreListDto eklenecek = new FavoriteStoreListDto();
  eklenecek.setMagazaKod = storeCode;

  listFavoriteStores.add(eklenecek);
}


String asafd = "[";
for(final asd in listFavoriteStores)
{
  asafd += json.encode(asd.toMap());
  asafd += ",";
}
asafd = asafd.substring(0, asafd.lastIndexOf(","));
asafd += "]";

if(prefs.getString(SharedPreferencesConstant.favoriteStoreList) != "")
prefs.remove(SharedPreferencesConstant.favoriteStoreList);

prefs.setString(SharedPreferencesConstant.currentLanguageId, asafd);


}

}
