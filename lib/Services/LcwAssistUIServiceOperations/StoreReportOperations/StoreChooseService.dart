
import 'dart:async';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/FavoriteStoreListDto.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportResponseDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreChooseService{

StoreChooseService(){
}
 
Future<StoreChooseResponeDTO> storeListRequest() async {

StoreChooseResponeDTO userResponse ;
LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
CurrentLangugeDTO currentLanguage = new CurrentLangugeDTO();

currentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();

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
Stores(countryRef: 48,depoRef: 0,depoYerlesimTip: "",isOutlet: 0,magazaMudur1: "",magazaMudur2: "",
musteriProfil: "",operasyonelBolgeTanim: "",personelSayisi: 0,storeCode: "0",storeName: currentLanguage.gettumMagazalar,toplamM2: 0)
);
 
  } else if (response.statusCode == 401){

userResponse = new StoreChooseResponeDTO(stores: null,errorMessage: "",isAuthorized: false,isSuccess: false);
  }

    return userResponse;
  }

Future<List<StoreChooseListViewDTO>> storeListForListViewRequest() async {

final prefs = await SharedPreferences.getInstance();
StoreChooseResponeDTO userResponse ;
List<StoreChooseListViewDTO> listResponse = new List<StoreChooseListViewDTO>();

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
CurrentLangugeDTO currentLanguage = new CurrentLangugeDTO();

currentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();

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
Stores(countryRef: 48,depoRef: 0,depoYerlesimTip: "",isOutlet: 0,magazaMudur1: "",magazaMudur2: "",
musteriProfil: "",operasyonelBolgeTanim: "",personelSayisi: 0,storeCode: "0",storeName: currentLanguage.gettumMagazalar,toplamM2: 0)
);

List<FavoriteStoreListDto> listFavoriteStores = new List<FavoriteStoreListDto>();
String jsonList = "";

jsonList = prefs.getString(SharedPreferencesConstant.favoriteStoreList);
if(jsonList != ""){
Iterable l = json.decode(jsonList);
listFavoriteStores = l.map((i)=> FavoriteStoreListDto.fromJson(i)).toList();
}


for(final asd in userResponse.stores)
{
StoreChooseListViewDTO item = new StoreChooseListViewDTO();
item.depoRef = asd.depoRef;
item.storeCode = asd.storeCode;
item.storeName = asd.storeName;
item.favorimi = listFavoriteStores.any((i) => i.magazaKod == asd.storeCode) ? true : false;
item.countryRef = asd.countryRef;
item.toplamM2 =asd.toplamM2;
item.musteriProfil = asd.musteriProfil;
item.operasyonelBolgeTanim = asd.operasyonelBolgeTanim;
item.depoYerlesimTip = asd.depoYerlesimTip;
item.isOutlet = asd.isOutlet;
item.magazaMudur1 = asd.magazaMudur1;
item.magazaMudur2 = asd.magazaMudur2;
item.personelSayisi = asd.personelSayisi;


listResponse.add(item);
}

//Favori olanlar yukarıda olcak şekilde sırala
if(listFavoriteStores.length > 0){
  for(final fre in listResponse.where((i) => i.favorimi == true)){
listResponse.remove(fre);
if(fre.storeCode == "0")
listResponse.insert(0, fre);
else
listResponse.insert(1, fre);
  }
}


  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post ' + response.statusCode.toString() + ' ' );
  }

    return listResponse;
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
} else if(response.statusCode == 401){
responseDTO = new StoreReportResponseDTO(errorMessage: "",isSuccess: false,isAuthorized: false);
}

return responseDTO;
  }

Future saveCurrentStore(StoreChooseListViewDTO store) async{

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

Future<StoreChooseListViewDTO> getCurrentStore() async{
final prefs = await SharedPreferences.getInstance();
String currentStore = "";
currentStore = prefs.getString(SharedPreferencesConstant.currentStore);

StoreChooseListViewDTO ss;
ss = StoreChooseListViewDTO.fromJson((json.decode(currentStore)));

return ss; 
}

StoreChooseListViewDTO setTumMagazalar(String tumMagazalarText){
  return StoreChooseListViewDTO//(depoRef: 0,favorimi: true,storeCode: "0",storeName: tumMagazalarText);
  
  (countryRef: 48,depoRef: 0,depoYerlesimTip: "",isOutlet: 0,magazaMudur1: "",magazaMudur2: "",favorimi: true,
   musteriProfil: "",operasyonelBolgeTanim: "",personelSayisi: 0,storeCode: "0",storeName: tumMagazalarText,toplamM2: 0);
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


if(listFavoriteStores.where((i) => i.magazaKod == storeCode).toList().length > 0)
{
  listFavoriteStores.remove(listFavoriteStores.where((i) => i.magazaKod == storeCode).first);
}else
{
  FavoriteStoreListDto eklenecek = new FavoriteStoreListDto();
  eklenecek.magazaKod = storeCode;

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

prefs.setString(SharedPreferencesConstant.favoriteStoreList, asafd);


}

}
