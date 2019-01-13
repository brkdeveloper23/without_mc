import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/SplashAssist.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';

//void main() => runApp(new MyApp());
void main(){

runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      
      title: 'Lcw Assist',
      //showPerformanceOverlay: true,
      theme: ThemeData(
        //primarySwatch: LcwAssistColor.secondaryColor,LCWAIKIKI\\BURAK.BITKIN Cmb150832
        primaryColor: LcwAssistColor.secondaryColor,
      ),
      home: SplashAssist(), 
    );
  }
}


