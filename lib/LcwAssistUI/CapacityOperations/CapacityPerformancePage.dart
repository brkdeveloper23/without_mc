import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/GlobalWidget/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityPerformanceMetricFilterDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityPerformanceMetricRequestDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityPerformanceMetricResponseDTO.dart';
import 'package:lcwassist/DataAccess/ResponseBase.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:flutter/rendering.dart';

class CapacityPerformancePage extends StatefulWidget {
  @override
  _CapacityPerformanceState createState() => _CapacityPerformanceState();
}

class _CapacityPerformanceState extends State<CapacityPerformancePage> implements IsLcwAssistUIPage{

bool sayfaYuklendimi = false;
LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

Color cardBackColor = Colors.grey[100];
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

List<CapacityPerformanceMetricResponseDTO> capacityPerformanceList = new List<CapacityPerformanceMetricResponseDTO>();
List<CapacityPerformanceMetricFilterDTO> listCapacityFilter = new  List<CapacityPerformanceMetricFilterDTO>();

List<CapacityPerformanceDateFilter> listCapacityPerformanceDateFilter = new List<CapacityPerformanceDateFilter>();
CapacityPerformanceDateFilter listSelectedCapacityPerformanceDateFilter;

List<AksesuarUrunDTO> listAksesuarUrunDTO = new List<AksesuarUrunDTO>();
AksesuarUrunDTO listSelectedAksesuarUrunDTO = new AksesuarUrunDTO();

List<MerchYasGrupDTO> listMerchYasGrupDTO = new List<MerchYasGrupDTO>();
MerchYasGrupDTO listSelectedMerchYasGrupDTO = new MerchYasGrupDTO();

List<MerchMarkaYasGrupDTO> listMerchMarkaYasGrupDTO = new List<MerchMarkaYasGrupDTO>();
MerchMarkaYasGrupDTO listSelectedMerchMarkaYasGrupDTO = new MerchMarkaYasGrupDTO();

double colonSize = 100;
double staticColumnSize = 60;

  @override
  void initState() {
super.initState();

SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);

WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
  }

  @override
  Future loaded(BuildContext context) async{ 
   applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();
   applicationManager.setCurrentStore = await applicationManager.serviceManager.storeChooseService.getCurrentStore();
   setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

  ParsedResponse parsedResponse = await applicationManager.serviceManager.capacityAnaliysisService.capacityPerformanceMetricFilters();
  
  if(parsedResponse.statusCode == 200)
listCapacityFilter = parsedResponse.body;
else
{
  await applicationManager.utils.resultApiStatus(context, parsedResponse.statusCode, applicationManager.currentLanguage);
  return;
}

loadAksesuarUrunList();
loadTarihList();
loadMYG(listSelectedAksesuarUrunDTO.tanim);

setState(() {
   sayfaYuklendimi = true;
  Navigator.pop(context);
 });

  }

loadAksesuarUrunList(){

listAksesuarUrunDTO = new List<AksesuarUrunDTO>();

List<String> data = new List<String>();

data = listCapacityFilter.map((f)=> f.aksesuarUrun.toString()).toList();

 int count = 0;

 data.sort();

 
 count++;
for(final i in data)
{
  //Distinct yaptık.
  if(!listAksesuarUrunDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listAksesuarUrunDTO.add(AksesuarUrunDTO(kod: count,tanim: i));
  count++;
  }
}

listSelectedAksesuarUrunDTO = listAksesuarUrunDTO[0];

}

loadTarihList(){

listCapacityPerformanceDateFilter = new List<CapacityPerformanceDateFilter>();

List<String> data = new List<String>();

data = listCapacityFilter.map((f)=> f.tarihFilter.toString()).toList();

 int count = 0;

 data.sort();

 
 count++;
for(final i in data)
{
  //Distinct yaptık.
  if(!listCapacityPerformanceDateFilter.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listCapacityPerformanceDateFilter.add(CapacityPerformanceDateFilter(kod: count,tanim: i));
  count++;
  }
}
listSelectedCapacityPerformanceDateFilter = listCapacityPerformanceDateFilter[0];

}

