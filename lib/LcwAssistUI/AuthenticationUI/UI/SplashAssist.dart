// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
// import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
// import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/loginPage.dart';

// import 'package:lcwassist/Style/LcwAssistColor.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:localstorage/localstorage.dart';

// void main(){
//   runApp(new MaterialApp(
//     home:new SplashAssist(),
//   ));
// }

// class SplashAssist extends StatefulWidget{

//   @override
//   MainPageState createState() => new MainPageState();
// }

// class MainPageState extends State<SplashAssist>{

// LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

//   @override
//   Widget build(BuildContext context) {

//     return new Scaffold(
      
//       backgroundColor: LcwAssistColor.secondaryColor,
//       body: Column(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           //Image.asset('assets/imglogolcwassist.png'),


//  new Container(
//     width: 120.0,
//     height: 40.0,
//       alignment: Alignment.center,
//       decoration: new BoxDecoration(

//       image: DecorationImage(
//           image: AssetImage('assets/imglogolcwassist.png'),
//           fit: BoxFit.fill
//       ),
//     ),
//   )




//         ],
//       )
//         ],
//       ),
     
//     );
//     }

//   @override
//   void initState() {


//  WidgetsBinding.instance
//         .addPostFrameCallback((_) => loaded(context));

//     super.initState();
//   }

//   Future loaded(BuildContext context) async{
    

// await applicationManager.languagesService.getAllLanguages();

// final prefs = await SharedPreferences.getInstance();

// if(prefs.getString(SharedPreferencesConstant.currentLanguageId) == null)
// prefs.setString(SharedPreferencesConstant.currentLanguageId,"2");

// String currentLanguageId = prefs.getString(SharedPreferencesConstant.currentLanguageId);
// int dilId = int.parse(currentLanguageId);

// // final LocalStorage storage = new LocalStorage('lcwassist_language');
// //  if(storage.getItem('currentDilId') == null)
// //  {
// // Map<String, dynamic> m = new Map();
// // m['dilId'] = 1;
// // storage.setItem('currentDilId', m);
// //  }

// // Map<String, dynamic> m2 = new Map();
// // m2 = storage.getItem('currentDilId');

// await applicationManager.languagesService.setCurrentLanguage(dilId);


// await new Future.delayed(const Duration(seconds: 3 ));
// Navigator.pop(context);

// var route = new MaterialPageRoute(
//             builder: (BuildContext context) => LoginPage()
//           );

//    Navigator.of(context).push(route);
// }

//   Future dris() async {

//   }

// }





























import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/loginPage.dart';

import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:localstorage/localstorage.dart';

void main(){
  runApp(new MaterialApp(
    home:new SplashAssist(),
  ));
}

class SplashAssist extends StatefulWidget{

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<SplashAssist>{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      
      //backgroundColor:  LcwAssistColor.secondaryColor,
      
      body: 
      new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/splas.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: 
              Column(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Image.asset('assets/imglogolcwassist.png'),


 new Container(
    width: 120.0,
    height: 40.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(

      image: DecorationImage(
          image: AssetImage('assets/imglogolcwassist.png'),
          fit: BoxFit.fill
      ),
    ),
  )

        ],
      )
        ],
      ),
        
         /* add child content content here */
      ),
      
    );
    }

  @override
  void initState() {


 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));

    super.initState();
  }

  Future loaded(BuildContext context) async{
    

await applicationManager.languagesService.getAllLanguages();

final prefs = await SharedPreferences.getInstance();

if(prefs.getString(SharedPreferencesConstant.currentLanguageId) == null)
prefs.setString(SharedPreferencesConstant.currentLanguageId,"2");

String currentLanguageId = prefs.getString(SharedPreferencesConstant.currentLanguageId);
int dilId = int.parse(currentLanguageId);

// final LocalStorage storage = new LocalStorage('lcwassist_language');
//  if(storage.getItem('currentDilId') == null)
//  {
// Map<String, dynamic> m = new Map();
// m['dilId'] = 1;
// storage.setItem('currentDilId', m);
//  }

// Map<String, dynamic> m2 = new Map();
// m2 = storage.getItem('currentDilId');

await applicationManager.languagesService.setCurrentLanguage(dilId);


await new Future.delayed(const Duration(seconds: 3 ));

Navigator.pop(context);

var route = new MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()
          );

   Navigator.of(context).push(route);
}

  Future dris() async {

  }

}








