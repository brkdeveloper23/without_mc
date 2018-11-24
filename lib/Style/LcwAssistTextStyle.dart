import 'package:flutter/material.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';

class LcwAssistTextStyle {
//style: TextStyle(fontFamily: 'Ubuntu')
static String currentTextFontFamily = 'Ubuntu';
static double reportCardHeaderfontSize  = 14.0;
static double reportCardsubHeaderfontSize  = 20.0;

static TextStyle reportCardHeaderTextStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: reportCardHeaderfontSize,fontFamily: currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor);
static TextStyle reportCardsubHeaderTextStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: reportCardsubHeaderfontSize,fontFamily: currentTextFontFamily,color: LcwAssistColor.reportCardSubHeaderColor);

}