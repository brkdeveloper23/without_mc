import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';

import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';

import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';

import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';

import 'package:lcwassist/Core/GlobalWidget/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/Core/GlobalWidget/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';

import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';

import 'package:lcwassist/DataAccess/LanguageDTOs/MultiLangComboDTO.dart';

import 'package:lcwassist/DataAccess/LcwStoreDTOs/GetLatestAppVersionInfoResponseDTO.dart';

import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryRequestDTO.dart';

import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryResponseDTO.dart';

import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';

import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';

import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenService.dart';

import 'package:lcwassist/Style/LcwAssistColor.dart';

import 'package:lcwassist/Style/LcwAssistTextStyle.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:localstorage/localstorage.dart';
import 'package:flutter/services.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:package_info/package_info.dart';
//import 'package:flutter/rendering.dart';

// void main(){
// runApp(new MaterialApp(

// home:new LoginPage(),

// )



// );

// }


void main(){

runApp(LoginPage());
}

class LoginPage extends StatefulWidget{

@override

LoginPageState createState() => new LoginPageState();

}

class LoginPageState extends State<LoginPage> implements IsLcwAssistUIPage{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

LoginPageEntryRequestDTO loginRequest = new LoginPageEntryRequestDTO();

LoginPageEntryResponseDTO responseDTO;

String versionString = "";
PackageInfo packageInfo;

CurrentLangugeDTO currentLangugeDTO = new CurrentLangugeDTO();

List<MultiLangComboDTO> languagesForCombo = new List<MultiLangComboDTO> ();

MultiLangComboDTO selectedLanguages;

final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

final _formKey = GlobalKey<FormState>();

final controllerUserName = TextEditingController();

final controllerPassword = TextEditingController();


  String _platformVersion = 'Unknown';
  Permission permission;
// Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await SimplePermissions.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

if(Platform.isAndroid)
  checkPermission();
    
  }

  checkPermission() async {
    bool res = await SimplePermissions.checkPermission(Permission.RecordAudio);
    //print("permission is " + res.toString());
    if(res == false){
   await SimplePermissions.requestPermission(Permission.RecordAudio);
   }
   
  }



@override
void initState() {
super.initState();

if(Platform.isAndroid)
initPlatformState();

SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);


controllerUserName.text = "burak.bitkin";
controllerPassword.text = "Cmb150832";

loadMultiLangCombo();

WidgetsBinding.instance

.addPostFrameCallback((_) => loaded(context));

setState(() {});

}

Future<void> executeAfterBuild() async {

applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();


final prefs = await SharedPreferences.getInstance();

selectedLanguages = languagesForCombo.where((i)=>i.dilId == int.parse(prefs.getString(SharedPreferencesConstant.currentLanguageId))).first;

setState(() {});

}

Future<bool> checkToVersion() async{
  bool result = true;
final prefs = await SharedPreferences.getInstance();

String storeVersiyon = prefs.getString(SharedPreferencesConstant.currentLcwStoreVersion);

versionString = "D.V: " +packageInfo.version + " - S.V: " + storeVersiyon;

//versionString = packageInfo.packageName;

if(storeVersiyon != packageInfo.version)
{
  result = false;
}

return result;
}

Future loaded(BuildContext context) async{
   packageInfo = await PackageInfo.fromPlatform();
if(!await checkToVersion())
LcwAssistAlertDialogInfo(applicationManager.currentLanguage.getguncellemeUyarisi,applicationManager.currentLanguage.getmsg04,applicationManager.currentLanguage.gettamam,context,LcwAssistDialogType.error).show();


}

@override

Widget build(BuildContext context) {

executeAfterBuild();
 //debugPaintSizeEnabled=false;
return new Scaffold(

resizeToAvoidBottomPadding: false,

key: scaffoldState,

//appBar: new AppBar(title: new Text('Deneme')),

body: loginPageBody(),

//drawer: asa.leftSideMenuDiz('1', context),

);

}

LoginPageEntryRequestDTO fillToModel(){

this.loginRequest.setUserName = controllerUserName.text;

this.loginRequest.setPassword = controllerPassword.text;

return this.loginRequest;

}

Future showLoginPage() async{

if (!_formKey.currentState.validate())
return;

bool resultInternet = await applicationManager.utils.checkToInternet(context);
if(!resultInternet)
return;


LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);

await this.applicationManager.serviceManager.lcwStoreService.setCurrentServiceVersion(packageInfo.packageName);

if(! await checkToVersion())
{
setState(() {
Navigator.pop(context);
});

LcwAssistAlertDialogInfo(applicationManager.currentLanguage.getguncellemeUyarisi,applicationManager.currentLanguage.getmsg04,applicationManager.currentLanguage.gettamam,context,LcwAssistDialogType.error).show();
  return;
}

responseDTO = await applicationManager.serviceManager.loginService.loginEntryRequest(fillToModel());

//Dönüþ degerini kontrol et, duruma göre SnackBar ver.

if(responseDTO.authToken == '' || responseDTO.authToken == null) {

setState(() {
Navigator.pop(context);
});

//await LcwAssistAlertDialogInfo('Uyarý','Yanlýþ kullanýcý adý yda þifre.','Tamam',context).showAlert();

//LcwAssistSnackBarDialogInfo('Yanlýþ kullanýcý adý yada þifre.',scaffoldState,LcwAssistSnagitType.warning).snackbarShow();

await LcwAssistAlertDialogInfo(applicationManager.currentLanguage.gethata,applicationManager.currentLanguage.getmsg01,applicationManager.currentLanguage.gettamam,context,LcwAssistDialogType.error).show();

return;

}

if(await TokenService.checkAuthToken() != '')