loadMYG(String aksesuarKod){

listMerchYasGrupDTO = new List<MerchYasGrupDTO>();

List<String> data = new List<String>();

data = listCapacityFilter
.where((i)=> i.aksesuarUrun == aksesuarKod)
.map((f)=> f.merchYasGrupKod.toString()).toList();

 int count = 0;

 data.sort();



 listMerchYasGrupDTO.add(MerchYasGrupDTO(kod: count,tanim: applicationManager.currentLanguage.gettumu));
 
 count++;
for(final i in data)
{
  //Distinct yaptık.
  if(!listMerchYasGrupDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listMerchYasGrupDTO.add(MerchYasGrupDTO(kod: count,tanim: i));
  count++;
  }
}

listSelectedMerchYasGrupDTO = listMerchYasGrupDTO[0];

}

loadCapacityPerformansMetric() async{

CapacityPerformanceMetricRequestDTO parameter = new CapacityPerformanceMetricRequestDTO();
parameter.depoRef = await applicationManager.currentStore.depoRef;
parameter.aksesuarUrun = listSelectedAksesuarUrunDTO.tanim;
parameter.merchYasGrupKod = listSelectedMerchYasGrupDTO.tanim == applicationManager.currentLanguage.gettumu ? "" : listSelectedMerchYasGrupDTO.tanim;
parameter.tarihFilter = listSelectedCapacityPerformanceDateFilter.kod;

ParsedResponse responseCapacityFilterList = await applicationManager.serviceManager.capacityAnaliysisService.capacityPerformanceResponse(parameter);

if(responseCapacityFilterList.statusCode == 200)
{
  capacityPerformanceList = responseCapacityFilterList.body;

 if(capacityPerformanceList.length==0)
  LcwAssistSnackBarDialogInfo(applicationManager.currentLanguage.getaradiginizKriterlerdeDataBulunamadi,scaffoldState,LcwAssistSnagitType.warning).snackbarShow();
}
else
{
  await applicationManager.utils.resultApiStatus(context, responseCapacityFilterList.statusCode, applicationManager.currentLanguage);
  dispose();
  return;
}

}

   @override
  Future<void> executeAfterBuild() {
    
    return null;
  }

@override
Widget build(BuildContext context) { 
  debugPaintSizeEnabled=false;
executeAfterBuild();
    return new Scaffold(
      backgroundColor: LcwAssistColor.backGroundColor,
      key: scaffoldState,
      
      //resizeToAvoidBottomPadding: false,
      body: sayfaYuklendimi ? 
        filterBody()
       : Text('')
    );


    }

