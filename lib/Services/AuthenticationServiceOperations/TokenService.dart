import 'dart:async';

import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService{

static Future saveAuthToken(String token) async{

final prefs = await SharedPreferences.getInstance();

if(prefs.getString(SharedPreferencesConstant.authToken) != "")
prefs.remove(SharedPreferencesConstant.authToken);

prefs.setString(SharedPreferencesConstant.authToken, token);
}

static Future deleteAuthToken() async{
final prefs = await SharedPreferences.getInstance();
prefs.remove(SharedPreferencesConstant.authToken);
}

static Future<String> checkAuthToken() async{
final prefs = await SharedPreferences.getInstance();
return prefs.getString(SharedPreferencesConstant.authToken);
}

static Future<String> getAuthToken() async{
final prefs = await SharedPreferences.getInstance();
return prefs.getString(SharedPreferencesConstant.authToken);
}

}