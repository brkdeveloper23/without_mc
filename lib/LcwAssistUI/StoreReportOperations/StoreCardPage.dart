
import 'package:flutter/material.dart';
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

class StoreCardPageState extends State<StoreCardPage>{

  LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

Stores selectedStore;
String selectedStoreName="";


@override
void initState() {
super.initState();

currentStore().then((result) {
            setState(() {
                selectedStore = result;
            });
        });
   
  }

  @override
  Widget build(BuildContext context) {

// setState(() {
//    currentStore();
// });

    return new Scaffold(
      resizeToAvoidBottomPadding: false, 
       appBar: AppBar(title: Text('Mağaza Bilgisi'),),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      key: scaffoldState,
      backgroundColor: LcwAssistColor.backGroundColor,
      body: ListView(children: <Widget>[storeCardBody()],),
    );
    }

Widget storeCardBody(){
  return Container(child: Column(children: <Widget>[

Container(child: 
Card(
      child: Container(
        
        decoration:  BoxDecoration(
    border:  Border(
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Adı',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 18.0,fontWeight: FontWeight.bold),),)
        
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
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Kodu',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.storeCode,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),)
      ,
    )),
Expanded(flex: 1,child: Card(

      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Personel Sayısı',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
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
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    )),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Müşteri Profili',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.musteriProfil.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )),
Expanded(flex: 1,child: Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('M2',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
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
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Tipi',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.depoYerlesimTip,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )),
Expanded(flex: 1,child: Card(
      child: Container(
        decoration:  BoxDecoration(
    border:  Border(
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
   
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Sezon',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),),
        
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.isOutlet == 1 ? "Outlet" : "Inlet",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
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
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Operasyonel Bölge',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),)
        
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
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Mağaza 1.Müdür',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),)
        
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
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    ))
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        //Icon(Icons.store,color: Colors.grey[700]),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text('Mağaza 2. Müdür',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,fontWeight: FontWeight.bold),),)
        
        ],),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),child: Text(selectedStore.magazaMudur2,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 16.0,),)),
        ],
      ),),
    )
,),
  ],),);
}

Future currentStore() async{

Stores stores;

stores = await applicationManager.serviceManager.storeChooseService.getCurrentStore();

selectedStoreName = stores.storeName;

return stores;
    }

}






