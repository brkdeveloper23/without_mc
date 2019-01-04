
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryResponseDTO.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/SaveFeedbackRequestDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/loginPage.dart';
import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/ChartPage.dart';
import 'package:lcwassist/LcwAssistUI/CapacityOperations/CapacityAnalysisPage.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomeFeedBack.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/speech_deneme.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformanceDetailMetric.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricsOperations.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansQueryPage.dart';
import 'package:lcwassist/LcwAssistUI/SettingsPages/LcwAssistTema.dart';
import 'package:lcwassist/LcwAssistUI/StoreReportOperations/StoreCardPage.dart';
import 'dart:convert';
import 'package:lcwassist/LcwAssistUI/StoreReportOperations/StoreChoosePage.dart';
import 'package:lcwassist/LcwAssistUI/StoreReportOperations/StoreReportPage.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/LoginPageService.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';


class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {



//applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();

  // final drawerItems = [
  //   new DrawerItem("AnaSayfa", Icons.home),
  //   new DrawerItem("Kapasite", Icons.table_chart),//domain
  //   new DrawerItem("Satış", Icons.payment),
  //   new DrawerItem("Mağaza Karne", Icons.store),
  //   new DrawerItem("Mağaza Seç", Icons.location_on),
  //   new DrawerItem("Ayarlar", Icons.settings)
  // ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}


class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
StoreChooseService storeChooseService = new StoreChooseService();
StoreChooseResponeDTO storesResponse = new StoreChooseResponeDTO();
String selectedStoreName = "";
StoreChooseListViewDTO storeResponse;
Uint8List base64;
String _base64;

final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
LoginPageService loginPageService = new LoginPageService();
LoginPageEntryResponseDTO currentUserResult;

  // final drawerItems = [
  //   new DrawerItem("AnaSayfa", Icons.home),
  //   new DrawerItem("Kapasite", Icons.table_chart),//domain
  //   new DrawerItem("Satış", Icons.payment),
  //   new DrawerItem("Mağaza Karne", Icons.store),
  //   new DrawerItem("Mağaza Seç", Icons.location_on),
  //   new DrawerItem("Ayarlar", Icons.settings)
  // ];

  var drawerItems;

_onLayoutDone(_) {
       //your logic here
//Scaffold.of(context).openDrawer();
//Sayfa buil edilmeden önce

    }

@override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    scaffoldState.currentState.openDrawer();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
super.initState();

SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loadPage(context));


currentStore().then((result) {
            // If we need to rebuild the widget with the resulting data,
            // make sure to use `setState` 
            setState(() {
                selectedStoreName = result;
                loadCurrentUser();
            });
        });
       
        setState(() {
                  
                });
  }

   @override
  void dispose() {
         super.dispose();
  }

    loadPage(BuildContext context) async
    {

storeResponse = await storeChooseService.getCurrentStore();
applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();

//scaffoldState.currentState.openDrawer();
  }




 void loadCurrentUser() async{
currentUserResult = await loginPageService.getCurrentUser();
 }

