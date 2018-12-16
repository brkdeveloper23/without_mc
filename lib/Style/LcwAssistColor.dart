import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LcwAssistColor{

  LcwAssistColor(){}

  //static Color primaryColor = Color.fromRGBO(8,112,211,1.0);   //Mavi
  //static Color primaryColor = Color.fromRGBO(77,40,191,1.0); //Mor
 //static Color primaryColor = Color.fromRGBO(49,66,91,1.0);   //Dark_1
//static Color primaryColor = Color.fromRGBO(49,66,91,1.0);   //THY
//static Color primaryColor = Color.fromRGBO(49,66,91,1.0);   //YK
static Color primaryColor = Color.fromRGBO(1,143,191,1.0);   //WORLColor.fromRGBO(1,86,143,1.0);
//static Color primaryColor = Color.fromRGBO(28,48,109,1.0);   //DARKMOR

  //static Color secondaryColor =  Color.fromRGBO(1,95,190,1.0); //Mavi 
  //static Color secondaryColor =  Color.fromRGBO(103,53,255,1.0); //Mor
  //static Color secondaryColor =  Color.fromRGBO(35,47,65,1.0); //Dark_1 Drawer Color
  //static Color secondaryColor =  Color.fromRGBO(1,95,54,1.0); //THY Drawer Color
   //static Color secondaryColor =  Color.fromRGBO(0,79,158,1.0); //YK 
static Color secondaryColor =  Color.fromRGBO(0,111,164,1.0); //WORL Color.fromRGBO(2,65,116,1.0);
//static Color secondaryColor =  Color.fromRGBO(14,26,60,1.0); //DARKMOR 

  //  static Color thirdColor = Color.fromRGBO(68, 152, 247, 1.0);//Mavi
  //static Color thirdColor = Color.fromRGBO(80,92,106, 1.0);//Fume
  //static Color thirdColor = Color.fromRGBO(80,92,106, 1.0);//Dark_1
//static Color thirdColor = Color.fromRGBO(63,73,91, 1.0);//THY
//static Color thirdColor = Color.fromRGBO(4,116,207, 1.0);//YK
static Color thirdColor = Color.fromRGBO(1,117,176, 1.0);//WORL
//static Color thirdColor = Color.fromRGBO(40,71,167, 1.0);//DARKMOR



  //static Color cardLineColor = Color.fromRGBO(68, 152, 247, 1.0);
  static Color cardLineColor = Color.fromRGBO(0, 80, 162, 1.0);

  static Color selectedColor = Color.fromRGBO(255,171,64, 1.0);

  //static Color drawerSubMenuColor = Color.fromRGBO(0, 88, 175, 1.0);//Mavi
//static Color drawerSubMenuColor = Color.fromRGBO(49,66,91,1.0);//Dark_1

static Color drawerSubMenuColor = Color.fromRGBO(0,79,158,1.0);//YK
//static Color drawerSubMenuColor = Color.fromRGBO(14,26,60,1.0);//DARKMOR

static Color drawerColor = Color.fromRGBO(1,95,190,1.0);//YK
//static Color drawerColor = Color.fromRGBO(28,48,109,1.0);//DARKMOR


  static Color reportCardHeaderColor = Colors.grey[700];
  static Color reportCardSubHeaderColor = Color.fromRGBO(155,155,155,1.0);
static Color tomatoColor = Color.fromRGBO(254,99,71,1.0);
  static Color specialOrange = Color.fromRGBO(221, 104, 8, 1.0);//Color.fromRGBO(246, 129, 33, 1.0);
  static Color specialDarkOrange = Color.fromRGBO(206, 92, 0, 1.0);
  static Color yellowGreen = Color.fromRGBO(189, 214, 52, 1.0);//Color.fromRGBO(246, 129, 33, 1.0);
  static Color filterGreen = Color.fromRGBO(78,173,82,1.0);
  static Color backGroundColor = Color.fromRGBO(250,250,250, 1.0);//Color.fromRGBO(237,238,243, 1.0);//
static Color linkColor =   Color.fromRGBO(1, 149, 197, 1.0);//Color.fromRGBO(1, 145, 188, 1.0)
 static Color pageCardHeaderColor =  Color.fromRGBO(100,105,188, 1.0);//Color.fromRGBO(2, 144, 192, 1.0);
  //static Color floatingButtonColor = Colors.blue;

//static Color floatingButtonColor = Color.fromRGBO(48,115,221, 1.0); //thy

static Color floatingButtonColor = Color.fromRGBO(1,117,176, 1.0); //World
//static Color floatingButtonColor = Color.fromRGBO(28,48,109,1.0); //DARKMOR

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