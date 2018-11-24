import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:path/path.dart';

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

  bool result = true;
  try {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //print('connected');
    
  }
} on SocketException catch (_) {
  //print('not connected');
  result = false;
}

return result;
}

}