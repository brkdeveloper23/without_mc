import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';

import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/GlobalWidget/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportResponseDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/MultiLangComboDTO.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/BestWorstOptionsDTOs/BestWorstOptionListResponseList.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/BestWorstOptionsDTOs/BestWorstOptionsFilterRequestDTO.dart';
import 'package:lcwassist/DataAccess/ResponseBase.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/BestWorstOptions/BestWorstProductList.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


void main(){
  runApp(new MaterialApp(
    home:new BestWorstOptionFilter(),
  ));
}

class BestWorstOptionFilter extends StatefulWidget{

   CapacityAnalysisMetricsFilterDTO storesResponse;
   CapacityAnaliysisReportRequestDTO capacityParameter  = new CapacityAnaliysisReportRequestDTO();

  //BestWorstOptionFilter({Key key, @required this.storesResponse,@required this.capacityParameter}) : super(key: key);
  //BestWorstOptionFilter({Key key, @required this.storesResponse,@required this.capacityParameter}) : super(key: key);
  @override
  //BestWorstOptionFilterState createState() => new BestWorstOptionFilterState(merchHierarsiList:storesResponse,capacityParameter: capacityParameter);
  BestWorstOptionFilterState createState() => new BestWorstOptionFilterState();
}

class BestWorstOptionFilterState extends State<BestWorstOptionFilter>  with TickerProviderStateMixin  implements IsLcwAssistUIPage{

CapacityAnalysisMetricsFilterDTO merchHierarsiList;

BestWorstOptionsFilterRequestDTO bestWorsParameter   = new BestWorstOptionsFilterRequestDTO();
//BestWorstOptionFilterState({Key key, @required this.storesResponse,@required this.capacityParameter});
BestWorstOptionFilterState();
LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

List<String> aksesuarUrunList = new List<String>();
String aksesuarUrun="";
bool sayfaYuklendimi = false;

Color cardBackColor = Colors.grey[100];

List<MerchGrupDTO> listMerchGrupDTO = new List<MerchGrupDTO>();
MerchGrupDTO listSelectedMerchGrupDTO;

List<MerchMarkaYasGrupDTO> listMerchMarkaYasGrupDTO = new List<MerchMarkaYasGrupDTO>();
MerchMarkaYasGrupDTO listSelectedMerchMarkaYasGrupDTO;

List<MerchAltGroupDTO> listMerchAltGroupDTO = new List<MerchAltGroupDTO>();
MerchAltGroupDTO listSelectedMerchAltGroupDTO;

List<BuyerGrupTanimDTO> listBuyerGrupTanimDTO = new List<BuyerGrupTanimDTO>();
BuyerGrupTanimDTO listSelectedBuyerGrupTanimDTO;

List<BestWorstOptionDTO> listBestWorstOptionDTO = new List<BestWorstOptionDTO>();
BestWorstOptionDTO listSelectedBestWorstOptionDTO;

List<BestWorstOptionSiralamaTipi> listBestWorstOptionSiralamaTipi = new List<BestWorstOptionSiralamaTipi>();
BestWorstOptionSiralamaTipi listSelectedBestWorstOptionSiralamaTipi;

final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

loadBestWorstOption(){
  
BestWorstOptionDTO data = new BestWorstOptionDTO();
listBestWorstOptionDTO = new List<BestWorstOptionDTO>();
data.kod = 0;
data.tanim = applicationManager.currentLanguage.getbestOptions;
listBestWorstOptionDTO.add(data);
data = new BestWorstOptionDTO();

data.kod = 1;
data.tanim = applicationManager.currentLanguage.getworstOptions;
listBestWorstOptionDTO.add(data);

listSelectedBestWorstOptionDTO = listBestWorstOptionDTO[0];

}

loadSiralamaTipi(){
  listBestWorstOptionSiralamaTipi = new List<BestWorstOptionSiralamaTipi>();
BestWorstOptionSiralamaTipi siralamaTipi = new BestWorstOptionSiralamaTipi();
siralamaTipi.kod = 0;
siralamaTipi.tanim = applicationManager.currentLanguage.getsatis;
listBestWorstOptionSiralamaTipi.add(siralamaTipi);

siralamaTipi = new BestWorstOptionSiralamaTipi();
siralamaTipi.kod = 1;
siralamaTipi.tanim = applicationManager.currentLanguage.getbestWorstDMKupKar;
listBestWorstOptionSiralamaTipi.add(siralamaTipi);

siralamaTipi = new BestWorstOptionSiralamaTipi();
siralamaTipi.kod = 2;
siralamaTipi.tanim = applicationManager.currentLanguage.getbestWorstDevirHizi;
listBestWorstOptionSiralamaTipi.add(siralamaTipi);

listSelectedBestWorstOptionSiralamaTipi = listBestWorstOptionSiralamaTipi[0];

}

loadMerchGrupKodList(){
List<String> merchGrupKodList = new List<String>();

listMerchGrupDTO = new List<MerchGrupDTO>();

//if(aksesuarKod == ""){
merchGrupKodList = 
merchHierarsiList.merchHierarchiesList
.map((f)=> f.merchGrupKod.toString()).toList();//sort((a, b) => a.length.compareTo(b.length));;

 int count = 0;

merchGrupKodList.sort();
// listMerchGrupDTO.add(MerchGrupDTO(kod: count,tanim: applicationManager.currentLanguage.gettumu));



 
 count++;
for(final i in merchGrupKodList)
{
  //Distinct yaptık.
  if(!listMerchGrupDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listMerchGrupDTO.add(MerchGrupDTO(kod: count,tanim: i));
  count++;
  }
}
listSelectedMerchGrupDTO = listMerchGrupDTO[0];


}

loadMerchMarkaYasGrupKodList(List<String> merchGrupKodList){

List<String> merchMarkaYasGrupKodList = new List<String>();

listMerchMarkaYasGrupDTO = new List<MerchMarkaYasGrupDTO>();

//if(aksesuarKod == ""){
merchMarkaYasGrupKodList = 
merchHierarsiList.merchHierarchiesList
.where((i)=> merchGrupKodList.contains(i.merchGrupKod))
.map((f)=> f.merchMarkaYasGrupKod.toString()).toList();//sort((a, b) => a.length.compareTo(b.length));;

 int count = 0;

 merchMarkaYasGrupKodList.sort();
 listMerchMarkaYasGrupDTO.add(MerchMarkaYasGrupDTO(kod: count,tanim: applicationManager.currentLanguage.gettumu));


 listSelectedMerchMarkaYasGrupDTO = listMerchMarkaYasGrupDTO[0];
 count++;
for(final i in merchMarkaYasGrupKodList)
{
  //Distinct yaptık.
  if(!listMerchMarkaYasGrupDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listMerchMarkaYasGrupDTO.add(MerchMarkaYasGrupDTO(kod: count,tanim: i));
  count++;
  }
}

}

loadMerchAltGrupKodList(List<String>  mercYasGrupKod){

List<String> merchAltGrupKodList = new List<String>();
listMerchAltGroupDTO = new List<MerchAltGroupDTO>();

merchAltGrupKodList = 
merchHierarsiList.merchHierarchiesList
.where((i)=> mercYasGrupKod.contains(i.merchMarkaYasGrupKod))
.map((f)=> f.merchAltGrupKod.toString()).toList();

 int count = 0;

merchAltGrupKodList.sort();
 listMerchAltGroupDTO.add(MerchAltGroupDTO(kod: count,tanim: applicationManager.currentLanguage.gettumu));
 
 listSelectedMerchAltGroupDTO = listMerchAltGroupDTO[0];
 count++;
for(final i in merchAltGrupKodList)
{
  //Distinct yaptık.
  if(!listMerchAltGroupDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listMerchAltGroupDTO.add(MerchAltGroupDTO(kod: count,tanim: i));
  count++;
  }
}

}

loadBuyerGrupTanimList(List<String>  merchAltGrupKod){

List<String> buyerGrupTanimList = new List<String>();
listBuyerGrupTanimDTO = new List<BuyerGrupTanimDTO>();
buyerGrupTanimList = merchHierarsiList.merchHierarchiesList
.where((i)=> merchAltGrupKod.contains(i.merchAltGrupKod))
.map((f)=> f.buyerGrupTanim.toString()).toList();

 int count = 0;

buyerGrupTanimList.sort();
 listBuyerGrupTanimDTO.add(BuyerGrupTanimDTO(kod: count,tanim: applicationManager.currentLanguage.gettumu));
 listSelectedBuyerGrupTanimDTO = listBuyerGrupTanimDTO[0];
 count++;
for(final i in buyerGrupTanimList)
{
  //Distinct yaptık.
  if(!listBuyerGrupTanimDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listBuyerGrupTanimDTO.add(BuyerGrupTanimDTO(kod: count,tanim: i));
  count++;
  }
}
}

Future loadMerchHierarsiList() async{

ParsedResponse responseMerchHierarsiList = await applicationManager.serviceManager.capacityAnaliysisService.capacityAnalysisMetricsFilters();
//merchHierarsiList = await applicationManager.serviceManager.capacityAnaliysisService.capacityAnalysisMetricsFilters();
if(responseMerchHierarsiList.statusCode == 200)
merchHierarsiList = responseMerchHierarsiList.body;
else
{
  await applicationManager.utils.resultApiStatus(context, responseMerchHierarsiList.statusCode, applicationManager.currentLanguage);
  return;
}

}

