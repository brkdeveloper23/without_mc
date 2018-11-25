import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LcwAssistColor{

  LcwAssistColor(){}

  static Color primaryColor = Color.fromRGBO(8,112,211,1.0);   //Mavi
  //static Color primaryColor = Color.fromRGBO(77,40,191,1.0); //Mor
  //static Color primaryColor = Color.fromRGBO(25,36,56,1.0);  //Füme
  //static Color primaryColor = getTheme() == 1 ? Color.fromRGBO(8,112,211,1.0):Color.fromRGBO(25,36,56,1.0); //Füme 
  static Color secondaryColor =  Color.fromRGBO(1,95,190,1.0); //Mavi 
  //static Color secondaryColor =  Color.fromRGBO(103,53,255,1.0); //Mor
  //static Color secondaryColor = Color.fromRGBO(18,26,41,1.0); //Füme
  //static Color secondaryColor = Color.fromRGBO(18,26,41,1.0);
    static Color thirdColor = Color.fromRGBO(68, 152, 247, 1.0);//Mavi
  //static Color thirdColor = Color.fromRGBO(80,92,106, 1.0);//Fume

  static Color cardLineColor = Color.fromRGBO(68, 152, 247, 1.0);
  static Color selectedColor = Color.fromRGBO(255,171,64, 1.0);

  static Color reportCardHeaderColor = Colors.grey[700];
  static Color reportCardSubHeaderColor = Color.fromRGBO(155,155,155,1.0);
static Color tomatoColor = Color.fromRGBO(254,99,71,1.0);
  static Color specialOrange = Color.fromRGBO(221, 104, 8, 1.0);//Color.fromRGBO(246, 129, 33, 1.0);
  static Color specialDarkOrange = Color.fromRGBO(206, 92, 0, 1.0);
  static Color yellowGreen = Color.fromRGBO(189, 214, 52, 1.0);//Color.fromRGBO(246, 129, 33, 1.0);
  static Color filterGreen = Color.fromRGBO(78,173,82,1.0);
  static Color backGroundColor = Color.fromRGBO(250,250,250, 1.0);

  static Color floatingButtonColor = Colors.blue;
int asasasa; 

int deneme(){
  return 1;
}

static Future saveTheme(int colorId) async{

final prefs = await SharedPreferences.getInstance();

if(prefs.getString("Renk") != "")
prefs.remove("Renk");

prefs.setInt("Renk", colorId);
}

static Future<int> getTheme() async{
final prefs = await SharedPreferences.getInstance();
int colorId = 0;
colorId = prefs.getInt("Renk");

return colorId; 
}



}