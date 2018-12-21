
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryRequestDTO.dart';
import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryResponseDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPageService{

LoginPageService(){

}


  Future<LoginPageEntryResponseDTO> loginEntryRequest(LoginPageEntryRequestDTO request) async {

Map<String, dynamic> body = request.toMap();
//{
// //'Barcode':'8681360868534',
// 'Barcode':barcod,
// 'ModelCode':'',
// 'StoreRef':'671',
// 'StoreCode':'',
// 'ColorCode':'',
// 'CountryRef':'48'
//  };

String jsonString = json.encode(body);
String paramName = 'param'; // give the post param a name
String formBody = paramName + '=' + Uri.encodeQueryComponent(jsonString);

LoginPageEntryResponseDTO userResponse ;

    var response = await http.post(
     
      Uri.encodeFull(UrlConst.loginUrl),
      headers: {
        "Content-Type": "application/json"
      }, body: jsonString
    );

    if (response.statusCode == 200) {

     userResponse = LoginPageEntryResponseDTO.map(json.decode(response.body));

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post ' + response.statusCode.toString() + ' ' );
  }

    return userResponse;
  }


Future saveCurrentUser(LoginPageEntryResponseDTO user) async{

final prefs = await SharedPreferences.getInstance();

if(prefs.getString(SharedPreferencesConstant.currentUser) != "")
prefs.remove(SharedPreferencesConstant.currentUser);

Map<String, dynamic>  asass  = user.toMap();
String jsonString = json.encode(asass);

prefs.setString(SharedPreferencesConstant.currentUser, jsonString.toString());
}

Future deleteCurrentUser() async{
final prefs = await SharedPreferences.getInstance();
prefs.remove(SharedPreferencesConstant.currentUser);
}

Future<LoginPageEntryResponseDTO> getCurrentUser() async{
final prefs = await SharedPreferences.getInstance();
String currentUser = "";
currentUser = prefs.getString(SharedPreferencesConstant.currentUser);

LoginPageEntryResponseDTO ss;
ss = LoginPageEntryResponseDTO.map((json.decode(currentUser)));

return ss; 
}




}