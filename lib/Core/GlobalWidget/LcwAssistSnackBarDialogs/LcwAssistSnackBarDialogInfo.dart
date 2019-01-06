import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';


class LcwAssistSnackBarDialogInfo{



String message;
GlobalKey<ScaffoldState> scaffoldState;
LcwAssistSnagitType lcwAssistSnagitType; 

LcwAssistSnackBarDialogInfo(this.message,this.scaffoldState,this.lcwAssistSnagitType);

snackbarShow(){
scaffoldState.currentState.showSnackBar(new SnackBar(
  content: Row(children: <Widget>[
  this.lcwAssistSnagitType == LcwAssistSnagitType.warning ? 
  Icon(Icons.warning,color: Colors.amber[400],size: 32.0,) : 
  this.lcwAssistSnagitType == LcwAssistSnagitType.info ? 
   Icon(Icons.info,color: Colors.green[800],size: 32.0,) : 
   Icon(Icons.done,color: Colors.lightBlue[500],size: 32.0,),
    Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),),
    Text(this.message,style: TextStyle(fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)
    ],),
  duration: Duration(seconds: 2),
  backgroundColor: Colors.black.withOpacity(0.7),
));
}



}
