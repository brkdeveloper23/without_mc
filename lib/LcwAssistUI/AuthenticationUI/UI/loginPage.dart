import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/MultiLangComboDTO.dart';
import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryRequestDTO.dart';
import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryResponseDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenOperations/TokenService.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localstorage/localstorage.dart';

void main(){

  runApp(new MaterialApp(
    home:new LoginPage(),
  )
  );
}

class LoginPage extends StatefulWidget{

  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> implements IsLcwAssistUIPage{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
LoginPageEntryRequestDTO loginRequest  = new LoginPageEntryRequestDTO();
LoginPageEntryResponseDTO responseDTO;
CurrentLangugeDTO currentLangugeDTO = new CurrentLangugeDTO();

List<MultiLangComboDTO> languagesForCombo = new List<MultiLangComboDTO> ();
MultiLangComboDTO selectedLanguages;


final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();



final _formKey = GlobalKey<FormState>();
final controllerUserName = TextEditingController();
final controllerPassword = TextEditingController();


@override
void initState() {
   super.initState();

    controllerUserName.text = "burak.bitkin";
    controllerPassword.text = "Cmb150831";
    
    loadMultiLangCombo();

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
setState(() {});

   
  }

Future<void> executeAfterBuild() async {

//await applicationManager.onReadyLanguage;
applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();

final prefs = await SharedPreferences.getInstance();

selectedLanguages = languagesForCombo.where((i)=>i.dilId == int.parse(prefs.getString(SharedPreferencesConstant.currentLanguageId))).first;

setState(() {});
}

loaded(BuildContext context) {

}

@override
Widget build(BuildContext context) {

  executeAfterBuild();
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

String asas = "";
asas = applicationManager.currentLanguage.getkullaniciGirisi;


if (!_formKey.currentState.validate())
return;

 bool resultInternet = await applicationManager.utils.checkToInternet(context);
 if(!resultInternet)
 return;

  setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

 await new Future.delayed(const Duration(seconds: 1 ));

 responseDTO = await applicationManager.serviceManager.loginService.loginEntryRequest(fillToModel());

 //Dönüş degerini kontrol et, duruma göre SnackBar ver.
 if(responseDTO.authToken == '' || responseDTO.authToken == null) {

 setState(() {
  Navigator.pop(context);
 });

//await LcwAssistAlertDialogInfo('Uyarı','Yanlış kullanıcı adı yda şifre.','Tamam',context).showAlert();
//LcwAssistSnackBarDialogInfo('Yanlış kullanıcı adı yada şifre.',scaffoldState,LcwAssistSnagitType.warning).snackbarShow();
  LcwAssistAlertDialogInfo(applicationManager.currentLanguage.gethata,applicationManager.currentLanguage.getmsg01,applicationManager.currentLanguage.gettamam,context,LcwAssistDialogType.error).show();


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
  var route = new MaterialPageRoute(
              builder: (BuildContext context) => HomePage()
            );
     Navigator.of(context).push(route);

}

Widget  loginPageBody()
{
  return 
  
  Container(child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
         
          Container(child: Column(children: <Widget>[
          Expanded(flex: 2,child: Container(//color: LcwAssistColor.secondaryColor,
decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/splas.png"),
            fit: BoxFit.cover,
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
          Expanded(flex: 4,child: 
          Container(color: Color.fromRGBO(250, 250, 250, 1.0),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[Column(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[Text('LC WAIKIKI',style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(40, 53, 147, 1.0),fontWeight: FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),Text('Versiyon : 2.0.0'),Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),)],)],),
          )),
          
        ],
      
      ),),
          Positioned(
            // right: 40.0,
            // left: 40.0,
            //top: 180.0,//Bunları padding ile çözmek gerekir
            //width: 300.0,//Bunları padding ile çözmek gerekir
            //height: 350.0,//button altına padding verdik

       top: (MediaQuery.of(context).size.width)*0.45,
      width: (MediaQuery.of(context).size.width)*0.90,

            child: Card(
              color: Colors.white,
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
      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),),
      Text(applicationManager.currentLanguage.getkullaniciGirisi,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 20.0,color: Colors.grey[700],fontWeight: FontWeight.bold),),
      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),),
      Padding(child: 
      TextFormField(
        style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: Colors.grey[900],fontSize: 18.0),
      //onSaved: (val) => loginRequest.setUserName = val,
      validator: (value) {
              if (value.isEmpty) {
                return 'Boş Geçemezsiniz.';
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
                return 'Boş Geçemezsiniz.';
              }
            },

),padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),),
     
      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),),

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


Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),),

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

 
  await applicationManager.languagesService.setCurrentLanguage(dilId); 
  applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();


  setState(() {
    });
}

}