  @override
  void initState() {
super.initState();

SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);

WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));

  }

Future loaded(BuildContext context) async{
applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();
applicationManager.setCurrentStore = await applicationManager.serviceManager.storeChooseService.getCurrentStore();
   setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

 bestWorsParameter.setDepoRef =  applicationManager.currentStore.depoRef;
 bestWorsParameter.setBuyerGrupTanim = "";
 bestWorsParameter.setMerchMarkaYasGrupKod = "";
 bestWorsParameter.setMerchAltGrupKod = "";
 bestWorsParameter.setMerchGrupKod = "";
 await loadMerchHierarsiList();

loadAllCombo();



 setState(() {
   sayfaYuklendimi = true;
  Navigator.pop(context);
 });
}

Future<void> executeAfterBuild() async {
  applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();
  sayfaYuklendimi = true;
  setState(() {
      
    });
}

void loadAllCombo(){

loadMerchGrupKodList();
loadMerchMarkaYasGrupKodList(listMerchGrupDTO.map((f)=> f.tanim.toString()).toList());
loadMerchAltGrupKodList(listMerchMarkaYasGrupDTO.map((f)=> f.tanim.toString()).toList());
loadBuyerGrupTanimList(listMerchAltGroupDTO.map((f)=> f.tanim.toString()).toList());
loadSiralamaTipi();
loadBestWorstOption();

listSelectedMerchGrupDTO = bestWorsParameter.getMerchGrupKod != "" ? listMerchGrupDTO.where((i) => i.tanim == bestWorsParameter.getMerchGrupKod).first : listMerchGrupDTO[0];
listSelectedBuyerGrupTanimDTO = bestWorsParameter.getBuyerGrupTanim != "" ? listBuyerGrupTanimDTO.where((i) => i.tanim == bestWorsParameter.getBuyerGrupTanim).first : listBuyerGrupTanimDTO[0];
listSelectedMerchAltGroupDTO = bestWorsParameter.getMerchAltGrupKod != "" ? listMerchAltGroupDTO.where((i) => i.tanim == bestWorsParameter.getMerchAltGrupKod).first : listMerchAltGroupDTO[0];
listSelectedMerchMarkaYasGrupDTO = bestWorsParameter.getMerchMarkaYasGrupKod != "" ? listMerchMarkaYasGrupDTO.where((i) => i.tanim == bestWorsParameter.getMerchMarkaYasGrupKod).first : listMerchMarkaYasGrupDTO[0];

}