await TokenService.deleteAuthToken();

await TokenService.saveAuthToken(responseDTO.authToken);

await applicationManager.serviceManager.loginService.saveCurrentUser(responseDTO);

await applicationManager.serviceManager.storeChooseService.saveCurrentStore(applicationManager.serviceManager.storeChooseService.setTumMagazalar(applicationManager.currentLanguage.gettumMagazalar));

setState(() {

Navigator.pop(context);

});

// var route = new MaterialPageRoute(

// builder: (BuildContext context) => HomePage()

// );

//Navigator.of(context).pushReplacement(route);

var route = new MaterialPageRoute(
            builder: (BuildContext context) => HomePage()
          );

   Navigator.of(context).pushReplacement(route);



}

Widget loginPageBody()

{

return

Container(child: Stack(

alignment: AlignmentDirectional.topCenter,

children: <Widget>[

Container(child: Column(children: <Widget>[

Expanded(flex: 2,child: Container(//color: LcwAssistColor.secondaryColor,

decoration: new BoxDecoration(

image: new DecorationImage(

image: new AssetImage("assets/login.jpg"),

fit: BoxFit.fill,

),

),

child: Row( mainAxisAlignment: MainAxisAlignment.center,

children: <Widget>[

Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

child: //Image.asset('assets/imglogolcwassist.png',fit: BoxFit.cover,),)

Container(

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

)

]),),),

Expanded(flex: 3,child:

Container(color: Colors.grey[200],

child: Row(

crossAxisAlignment: CrossAxisAlignment.end,

mainAxisAlignment: MainAxisAlignment.center ,

children: <Widget>[Column(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[Text('LC WAIKIKI',style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(40, 53, 147, 1.0),fontWeight: FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),Text(versionString),Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),)],)],),

)),

],

),),

Positioned(

// right: 40.0,

// left: 40.0,

//top: 180.0,//Bunlarý padding ile çözmek gerekir

//width: 300.0,//Bunlarý padding ile çözmek gerekir

//height: 350.0,//button altýna padding verdik

top: (MediaQuery.of(context).size.width)*0.50,

width: (MediaQuery.of(context).size.width)*0.90,

child: Card(

//color: Colors.transparent,

child: kullaniciGirisDesign(),

),

),

],

));

}

void loadMultiLangCombo(){

languagesForCombo.add(MultiLangComboDTO(dilId: 1,dilAdi: "🇹🇷  Türkçe"));

languagesForCombo.add(MultiLangComboDTO(dilId: 2,dilAdi: "🇬🇧  English"));

languagesForCombo.add(MultiLangComboDTO(dilId: 3,dilAdi: "🇸🇦  العربية"));

languagesForCombo.add(MultiLangComboDTO(dilId: 4,dilAdi: "🇷🇺  Pусский"));

}

Widget kullaniciGirisDesign() {

return Form(

key: _formKey,

child:

Column(

children: <Widget>[

Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),),

Text(applicationManager.currentLanguage.getkullaniciGirisi,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 20.0,color: Colors.grey[700],fontWeight: FontWeight.bold),),

Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),),

Padding(child:

TextFormField(

style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: Colors.grey[900],fontSize: 18.0),

//onSaved: (val) => loginRequest.setUserName = val,

validator: (value) {

if (value.isEmpty) {

return this.applicationManager.currentLanguage.getbosGecemezsiniz;

}

},

controller: controllerUserName,

decoration: InputDecoration(

labelStyle: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily),

// border: lineInputBorder(borderSide: BorderSide(color: Colors.green)),

suffixIcon: Icon(Icons.person,color: Color.fromRGBO(100, 128, 241, 1.0),),//,color: LcwAssistColor.secondaryColor,),

filled: false,

fillColor: Colors.white,

labelText: applicationManager.currentLanguage.getkullaniciAdi,

),

//obscureText: true,

),padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),),

Padding(child:

TextFormField(

style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: Colors.grey[900],fontSize: 18.0),

//onSaved: (val) => loginRequest.setPassword = val,

controller:controllerPassword,

obscureText: true,

decoration: InputDecoration(

labelStyle: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily),

suffixIcon: Icon(Icons.lock,color: Color.fromRGBO(255, 157, 115, 1.0),),

filled: false,

fillColor: Colors.white,

labelText: applicationManager.currentLanguage.getparola,

),

validator: (value) {

if (value.isEmpty) {

return this.applicationManager.currentLanguage.getbosGecemezsiniz;

}

},

),padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),),

Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),),

Padding(

padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

child:

MaterialButton(

height: 45.0,

minWidth: double.infinity,

color: Colors.green[400],

textColor: Colors.white,

child: new Text(applicationManager.currentLanguage.getgiris,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 20.0,color: Colors.white),),

onPressed: () => showLoginPage(),

splashColor: Colors.redAccent,

)

,),

Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),),

new DropdownButton<MultiLangComboDTO>(

hint: new Text("Dil Seçimi"),

value: selectedLanguages,

onChanged: (MultiLangComboDTO newValue) {

setState(() {

selectedLanguages = newValue;

changeLanguage(newValue.dilId);

});

},

items: languagesForCombo.map((MultiLangComboDTO user) {

return new DropdownMenuItem<MultiLangComboDTO>(

value: user,

child: new Text(

user.dilAdi,

style: new TextStyle(color: Colors.black),

),

);

}).toList(),

),

],

),

);

}

Future<bool> checkToInternet() async{

bool result = await applicationManager.utils.checkToInternet(context);

return result;

}

changeLanguage(int dilId) async{

await applicationManager.serviceManager.languagesService.setCurrentLanguage(dilId);

applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();

setState(() {

});

}

}