Future<void> executeAfterBuild() async {



drawerItems = [
    new DrawerItem(applicationManager.currentLanguage.getanasayfa, Icons.home),
    new DrawerItem(applicationManager.currentLanguage.getkapasite, Icons.table_chart),//domain
    new DrawerItem(applicationManager.currentLanguage.getkapasitePerformans, Icons.network_check),//Icons.equalizer),
    new DrawerItem(applicationManager.currentLanguage.getsatis, Icons.payment),
    new DrawerItem(applicationManager.currentLanguage.getmagazaKarne, Icons.store),
    new DrawerItem(applicationManager.currentLanguage.getmagazaSec, Icons.location_on),
    new DrawerItem(applicationManager.currentLanguage.getkumulatifSatis, Icons.multiline_chart),
    new DrawerItem(applicationManager.currentLanguage.getbirFeedBackBirak, Icons.chat),



    new DrawerItem(applicationManager.currentLanguage.getayarlar, Icons.settings)
    
  ];

setState(() {});

}
 
  _getDrawerItemWidget(int pos) {

// setState(() {
//   currentStore();
// });
//HomeFeedBack
    switch (pos) {
      case 0:
        return new ChartPage();//HomeFeedBack();
      case 1:
        return new CapacityAnalysisPage();
      case 2:
        return new ProductPerformansQueryPage();
      case 3:
        return new StoreReportPage();
        case 4:
        return new StoreChoosePage(storesResponse: storesResponse);
        case 5:
        return new ChartPage();
        case 6:
        return new ProductPerformansMetricFeedBackDialog(feedbackRequest:feedbackRequest());//LcvAssistTema();  ProductPerformansMetricFeedBackDialogState
        case 7:
        return new LcvAssistTema();//SpeechSayfa();
      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {

if(index == 3){
  if(storeResponse.depoRef == 0){
  LcwAssistAlertDialogInfo(applicationManager.currentLanguage.getuyari,applicationManager.currentLanguage.getlutfenBirMagazaSecin,applicationManager.currentLanguage.gettamam,context,LcwAssistDialogType.error).show();
return;
}
}

    setState(() => _selectedDrawerIndex = index);




    Navigator.of(context).pop(); // close the drawer   LcvAssistTema
  }


  @override
  Widget build(BuildContext context) {
    executeAfterBuild();
    
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        GestureDetector(
  onTap: (){_onSelectItem(i);},
child:
Container(
      decoration:  BoxDecoration(
         border:  Border(
      left:  BorderSide(width: 6.0, color: i == _selectedDrawerIndex ? LcwAssistColor.selectedColor : Colors.transparent),
    )),
    child: 


Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
  Padding(padding: EdgeInsets.fromLTRB(10, 10, 5, 10),child: Icon(d.icon,color: Colors.white,size: 26.0,),),
  Padding(padding: EdgeInsets.fromLTRB(5, 10, 5, 10),child: new Text(d.title+'',style: TextStyle(color: Colors.white,fontSize: 18.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),),
],)
)
  // new ListTile(
  //         leading: new Icon(d.icon,color: Colors.white,),
  //         title: new Text(d.title,style: TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
  //         onTap: () => _onSelectItem(i),
  //       )

      ));
    }

    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(drawerItems[_selectedDrawerIndex].title,
        style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
        
      ),
      
      key: scaffoldState,
      drawer: new Drawer(
        
        child: Container(
decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/drawerSplash.jpg"), 
            fit: BoxFit.cover,
          ),
        ),

          child:
         new Column(
          children: <Widget>[
            //Header
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
              alignment: Alignment.centerLeft,
              child: Column(       
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

ClipOval(
  child:
  //  Image.asset(
  //    //"assets/defaultMalePP.png",
  //   fit: BoxFit.cover,
  //   width: 75.0,
  //   height: 75.0,
  // )

 Image.memory(
   base64Decode(currentUserResult.resimBase64),
    fit: BoxFit.cover,
    width: 75.0,
    height: 75.0,
  )


),
 
Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: new Text(currentUserResult.firstName + ' ' + currentUserResult.lastName,style: TextStyle(fontSize: 15.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),),
Container(padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),child: new Text(applicationManager.currentLanguage.gethosgeldiniz,style: TextStyle(fontSize: 15.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),),

GestureDetector(
  onTap: (){_openStoreCard();},
     child: 
     
     Row(  children: <Widget>[
  Padding(padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),
  child: Text(applicationManager.currentLanguage.getmagaza+ ": " +  (selectedStoreName.length > 17 ? selectedStoreName.substring(0,16)+'...' : selectedStoreName) ,style: TextStyle(color: Colors.white,fontSize: 15.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),),
  Icon(Icons.touch_app,color: Colors.white,size: 18.0),
 ],)
     //) applicationManager.currentLanguage.getmagaza+ ": " + 

   ),
            ],),
            decoration: new BoxDecoration(
//  color: LcwAssistColor.primaryColor
) ,),

            //Menu Listesi
            //Expanded(child: new Column(children: drawerOptions),),
Expanded(child: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.max,children: drawerOptions,),),),
          //Container(child: Expanded(child: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.max,children: drawerOptions,),),),),

            //Logaut Menu
            //Eskiden Expanded//
            Container(
              // color: Colors.green,
              // alignment: Alignment.bottomCenter,
              child: 
            Container(
              alignment: Alignment.bottomRight,
             // color: Colors.green,
              child: 
            Row(
              mainAxisSize: MainAxisSize.max,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[


              Expanded(
                //color:Colors.yellow
                child: 
              Container(
                //alignment: Alignment.centerRight,
                //color:Colors.blue[900],

decoration:  BoxDecoration(
  color:LcwAssistColor.drawerSubMenuColor,
         border:  Border(
            top:  BorderSide(width: 2.0, color:  Colors.white),

    )),



              //color:Color.fromRGBO(0, 88, 175, 1.0),

               child: 
              
              FlatButton(onPressed: (){logOut();},child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app,color: Colors.white,),
                  Text(applicationManager.currentLanguage.getcikis,style: TextStyle(color: Colors.white,fontSize: 15.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)
                ],
              ),)
               
              ,)

              ,)
  
              //Text('dataa',style: TextStyle(color: Colors.white),)
            ],),),
            )

            //Align(alignment: Alignment.bottomCenter,child: Text('data',style: TextStyle(color: Colors.white),),)
          ], 
        ),)
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }   


Future currentStore() async{

StoreChooseListViewDTO stores;

stores = await storeChooseService.getCurrentStore();

selectedStoreName = stores.storeName;

return selectedStoreName;
    }

Future getStoretoreList() async{
StoreChooseService storeChooseService = new StoreChooseService();

storesResponse = await storeChooseService.storeListRequest();
return storesResponse;
}

void _openStoreCard() async{

if(storeResponse.depoRef == 0){
 await LcwAssistAlertDialogInfo(applicationManager.currentLanguage.getuyari,applicationManager.currentLanguage.getlutfenBirMagazaSecin,applicationManager.currentLanguage.gettamam,context,LcwAssistDialogType.error).show();
return;
}

  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new StoreCardPage();
      },
    fullscreenDialog: true
  ));
}

void logOut(){

    var route = new MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()
          );

    Navigator.of(context).push(route);

}

SaveFeedbackRequestDTO feedbackRequest(){

  SaveFeedbackRequestDTO request = new SaveFeedbackRequestDTO();
request.setUserHRRef = 1;
request.setUserName =currentUserResult.firstName+" "+currentUserResult.lastName; 
request.setFeedBackType = 2;
request.setBarcode = null;
request.setStoreName = storeResponse.storeName;
request.setStoreCode = storeResponse.storeCode;

return request;
}


}
