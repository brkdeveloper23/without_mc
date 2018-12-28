import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/UcluCardTextDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
void main(){
  runApp(new MaterialApp(
    home:new ProductPerformanceDetailMetric(),
  ));
}
class ProductPerformanceDetailMetric extends StatefulWidget {

final ProductMetricsResponse productMetricsResponse;
final LcwAssistApplicationManager applicationManager;
final ProductPerformansDetailType productPerformansDetailType;
ProductPerformanceDetailMetric({Key key, @required this.productMetricsResponse,@required this.applicationManager,@required this.productPerformansDetailType}) : super(key: key);


  @override
  ProductPerformanceDetailMetricState createState() => new ProductPerformanceDetailMetricState(productMetricsResponse: productMetricsResponse,applicationManager:applicationManager,productPerformansDetailType:productPerformansDetailType);
}
class ProductPerformanceDetailMetricState extends State<ProductPerformanceDetailMetric> with TickerProviderStateMixin implements IsLcwAssistUIPage{

final ProductMetricsResponse productMetricsResponse;
final ProductPerformansDetailType productPerformansDetailType;
  ProductPerformanceDetailMetricState({Key key, @required this.productMetricsResponse,@required this.applicationManager,@required this.productPerformansDetailType});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();


bool currentPageStyle;

Stores storesResponse = new Stores();
bool sayfaYuklendiMi = false;

@override
void initState() {
    super.initState();
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
  
sayfaYuklendiMi = true;

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
        setState(() {
                  
                });
  }


  Future loaded(BuildContext context) async{
    sayfaYuklendiMi = true;
}

Future<void> executeAfterBuild() async {

}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //key: scaffoldState,
      // appBar: AppBar(title: Text('data'),//Text(applicationManager.currentLanguage.geturunPerformansAnaliz),
      // actions: <Widget>[

      // ],),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      appBar: new AppBar(
        title:  sayfaYuklendiMi == true ? Text(applicationManager.currentLanguage.getdetaylar) :  Text(''),
     
      ),
      backgroundColor: LcwAssistColor.backGroundColor,
      body: storeReportPageBody()//sayfaYuklendiMi == true ? (currentPageStyle == true ? storeReportPageBody() : ekranYerlesim()) : Container(child: Text(''),),//
    );
    }


Widget storeReportPageBody(){
return
SingleChildScrollView(
                child:
Column(
     mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Card(child: 
    Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),child: 
Column(children:gridRows()
)  
    )
    )
    ],));
}


Widget storeReportPageBody2(){
return
new Column(
  children: <Widget>[
    Card(child:
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:
    Table(
      //defaultVerticalAlignment: TableCellVerticalAlignment.bottom, 
      children:
    [
//Baslik
TableRow(
  children: [

  TableCell(
  child: 
Container(color: Color.fromRGBO(244,242,248, 1.0),child: Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
  Text('Beden'),  
],),)
,),
  TableCell(child: Text('Küm.Satış Tutar'),),
  TableCell(child: Text('Küm.Satış Adet'),),
  TableCell(child: Text('? STR'),),
  TableCell(child: Text('Merkez Depo Stok Adet'),),
]),

TableRow(
children: [
TableCell(child: 
Container(alignment: Alignment.bottomCenter,padding: EdgeInsets.fromLTRB(5, 5, 5, 5),decoration:  BoxDecoration(
    border:  Border(
       bottom:  BorderSide(width: 1.0, color:  Color.fromRGBO(54,163,247, 1.0)),
    )),)
),
TableCell(child: 
Container(alignment: Alignment.bottomCenter,padding: EdgeInsets.fromLTRB(5, 5, 5, 5),decoration:  BoxDecoration(
    border:  Border(
       bottom:  BorderSide(width: 1.0, color:  Color.fromRGBO(54,163,247, 1.0)),
    )),)
),
TableCell(child: 
Container(alignment: Alignment.bottomCenter,padding: EdgeInsets.fromLTRB(5, 5, 5, 5),decoration:  BoxDecoration(
    border:  Border(
       bottom:  BorderSide(width: 1.0, color:  Color.fromRGBO(54,163,247, 1.0)),
    )),)
),
TableCell(child: 
Container(alignment: Alignment.bottomCenter,padding: EdgeInsets.fromLTRB(5, 5, 5, 5),decoration:  BoxDecoration(
    border:  Border(
       bottom:  BorderSide(width: 1.0, color:  Color.fromRGBO(54,163,247, 1.0)),
    )),)
),
TableCell(child: 
Container(alignment: Alignment.bottomCenter,padding: EdgeInsets.fromLTRB(5, 5, 5, 5),decoration:  BoxDecoration(
    border:  Border(
       bottom:  BorderSide(width: 1.0, color:  Color.fromRGBO(54,163,247, 1.0)),
    )),)
),

]),

TableRow(
children: [
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),

]),

TableRow(
children: [
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),
  TableCell(child: Row(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0,10, 0, 0),child: Text('wer'),)],),),

]),

    ]

    ,),)

    ,)
  ]);

    }


List<Widget> gridRows(){

List<String> kolonlar = productPerformansDetailType ==ProductPerformansDetailType.salesDetail ? 
[
  this.applicationManager.currentLanguage.getbeden,
  this.applicationManager.currentLanguage.getkumulatifSatisTutar,
  this.applicationManager.currentLanguage.getkumulatifSatisAdet,
  this.applicationManager.currentLanguage.getkumulatifSevkAdet,
  this.applicationManager.currentLanguage.getstr,
  this.applicationManager.currentLanguage.getmerkezDepoStok,
  ]
 : 
[
  this.applicationManager.currentLanguage.getbeden,
  this.applicationManager.currentLanguage.getreyonStokAdet,
  this.applicationManager.currentLanguage.getdepoStokAdet,
  this.applicationManager.currentLanguage.getyolStokAdet,
  this.applicationManager.currentLanguage.getonayliOnyasizRezerveAdet,
  this.applicationManager.currentLanguage.getson7gunSatisAdet,
];



List<Widget> rows = [];

//HEADER
rows.add(
    Container(
  padding: EdgeInsets.all(5.0),
  color: Color.fromRGBO(232,243,255,1.0)//(244,242,248, 1.0)
  ,child:
  Row(
      children: <Widget>[
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[0],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[1],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[2],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[3],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[4],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[5],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,)
    ])),
  
);
//productMetricsResponse
if(productPerformansDetailType == ProductPerformansDetailType.salesDetail){
//for (var i = 0; i < 10; i++) {
  int count = 0;
  for (var i in  productMetricsResponse.satisMetriclerDetay) {
  rows.add(
  Container(
  padding: EdgeInsets.all(5.0),
  color: count % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(240,249,255,1.0)//Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.beden.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.kumulatifSatisTutar.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.kumulatifSatisAdet.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.kumulatifSevkAdet.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.sTR.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.merkezDepoStokAdet.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,)
    ]))

  );
count++;
}
}else if(productPerformansDetailType == ProductPerformansDetailType.stockDetail){

int count = 0;
for (var i in  productMetricsResponse.stokMetricDetay) {
  rows.add(

  Container(
  padding: EdgeInsets.all(5.0),
  color: count % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(240,249,255,1.0)//Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.beden.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonStok.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.depoStok.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.yolStok.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.onayliOnaysizRezerve,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.son7GunSatis.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,)
    ]))

  );
  count++;
}


}
return rows;
}

}