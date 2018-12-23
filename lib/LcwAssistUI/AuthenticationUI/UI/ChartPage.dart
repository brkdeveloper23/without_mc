import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/BucketingAxisChart.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/PieChartSimple.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/ScatterPlotComboLineChart.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/StackedAreaLineChart.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
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

class ChartPageState extends State<ChartPage> implements IsLcwAssistUIPage{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
StoreChooseService storeChooseService = new StoreChooseService();
String selectedStoreName = "";
bool sayfaYuklendiMi = false;

  @override
  void initState() {
super.initState();

sayfaYuklendiMi = false;
 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));


currentStore().then((result) {
            setState(() {
                selectedStoreName = result;
            });
        });

  }


  void loaded(BuildContext context) async{

applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
sayfaYuklendiMi = true; 
  }

    @override
  Future<void> executeAfterBuild() {
    
    return null;
  }



  @override
  Widget build(BuildContext context) {
 
    return new Scaffold(
      body: sayfaYuklendiMi == true ? pageBody() : Container(child: Text(''),),

    );}

Widget pageBody(){
  return  Container(
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
  Padding(padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),child: Text(applicationManager.currentLanguage.getmagaza+': ' + selectedStoreName,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 15.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),)
  ],
  ),)
  ),
),

Expanded(child: chartPageView(),)


 ],)
 );

















}


Widget chartPageView()
{
  return PageView(
    children: <Widget>[

Container(child: Column(children: <Widget>[chart1(),chart2()],),),
Container(child: Column(children: <Widget>[chart3(),chart4()],),),

    ],
  );
}

    Future currentStore() async{

StoreChooseListViewDTO stores;

stores = await storeChooseService.getCurrentStore();

selectedStoreName = stores.storeName;

return selectedStoreName;
    }


Widget chart1(){
     return Expanded(flex: 1,
child: 
 Card(
  child:
 
Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.stretch,

  children: <Widget>[
   Container(child: Row(children: <Widget>[
     Padding(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
     child: Text(applicationManager.currentLanguage.getmagazaSatisIstatistikleri,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)],),),
  Container(child: 
  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: SimpleBarChart(SimpleBarChart.createSampleData()),),),)
],)

 )
);

    }

Widget chart2(){
      return Expanded(flex: 1,
child: 
 Card(
  child:
 
Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.stretch,

  children: <Widget>[
   Container(child: Row(children: <Widget>[
     Padding(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
     child: Text(applicationManager.currentLanguage.getmagazaSatisIstatistikleri,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)],),),
  Container(child: 
  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: StackedAreaLineChart(StackedAreaLineChart.createSampleData()),),),)
],)

 )
,);
    }

Widget chart3(){
return 
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
     child: Text(applicationManager.currentLanguage.getmagazaSatisIstatistikleri,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)],),),
  Container(child: 
  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: BucketingAxisScatterPlotChart(BucketingAxisScatterPlotChart.createSampleData()),),),)
],)

 )
,);

}

Widget chart4(){
return 
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
     child: Text(applicationManager.currentLanguage.getmagazaSatisIstatistikleri,style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),)],),),
  Container(child: 
  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: PieOutsideLabelChart(PieOutsideLabelChart.createSampleData()),),),)
],)

 )
,);

}


}