Widget filterBody(){

  return Column(children: <Widget>[

Container(padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0) ,child: 
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[

//Aksesuar
Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getAUTSecin,
style: TextStyle(fontSize: 12.0,color: LcwAssistColor.primaryColor,
fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),

Card(
  margin: EdgeInsets.fromLTRB(4, 2, 4,2),
  child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:


DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<AksesuarUrunDTO>(
            //hint: new Text(""),
            value: listSelectedAksesuarUrunDTO,
            onChanged: (AksesuarUrunDTO newValue) {

//  List<String> e3we = new List<String>();
//  e3we.add(newValue.tanim);
capacityPerformanceList = new List<CapacityPerformanceMetricResponseDTO>();

              loadMYG(newValue.tanim);
              
              setState(() {
                listSelectedAksesuarUrunDTO = newValue;
                chan(newValue.kod);
              });
            },
            items: listAksesuarUrunDTO.map((AksesuarUrunDTO user) {
              return new DropdownMenuItem<AksesuarUrunDTO>(
                value: user,
                child: new Text(
                  user.tanim,
                  style: new TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            ),
        )
    ),
)
,),

],)
),
//Son 6 ay
Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.gettarihSecin,style: TextStyle(fontSize: 12.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),
Card(
  margin: EdgeInsets.fromLTRB(4, 2, 4, 2),
  child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:


DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<CapacityPerformanceDateFilter>(
            //hint: new Text(""),
            value: listSelectedCapacityPerformanceDateFilter,
            onChanged: (CapacityPerformanceDateFilter newValue) {
              
                capacityPerformanceList = new List<CapacityPerformanceMetricResponseDTO>();
                listSelectedCapacityPerformanceDateFilter = newValue;
                chan(newValue.kod);
              setState(() {
                
              });
            },
            items: listCapacityPerformanceDateFilter.map((CapacityPerformanceDateFilter user) {
              return new DropdownMenuItem<CapacityPerformanceDateFilter>(
                value: user,
                child: new Text(
                  user.tanim,
                  style: new TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            ),
        )
    ),
)
,),


],)


),
//MYG     
Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getmerchYasGrupSecin,style: TextStyle(fontSize: 12.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),
Card(
  margin: EdgeInsets.fromLTRB(4, 2, 4, 2),
  child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:


DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<MerchYasGrupDTO>(
            //hint: new Text(""),
            value: listSelectedMerchYasGrupDTO,
            onChanged: (MerchYasGrupDTO newValue) {
              
              capacityPerformanceList = new List<CapacityPerformanceMetricResponseDTO>();
               List<String> e3we = new List<String>();
 e3we.add(newValue.tanim);

                
                listSelectedMerchYasGrupDTO = newValue;
                chan(newValue.kod);
              setState(() {
                
              });
            },
            items: listMerchYasGrupDTO.map((MerchYasGrupDTO user) {
              return new DropdownMenuItem<MerchYasGrupDTO>(
                value: user,
                child: new Text(
                  user.tanim,
                  style: new TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            ),
        )
    ),
)
,),

],)

),

Padding(padding: EdgeInsets.all(4.0),child: Row(children: <Widget>[
  
  Expanded(flex: 7,child: RaisedButton(onPressed: ()=>
  btnfilterClick(),
  
  color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.list,color: Colors.white,),Text(applicationManager.currentLanguage.getfiltrele,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)],),),),
  Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0)),
  Expanded(flex: 7,child: RaisedButton(onPressed: ()=>
  btnClean(),color: LcwAssistColor.tomatoColor,child: Row(children: <Widget>[Icon(Icons.clear_all,color: Colors.white),Text(applicationManager.currentLanguage.gettemizle,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily))],),),)

],)

,),

],)
 ),

Expanded(child:
  Card(child: Padding(padding: EdgeInsets.all(2),child: scroolSagaAltaVeSabit(),),)//scroolSagaAlta(),),)
)
//gridRowsSabitColumns
  ],);


  //SOL KOLON SABIT OLAN SCROLL
// Row(children: <Widget>[
//   Container(child: Column(children: gridRowsSabitColumns(),),),
//   Expanded(child:
//   scrool()
// )
// ],)

}

Widget scroolSaga(){
return 
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          
        ),
        child: Column(
            children: gridTum(),
          ),
        
      ),
    );

}

Widget scroolSagaAlta(){
return 
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          
        ),
        child: 
        

SingleChildScrollView(
  scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          
        ),
        child: Column(
            children: gridTum(),
          ),
        
      ),
    )

        
        ,
        
      ),
    );

}

Widget scroolSagaAltaVeSabit(){
return 
ListView(
  scrollDirection: Axis.vertical
  ,children: <Widget>[
    Row(children: <Widget>[
      gridRowsSabit(),
      Expanded(child:       

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
        ),
        child:
         gridRowsDinamik()        
        ))
  )])
],); 

}

