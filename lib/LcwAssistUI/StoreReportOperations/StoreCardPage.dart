
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'dart:async';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
void main(){
  runApp(new MaterialApp(
    home:new StoreCardPage(),
  ));
}


class StoreCardPage extends StatefulWidget{

  @override
  StoreCardPageState createState() => new StoreCardPageState();
}

class StoreCardPageState extends State<StoreCardPage>  implements IsLcwAssistUIPage{

  LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

StoreChooseListViewDTO selectedStore;
String selectedStoreName="";
bool sayfaYuklendiMi = false;

@override
void initState() {
super.initState();

SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);

  WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));


currentStore().then((result) {
            setState(() {
                selectedStore = result;
            });
        });
   
  }

    Future loaded(BuildContext context) async{
      applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
       setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});


sayfaYuklendiMi = true;

 setState(() {
  Navigator.pop(context);
 });
}

Future<void> executeAfterBuild() async {
  
}

  @override
  Widget build(BuildContext context) {

// setState(() {
//    currentStore();
// });

    return new Scaffold(
      resizeToAvoidBottomPadding: false, 
       appBar: AppBar(title: Text(applicationManager.currentLanguage.getmagazaKimlik),),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      key: scaffoldState,
      backgroundColor: LcwAssistColor.backGroundColor,
      body: sayfaYuklendiMi == true ? ListView(children: <Widget>[storeCardBody()],) : Container(child: Text(''),)
    );
    }

Widget storeCardBody(){
  return Container(child: Column(children: <Widget>[

Container(child: 
Card(
      child: Container(
        
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(54,163,247, 1.0)),
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getadi,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 18.0,fontWeight: FontWeight.bold),),)
        
        ],),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.storeName,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 18.0,),)),
        ],
      ),),
    )
,),

Container(child: 
Row(children: <Widget>[
Expanded(flex: 1,child: Card(
      child: 
      Container(
        decoration:  BoxDecoration(
    border:  Border(
     
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(239,138,14, 1.0)),
      
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getkodu,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.storeCode,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),)
      ,
    )),
Expanded(flex: 1,child: Card(

      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(0,116,198, 1.0)),
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getpersonelSayisi,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.personelSayisi.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )),

],)
,),

Container(child: 
Row(children: <Widget>[
Expanded(flex: 1,child: Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(100,105,188, 1.0)),
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getmusteriProfili,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.musteriProfil.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )),
Expanded(flex: 1,child: Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(54,163,247, 1.0)),
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getmetrekare,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.toplamM2.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )),

],)
,),

Container(child: 
Row(children: <Widget>[
Expanded(flex: 1,child: Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(38,137,116, 1.0)),
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.gettipi,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.depoYerlesimTip,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )),
Expanded(flex: 1,child: Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(0,162,181, 1.0)),
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getsezon,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.isOutlet == 1 ? applicationManager.currentLanguage.getoutlet : applicationManager.currentLanguage.getinlet,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )),

],)
,),

Container(child: 
Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:  Color.fromRGBO(196,66,88, 1.0)),
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getoperasyonelBolge,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),)
        
        ],),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.operasyonelBolgeTanim,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )
,),

Container(child: 
Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color: Color.fromRGBO(0,116,198, 1.0)),
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getmagazaBirinciMudur,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),)
        
        ],),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.magazaMudur1,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )
,),

Container(child: 
Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      left:  BorderSide(width: 4.0, color:Color.fromRGBO(239,138,14, 1.0)),
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text(applicationManager.currentLanguage.getmagazaIkinciMudur,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),)
        
        ],),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.magazaMudur2,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )
,),
  ],),);
}

Future currentStore() async{

StoreChooseListViewDTO stores;

stores = await applicationManager.serviceManager.storeChooseService.getCurrentStore();

selectedStoreName = stores.storeName;

return stores;
    }

}






