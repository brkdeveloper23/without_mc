import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/LcwAssistLanguagesDTO.dart';
import 'package:lcwassist/DataAccess/LcwStoreDTOs/GetLatestAppVersionInfoResponseDTO.dart';
import 'package:lcwassist/DataAccess/LcwStoreDTOs/SaveAppUsageLogRequestDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:localstorage/localstorage.dart';


  class LcwStoreService{
  LcwStoreService(){
//Kontrol
  }
  Future<GetLatestAppVersionInfoResponseDTO> getLatestAppVersionInfo(String packageId) async{

    var response = await http.post(
     
     
      Uri.encodeFull(UrlConst.getLatestAppVersionInfo),
      headers: {
        "Content-Type": "application/json"
      }, body: "{'packageId':'"+packageId+"'}"
    );


GetLatestAppVersionInfoResponseDTO result; 
    if (response.statusCode == 200) {
Map<String, dynamic> jsonResult = json.decode(response.body);

   //if(bodyResult["product"] != null )
     result = GetLatestAppVersionInfoResponseDTO.fromJson(jsonResult);

    }

    return result;
  }

  Future setCurrentServiceVersion(String packageId) async{

   final prefs = await SharedPreferences.getInstance();
  GetLatestAppVersionInfoResponseDTO currentLcwStoreVersion = await getLatestAppVersionInfo(packageId);
  prefs.setString(SharedPreferencesConstant.currentLcwStoreVersion, currentLcwStoreVersion.appVersion.versionKey);

  }

  Future lCWStoreAppVersionForce(SaveAppUsageLogRequestDTO deviceInfo) async{

    var response = await http.post(
          
      Uri.encodeFull(UrlConst.getLatestAppVersionInfo),
      headers: {
        "Content-Type": "application/json"
      }, body: json.encode(deviceInfo.toMap())
    );


    if (response.statusCode == 200) {

    }

    
  }

  }