Widget ozelScrool(){
  return CustomScrollView(
  primary: false,
  scrollDirection: Axis.horizontal,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10.0,
        crossAxisCount: 1,//Kaç satır alta alta olacak belirtiyor
        children: <Widget>[
          const Text('He\'d have you all unravel at thesdfffffffffffffffasdfafsadfdfsdfgfhgfghfhfhsdfsdsfdfsdfsfsdfsdffffffffffffffffffffsdfsfsdf'),
           //gridRowsDinamik2(),
          const Text('Heed not the rabble'),
          const Text('Sound of screams but the'),
          const Text('Who scream'),
          const Text('Revolution is coming...'),
          const Text('Revolution, they...'),
           const Text('Sound of screams but the'),
          const Text('Who scream'),
          const Text('Revolution is coming...'),
          const Text('Revolution, they...'),
        ],
      ),
    ),
  ],
)
;
}

void chan(int value){

  setState(() {
    });

}

btnfilterClick() async{

   setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

await loadCapacityPerformansMetric();

setState(() {
   sayfaYuklendimi = true;
  Navigator.pop(context);
 });

}

btnClean(){
loadAksesuarUrunList();
loadTarihList();
loadMYG(listSelectedAksesuarUrunDTO.tanim);
 capacityPerformanceList = new List<CapacityPerformanceMetricResponseDTO>();
setState(() {
});
}


List<Widget> gridRowsDinamik_(){

List<String> kolonlar = 
[
  'PeriyotReyonKapasiteLCMYuzde',
  //this.applicationManager.currentLanguage.getanasayfa,
  "BrutKar",
  "PerformansaGoreIdealKapasite",
  "ReyonLCMKapasite",
  "SatisTutar",
  "SatisAdet",
  "ReyonCoverMagaza",
  "ReyonCoverBolge",

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
        SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[0],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[1],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[2],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[3],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[4],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[5],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[6],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[7],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,))


    ])),
  
);
 
int count = 0;
for (var i in  capacityPerformanceList) {
  rows.add(

  Container(
  padding: EdgeInsets.all(5.0),
  color: count % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(240,249,255,1.0)//Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
        SizedBox(width: colonSize,child:  
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.periyotReyonKapasiteLCMYuzde.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.brutKar.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.performansaGoreIdealKapasite.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonLCMKapasite.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.satisTutar.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.satisAdet.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonCoverMagaza.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonCoverBolge.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),)
      
    ]))

  );
  count++;
}



return rows;
}

List<Widget> gridTum(){

List<String> kolonlar = 
[
  applicationManager.currentLanguage.getkapasitePerformansKolon0,
  applicationManager.currentLanguage.getkapasitePerformansKolon1,
  applicationManager.currentLanguage.getkapasitePerformansKolon2,
  applicationManager.currentLanguage.getkapasitePerformansKolon3,
  applicationManager.currentLanguage.getkapasitePerformansKolon4,
  applicationManager.currentLanguage.getkapasitePerformansKolon5,
  applicationManager.currentLanguage.getkapasitePerformansKolon6,
  applicationManager.currentLanguage.getkapasitePerformansKolon7,
  applicationManager.currentLanguage.getkapasitePerformansKolon8,
  applicationManager.currentLanguage.getkapasitePerformansKolon9
  // 'PeriyotReyonKapasiteLCMYuzde',
  // //this.applicationManager.currentLanguage.getanasayfa,
  // "BrutKar",
  // "PerformansaGoreIdealKapasite",
  // "ReyonLCMKapasite",
  // "SatisTutar",
  // "SatisAdet",
  // "ReyonCoverMagaza",
  // "ReyonCoverBolge",

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
                SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[0],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),)
      ,),),
              SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[1],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),)
      ,),),
        SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[2],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[3],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),


      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[4],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[5],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[6],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[7],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[8],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[9],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,))


    ])),
  
);
 
