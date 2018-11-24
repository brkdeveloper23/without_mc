import 'package:flutter/material.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/ScatterPlotComboLineChart.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/StackedAreaLineChart.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';

import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';


void main(){
  runApp(new MaterialApp(
    home:new ChartPage(),
  ));
}

class ChartPage extends StatefulWidget{

  @override
  ChartPageState createState() => new ChartPageState();
}

class ChartPageState extends State<ChartPage>{

StoreChooseService storeChooseService = new StoreChooseService();
String selectedStoreName = "";

  @override
  void initState() {
super.initState();

// currentStore();
// setState(() {
// });

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loadPage(context));


currentStore().then((result) {
            setState(() {
                selectedStoreName = result;
            });
        });



  }


  loadPage(BuildContext context){

  }



  @override
  Widget build(BuildContext context) {
 
    return new Scaffold(
      body: 
 Card(
  child:
 Column(
 crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisSize: MainAxisSize.max,
   children: <Widget>[
     new GestureDetector(
       onTap:(){},
    child: Card(
  child:
Padding(padding: EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 2.0),child: 
Row(children: <Widget>[
  Icon(Icons.touch_app,color: LcwAssistColor.secondaryColor),
  Padding(padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),child: Text('Mağaza : ' + selectedStoreName,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 15.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),)
  ],
  ),)
  
  ),
),
Expanded(flex: 1,
child: 
 Card(
  child:
 
Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.stretch,

  children: <Widget>[
   Container(child: Row(children: <Widget>[
     Padding(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
     child: Text('Mağaza Satış İstatistikleri',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)],),),
  Container(child: 
  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: SimpleBarChart(SimpleBarChart.createSampleData()),),),)
],)

 )
),
Expanded(flex: 1,
child: 
 Card(
  child:
 
Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.stretch,

  children: <Widget>[
   Container(child: Row(children: <Widget>[
     Padding(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
     child: Text('2018 Küm. Satış',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)],),),
  Container(child: 
  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: StackedAreaLineChart(StackedAreaLineChart.createSampleData()),),),)
],)

 )
,)

 ],)
 )

    );}

    Future currentStore() async{

Stores stores;

stores = await storeChooseService.getCurrentStore();

selectedStoreName = stores.storeName;

return selectedStoreName;
    }

}