@override
Widget build(BuildContext context) {
//executeAfterBuild();
    return new Scaffold(
      backgroundColor: LcwAssistColor.backGroundColor,
      key: scaffoldState,
      appBar: new AppBar(
        title: sayfaYuklendimi ? Text(applicationManager.currentLanguage.getbestWorstOptions) : Text(''),
     
      ),
      body: sayfaYuklendimi ? filterBody() : Text('')
    );

    }

Widget filterBody(){
      return 
      Column(
  children: <Widget>[
      Expanded(child: 
      SingleChildScrollView(
                child:      
       Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

 Container(padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0) ,child: 

Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
//Best Worst Options List
Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getbestWorstOptions,style: TextStyle(fontSize: 15.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),
Card(child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:
DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<BestWorstOptionDTO>(
            //hint: new Text(""),
            value: listSelectedBestWorstOptionDTO,
            onChanged: (BestWorstOptionDTO newValue) {
              
               List<String> e3we = new List<String>();
 e3we.add(newValue.tanim);

                //loadBestWorstOption();
                listSelectedBestWorstOptionDTO = newValue;
                chan(newValue.kod);
              setState(() {
                
              });
            },
            items: listBestWorstOptionDTO.map((BestWorstOptionDTO user) {
              return new DropdownMenuItem<BestWorstOptionDTO>(
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
))
],)
),

//Siralama Tip List
Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getbestWorstOptionSiralamaTipi,style: TextStyle(fontSize: 15.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),

Card(child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:
DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<BestWorstOptionSiralamaTipi>(
            //hint: new Text(""),
            value: listSelectedBestWorstOptionSiralamaTipi,
            onChanged: (BestWorstOptionSiralamaTipi newValue) {
              
               List<String> e3we = new List<String>();
 e3we.add(newValue.tanim);

                //loadBestWorstOption();
                listSelectedBestWorstOptionSiralamaTipi = newValue;
                chan(newValue.kod);
              setState(() {
                
              });
            },
            items: listBestWorstOptionSiralamaTipi.map((BestWorstOptionSiralamaTipi user) {
              return new DropdownMenuItem<BestWorstOptionSiralamaTipi>(
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
))

],)
),

//MerchGrup Kod
Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text('Merch Grup Kod Seç...',style: TextStyle(fontSize: 15.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),
Card(child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:


DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<MerchGrupDTO>(
            //hint: new Text(""),
            value: listSelectedMerchGrupDTO,
            onChanged: (MerchGrupDTO newValue) {
              
               List<String> e3we = new List<String>();
 e3we.add(newValue.tanim);

                loadMerchMarkaYasGrupKodList(e3we);
                listSelectedMerchGrupDTO = newValue;
                chan(newValue.kod);
              setState(() {
                
              });
            },
            items: listMerchGrupDTO.map((MerchGrupDTO user) {
              return new DropdownMenuItem<MerchGrupDTO>(
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

Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getmerchMarkaYasGrupSecin,style: TextStyle(fontSize: 15.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),
Card(child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:


DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<MerchMarkaYasGrupDTO>(
            //hint: new Text(""),
            value: listSelectedMerchMarkaYasGrupDTO,
            onChanged: (MerchMarkaYasGrupDTO newValue) {
              
               List<String> e3we = new List<String>();
 e3we.add(newValue.tanim);

                loadMerchAltGrupKodList(e3we);
                listSelectedMerchMarkaYasGrupDTO = newValue;
                chan(newValue.kod);
              setState(() {
                
              });
            },
            items: listMerchMarkaYasGrupDTO.map((MerchMarkaYasGrupDTO user) {
              return new DropdownMenuItem<MerchMarkaYasGrupDTO>(
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

Card(
color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getmerchAltGrupSecin,style: TextStyle(fontSize: 15.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),

Card(child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:


DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<MerchAltGroupDTO>(
            //hint: new Text(""),
            value: listSelectedMerchAltGroupDTO,
            onChanged: (MerchAltGroupDTO newValue) {
              setState(() {
                listSelectedMerchAltGroupDTO = newValue;
               List<String> e3we = new List<String>();
 e3we.add(newValue.tanim);
 loadBuyerGrupTanimList(e3we);

                chan(newValue.kod);
              });
            },
            items: listMerchAltGroupDTO.map((MerchAltGroupDTO user) {
              return new DropdownMenuItem<MerchAltGroupDTO>(
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

Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getbuyerGrupSecin,style: TextStyle(fontSize: 15.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),

Card(child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:
DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<BuyerGrupTanimDTO>(
            //hint: new Text(""),
            value: listSelectedBuyerGrupTanimDTO,
            onChanged: (BuyerGrupTanimDTO newValue) {
              //
              setState(() {
                listSelectedBuyerGrupTanimDTO = newValue;
                chan(newValue.kod);
              });
            },
            items: listBuyerGrupTanimDTO.map((BuyerGrupTanimDTO user) {
              return new DropdownMenuItem<BuyerGrupTanimDTO>(
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
  
  Expanded(flex: 1,child: RaisedButton(onPressed: ()=>
  btnfilterClick(),
  
  color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.subdirectory_arrow_right,color: Colors.white,),Text(applicationManager.currentLanguage.getsonraki,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)],),),),
  Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0)),
  Expanded(flex: 1,child: RaisedButton(onPressed: ()=>
  btnClean(),color: LcwAssistColor.tomatoColor,child: Row(children: <Widget>[Icon(Icons.clear_all,color: Colors.white),Text(applicationManager.currentLanguage.gettemizle,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily))],),),)

],)

,)

],)
 ),

        ],),
      
      ))
  ]);
    }

void chan(int value){

  setState(() {
    });

}

void btnfilterClick() async{

bestWorsParameter.setBuyerGrupTanim =listSelectedBuyerGrupTanimDTO.tanim == listBuyerGrupTanimDTO[0].tanim ? "" : listSelectedBuyerGrupTanimDTO.tanim;
bestWorsParameter.setMerchAltGrupKod = listSelectedMerchAltGroupDTO.tanim == listMerchAltGroupDTO[0].tanim ? "" : listSelectedMerchAltGroupDTO.tanim;
bestWorsParameter.setMerchMarkaYasGrupKod = listSelectedMerchMarkaYasGrupDTO.tanim == listMerchMarkaYasGrupDTO[0].tanim ? "" : listSelectedMerchMarkaYasGrupDTO.tanim;
bestWorsParameter.setMerchGrupKod = listSelectedMerchGrupDTO.tanim;
bestWorsParameter.setDepoRef = applicationManager.currentStore.depoRef;
bestWorsParameter.setBestWorstSiralamaTipi = listSelectedBestWorstOptionSiralamaTipi.kod;
bestWorsParameter.setBestWorstTipi = listSelectedBestWorstOptionDTO.kod;

List<BestWorstOptionListResponseList> result = new List<BestWorstOptionListResponseList>();

   setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

 
ParsedResponse responseResult = await applicationManager.serviceManager.productSalesPerformanceService.bestWorstOptionProductList(bestWorsParameter);

if(responseResult.statusCode == 200)
result = responseResult.body;
else
{
  await applicationManager.utils.resultApiStatus(context, responseResult.statusCode, applicationManager.currentLanguage);
  return;
}



 setState(() {
  Navigator.pop(context);
 });

if(result.length==0)
  {
    LcwAssistSnackBarDialogInfo(applicationManager.currentLanguage.getaradiginizKriterlerdeDataBulunamadi,scaffoldState,LcwAssistSnagitType.warning).snackbarShow();
  return;
  }



 var route = new MaterialPageRoute(
            builder: (BuildContext context) => BestWorstProductList(bestWorstOptionList: result,applicationManager: applicationManager)
          );

          Navigator.of(context).push(route);

//final aa = await SharedPreferences.getInstance();

//aa.setString(SharedPreferencesConstant.capacityFilter, json.encode(asas.toMap()));

//Navigator.pop(context, capacityParameter);


}

void btnClean(){


bestWorsParameter.setBuyerGrupTanim = ""; 
bestWorsParameter.setMerchAltGrupKod =""; 
bestWorsParameter.setMerchMarkaYasGrupKod ="";
bestWorsParameter.setMerchGrupKod ="";

loadAllCombo();

setState(() {
});


}

}