int count = 0;
for (var i in  capacityPerformanceList) {
  rows.add(

  Container(
  padding: EdgeInsets.all(5.0),
  color: count % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(240,249,255,1.0)//Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
        SizedBox(width: colonSize,child:  
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.merchKod.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
      ,),),
              SizedBox(width: colonSize,child:  
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.merchTanim.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
      ,),),

        SizedBox(width: colonSize,child:  
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.periyotReyonKapasiteLCMYuzde.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.brutKar.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.performansaGoreIdealKapasite.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonLCMKapasite.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.satisTutar.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.satisAdet.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonCoverMagaza.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonCoverBolge.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),)
      
    ]))

  );
  count++;
}



return rows;
}

Widget gridRowsSabit(){

List<String> kolonlar = 
[
  applicationManager.currentLanguage.getkapasitePerformansKolon0,
  applicationManager.currentLanguage.getkapasitePerformansKolon1,

  ];

List<Widget> rows = [];

//HEADER
rows.add(
    Container(
      height: 60,
  padding: EdgeInsets.all(5.0),
  color: Color.fromRGBO(206,234,255,1.0)//(244,242,248, 1.0)
  ,child:
  Row(
      children: <Widget>[
                SizedBox(width: staticColumnSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[0],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),)
      ,),),
              SizedBox(width: staticColumnSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[1],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),)
      ,),),
        

    ])),
  
);
 
int count = 0;
for (var i in  capacityPerformanceList) {
  rows.add(

  Container(
    height: 50,
  padding: EdgeInsets.all(5.0),
  color: count % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(226,242,253,1.0)//Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
        SizedBox(width: staticColumnSize,child:  
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.merchKod.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
      ,),),
              SizedBox(width: staticColumnSize,child:  
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.merchTanim.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
      ,),),

      
    ]))

  );
  count++;
}



return Column(children: rows,);
}

Widget gridRowsDinamik(){

List<String> kolonlar = 
[

  applicationManager.currentLanguage.getkapasitePerformansKolon2,
  applicationManager.currentLanguage.getkapasitePerformansKolon3,
  applicationManager.currentLanguage.getkapasitePerformansKolon4,
  applicationManager.currentLanguage.getkapasitePerformansKolon5,
  applicationManager.currentLanguage.getkapasitePerformansKolon6,
  applicationManager.currentLanguage.getkapasitePerformansKolon7,
  applicationManager.currentLanguage.getkapasitePerformansKolon8,
  applicationManager.currentLanguage.getkapasitePerformansKolon9
  // 'PeriyotReyonKapasiteLCMYuzde',
  // //this.applicationManager.currentLanguage.getanasayfa,
  // "BrutKar",
  // "PerformansaGoreIdealKapasite",
  // "ReyonLCMKapasite",
  // "SatisTutar",
  // "SatisAdet",
  // "ReyonCoverMagaza",
  // "ReyonCoverBolge",

  ];

List<Widget> rows = [];

//HEADER
rows.add(
    Container(
      height: 60,
  padding: EdgeInsets.all(5.0),
  color: Color.fromRGBO(232,243,255,1.0)//(244,242,248, 1.0)
  ,child:
  Row(
      children: <Widget>[
                SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[0],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,),textAlign: TextAlign.center,),)
      ,),),
              SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[1],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,),textAlign: TextAlign.center,),)
      ,),),
        SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[2],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[3],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),


      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[4],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[5],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[6],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[7],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),),
      
    ])),
  
);
 
int count = 0;
for (var i in  capacityPerformanceList) {
  rows.add(

  Container(
    height: 50,
  padding: EdgeInsets.all(5.0),
  color: count % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(240,249,255,1.0)//Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
       
        SizedBox(width: colonSize,child:  
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.periyotReyonKapasiteLCMYuzde.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.brutKar.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.performansaGoreIdealKapasite.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonLCMKapasite.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.satisTutar.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.satisAdet.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
      Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonCoverMagaza.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),),
      SizedBox(width: colonSize,child: 
Container(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.reyonCoverBolge.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),)
      
    ]))

  );
  count++;
}



return Column(children: rows,);
}

}