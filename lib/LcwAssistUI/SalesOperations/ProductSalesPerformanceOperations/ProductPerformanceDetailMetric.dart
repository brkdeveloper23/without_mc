import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
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
ProductPerformanceDetailMetric({Key key, @required this.productMetricsResponse}) : super(key: key);


  @override
  ProductPerformanceDetailMetricState createState() => new ProductPerformanceDetailMetricState(productMetricsResponse: productMetricsResponse);
}
class ProductPerformanceDetailMetricState extends State<ProductPerformanceDetailMetric> with TickerProviderStateMixin implements IsLcwAssistUIPage{

final ProductMetricsResponse productMetricsResponse;
  ProductPerformanceDetailMetricState({Key key, @required this.productMetricsResponse});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();


bool currentPageStyle;

Stores storesResponse = new Stores();
bool sayfaYuklendiMi = false;

@override
void initState() {
    super.initState();
sayfaYuklendiMi = false;

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
  }


  Future loaded(BuildContext context) async{

    currentPageStyle = true;

    applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
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
// DataTable(
//   columns: <DataColumn>[
//     DataColumn(
//       label: Text('Beden'),
//       numeric: false,
//       onSort: (i, b){},
//       tooltip: ""
//       ),
//       DataColumn(
//       label: Text('Küm.Satış Tutar'),
//       numeric: false,
//       onSort: (i, b){},
//       tooltip: ""
//       ),
//       DataColumn(
//       label: Text('Küm.Satış Adet'),
//       numeric: false,
//       onSort: (i, b){},
//       tooltip: ""
//       ),
//       DataColumn(
//       label: Text('? STR'),
//       numeric: false,
//       onSort: (i, b){},
//       tooltip: ""
//       ),
//       DataColumn(
//       label: Text('Merkez Depo Stok Adet'),
//       numeric: false,
//       onSort: (i, b){},
//       tooltip: ""
//       ),
//   ],
//   rows: <DataRow>[
//     DataRow(
//       cells: <DataCell>[
//         DataCell(Text('')),
//         DataCell(Text('')),
//         DataCell(Text('')),
//         DataCell(Text('')),
//         DataCell(Text(''))
//       ]
//     ),
//   ],
// )
//     )


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
        Text('Beden',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Küm.Satış Tutar',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Küm.Satış Adet',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Küm.Sevk Adet',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('? STR',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Merkez Depo Stok Adet',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,)
    ])),
  
);

for (var i = 0; i < 10; i++) {
  rows.add(

  Container(
  padding: EdgeInsets.all(5.0),
  color: i % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Beden',style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Küm.Satış Tutar',style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Küm.Satış Tutar',style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Küm.Satış Tutar',style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('? STR',style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text('Merkez Depo Stok Adet',style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)
      ,)
    ]))

  );
}
return rows;
}

}