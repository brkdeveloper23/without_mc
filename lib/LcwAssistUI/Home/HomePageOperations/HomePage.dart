
import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';

import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/DataAccess/LoginPageDTOs/LoginPageEntryResponseDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/loginPage.dart';
import 'package:lcwassist/LcwAssistUI/AuthenticationUI/UI/ChartPage.dart';
import 'package:lcwassist/LcwAssistUI/CapacityOperations/CapacityAnalysisPage.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomeFeedBack.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricsOperations.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansQueryPage.dart';
import 'package:lcwassist/LcwAssistUI/SettingsPages/LcwAssistTema.dart';
import 'package:lcwassist/LcwAssistUI/StoreReportOperations/StoreCardPage.dart';

import 'package:lcwassist/LcwAssistUI/StoreReportOperations/StoreChoosePage.dart';
import 'package:lcwassist/LcwAssistUI/StoreReportOperations/StoreReportPage.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/LoginPageOperations/LoginPageService.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';

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
Stores storeResponse;


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

  @override
  void initState() {
super.initState();
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
  }

    loadPage(BuildContext context) async
    
    {
//await applicationManager.onReadyLanguage;

storeResponse = await storeChooseService.getCurrentStore();
applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
  }




 void loadCurrentUser() async{
currentUserResult = await loginPageService.getCurrentUser();
 }

Future<void> executeAfterBuild() async {



drawerItems = [
    new DrawerItem(applicationManager.currentLanguage.getanasayfa, Icons.home),
    new DrawerItem(applicationManager.currentLanguage.getkapasite, Icons.table_chart),//domain
    new DrawerItem(applicationManager.currentLanguage.getsatis, Icons.payment),
    new DrawerItem(applicationManager.currentLanguage.getmagazaKarne, Icons.store),
    new DrawerItem(applicationManager.currentLanguage.getmagazaSec, Icons.location_on),
    new DrawerItem(applicationManager.currentLanguage.getkumulatifSatis, Icons.multiline_chart),
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
        return new HomeFeedBack();
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
        return new LcvAssistTema();

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
Container(

 // padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0,10.0),
      decoration:  BoxDecoration(
         border:  Border(
      //top:  BorderSide(width: 0.0, color:  LcwAssistColor.secondaryColor),

      left:  BorderSide(width: 6.0, color: i == _selectedDrawerIndex ? LcwAssistColor.selectedColor : Colors.transparent),

      //left: i == _selectedDrawerIndex ? BorderSide(width: 6.0, color: i == _selectedDrawerIndex ? LcwAssistColor.selectedColor : LcwAssistColor.secondaryColor) : BorderSide(width: 6.0,color: Colors.transparent),
      //right:  BorderSide(width: 0.0, color:  LcwAssistColor.secondaryColor),
      //bottom:  BorderSide(width: 0.0, color:  LcwAssistColor.secondaryColor)//Color.fromRGBO(182,0,62, 1.0))
    )),
    child: 
  new ListTile(
          leading: new Icon(d.icon,color: Colors.white,),
          title: new Text(d.title,style: TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
          onTap: () => _onSelectItem(i),
        )

      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(drawerItems[_selectedDrawerIndex].title,
        style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
      ),
      key: scaffoldState,
      drawer: new Drawer(
        child: Container(
          color:LcwAssistColor.secondaryColor,//.withOpacity(0.9),
          
// decoration: new BoxDecoration(
//           image: new DecorationImage(
//             image: new AssetImage("assets/drawerSplash.png"),
//             fit: BoxFit.cover,
//           ),
//         ),







          child:
         new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
              alignment: Alignment.centerLeft,
              child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

ClipOval(
  child: Image.asset(
    "assets/defaultMalePP.png",
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
  child: Text(applicationManager.currentLanguage.getmagaza+ ": " + selectedStoreName ,style: TextStyle(color: Colors.white,fontSize: 15.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),),
  Icon(Icons.touch_app,color: Colors.white,size: 18.0),
 ],)
   ),
            ],),decoration: new BoxDecoration(
//  color: LcwAssistColor.primaryColor
) ,),

            new Column(children: drawerOptions),
            
            Expanded(
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
  color:Color.fromRGBO(0, 88, 175, 1.0),
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
            ],),),)

            //Align(alignment: Alignment.bottomCenter,child: Text('data',style: TextStyle(color: Colors.white),),)
          ], 
        ),)
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }   

StoreChoosePage asas() {
//   setState(() {
// LcwAssistLoading.showAlert(context);
// });
getStoretoreList();
return new StoreChoosePage(storesResponse: storesResponse);
//  setState(() {
//   Navigator.pop(context);
//  });

}

Future currentStore() async{

Stores stores;

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




}
