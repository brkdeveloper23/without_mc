import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/loginPage.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenService.dart';
import 'package:path/path.dart';
import 'package:corsac_jwt/corsac_jwt.dart';

class Utils {
  
Utils(){

}

 Future<bool> checkToInternet(BuildContext context) async{

  bool result = true;
  try {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //print('connected');
    
  }
} on SocketException catch (_) {
  //print('not connected');
  LcwAssistAlertDialogInfo('Hata','İnternet bağlantınız bulunmamaktadır.','Tamam',context,LcwAssistDialogType.error).show();
  result = false;
}

return result;
}

 Future<bool> checkToTokenExpire() async{
bool result = false;

String token =  await TokenService.getAuthToken();
if(new JWT.parse(token).expiresAt * 1000 < new DateTime.now().millisecondsSinceEpoch)
result  = true;


return result;
}


 Future<bool> checkToTokenExpireRedirectToLogin(CurrentLangugeDTO currentLanguage, BuildContext context) async{
 bool result = false;

if(await checkToTokenExpire())
      {
        result = true;
        await LcwAssistAlertDialogInfo(currentLanguage.getuyari,currentLanguage.getoturumSonlanmistir,currentLanguage.gettamam,context,LcwAssistDialogType.warning).show();
}
return result;
 }

 void navigateToLoginPage(BuildContext context){
  
  var route = new MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()
          );

    Navigator.of(context).push(route);
}

}