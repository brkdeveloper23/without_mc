import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';


class LcwAssistAlertDialogInfo{


String title;
String message;
String buttonText;
BuildContext context;
LcwAssistDialogType lcwAssistDialogType;

LcwAssistAlertDialogInfo(this.title,this.message,this.buttonText,this.context,this.lcwAssistDialogType);
Future show() async{

AlertDialog dialog3 = AlertDialog(
        title: Text(this.title,style: 
        lcwAssistDialogType == LcwAssistDialogType.error ? TextStyle(color: Colors.red,fontFamily: LcwAssistTextStyle.currentTextFontFamily) : 
        lcwAssistDialogType ==LcwAssistDialogType.info ? TextStyle(color: Colors.green,fontFamily: LcwAssistTextStyle.currentTextFontFamily) :
         TextStyle(color: Colors.green,fontFamily: LcwAssistTextStyle.currentTextFontFamily)
        ,),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(this.message),
            ],
          ),
        ),
        actions: <Widget>[


Row(
mainAxisSize: MainAxisSize.max,
//crossAxisAlignment: CrossAxisAlignment.stretch,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    RaisedButton( 
 //height: 40.0, 
 //minWidth: 315.0, 
 color: Color.fromRGBO(68, 152, 247, 1.0),//Colors.green[400],//LcwAssistColor.secondaryColor,//Theme.of(context).primaryColor, 
 textColor: Colors.white, 
 child: new Text(this.buttonText,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 18.0,color: Colors.white),),
onPressed: () {
               Navigator.of(context, rootNavigator: true).pop();
             },
 splashColor:  Color.fromRGBO(128, 189, 242, 1.0),
)
  ],
)

        ],
      );

//await showDialog(context: context, child: dialog3);
await showDialog(context: context, child: alertCard());
return 1;
}

double alertFontSize = 20.0;
Widget alertCard(){
return Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),child: Align(alignment: Alignment.center,child: Container(
  child:  Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
     Card(child: 
Padding(padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),child:
Column(
  
  //mainAxisSize: MainAxisSize.max,
  
mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.stretch,

children: <Widget>[

      Row( mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(this.title,style: 
        lcwAssistDialogType == LcwAssistDialogType.error ? TextStyle(fontSize: alertFontSize,color: Colors.red,fontFamily: LcwAssistTextStyle.currentTextFontFamily) : 
        lcwAssistDialogType ==LcwAssistDialogType.info ? TextStyle(fontSize: alertFontSize,color: Colors.green,fontFamily: LcwAssistTextStyle.currentTextFontFamily) :
         TextStyle(fontSize: alertFontSize,color: Colors.orange[400],fontFamily: LcwAssistTextStyle.currentTextFontFamily)
        ,)
        ],),
      
    
        Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),child: 
        Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
          children: <Widget>[
          Text(this.message,style: TextStyle(fontSize: 16.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)
        ],),)
        ,
      
      new SizedBox(
  width: double.infinity,
  // height: double.infinity,
  child: new     RaisedButton( 
 //height: 40.0, 
 //minWidth: 315.0, 
 color: Color.fromRGBO(68, 152, 247, 1.0),//Colors.green[400],//LcwAssistColor.secondaryColor,//Theme.of(context).primaryColor, 
 textColor: Colors.white, 
 child: new Text(this.buttonText,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 18.0,color: Colors.white),),
onPressed: () {
               Navigator.of(context, rootNavigator: true).pop();
             },
 splashColor:  Color.fromRGBO(128, 189, 242, 1.0),
)
),
      

     ],),),)
    ],
  ),
),),);
}

}
