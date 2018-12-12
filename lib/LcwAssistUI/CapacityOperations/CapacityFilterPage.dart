import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';

import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportResponseDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/MultiLangComboDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


void main(){
  runApp(new MaterialApp(
    home:new CapacityFilterPage(),
  ));
}

class CapacityFilterPage extends StatefulWidget{

  final CapacityAnalysisMetricsFilterDTO storesResponse;
  final CapacityAnaliysisReportRequestDTO capacityParameter;

  CapacityFilterPage({Key key, @required this.storesResponse,@required this.capacityParameter}) : super(key: key);

  @override
  CapacityFilterPageState createState() => new CapacityFilterPageState(storesResponse:storesResponse,capacityParameter: capacityParameter);
}

class CapacityFilterPageState extends State<CapacityFilterPage>  with TickerProviderStateMixin  implements IsLcwAssistUIPage{

final CapacityAnalysisMetricsFilterDTO storesResponse;
final CapacityAnaliysisReportRequestDTO capacityParameter;
CapacityFilterPageState({Key key, @required this.storesResponse,@required this.capacityParameter});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

List<String> aksesuarUrunList = new List<String>();
String aksesuarUrun="";

Color cardBackColor = Colors.grey[100];

List<MerchMarkaYasGrupDTO> listMerchMarkaYasGrupDTO = new List<MerchMarkaYasGrupDTO>();
MerchMarkaYasGrupDTO listSelectedMerchMarkaYasGrupDTO;

List<MerchAltGroupDTO> listMerchAltGroupDTO = new List<MerchAltGroupDTO>();
MerchAltGroupDTO listSelectedMerchAltGroupDTO;

List<BuyerGrupTanimDTO> listBuyerGrupTanimDTO = new List<BuyerGrupTanimDTO>();
BuyerGrupTanimDTO listSelectedBuyerGrupTanimDTO;

List<AksesuarUrunDTO> listAksesuarUrunDTO = new List<AksesuarUrunDTO>();
AksesuarUrunDTO listSelectedAksesuarUrunDTO;


loadAksesuarUrunList(){

List<String> buyerGrupTanimList = new List<String>();

aksesuarUrunList = storesResponse.merchHierarchiesList.map((f)=> f.aksesuarUrun.toString()).toList();

 int count = 0;

 listAksesuarUrunDTO.add(AksesuarUrunDTO(kod: count,tanim: applicationManager.currentLanguage.gettumu));
 listSelectedAksesuarUrunDTO = listAksesuarUrunDTO[0];
 count++;
for(final i in aksesuarUrunList)
{
  //Distinct yaptık.
  if(!listAksesuarUrunDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listAksesuarUrunDTO.add(AksesuarUrunDTO(kod: count,tanim: i));
  count++;
  }
}
}

loadMerchMarkaYasGrupKodList(List<String> akseduarKodList){

List<String> merchMarkaYasGrupKodList = new List<String>();

listMerchMarkaYasGrupDTO = new List<MerchMarkaYasGrupDTO>();

//if(aksesuarKod == ""){
merchMarkaYasGrupKodList = 
storesResponse.merchHierarchiesList
.where((i)=> akseduarKodList.contains(i.aksesuarUrun))
.map((f)=> f.merchMarkaYasGrupKod.toString()).toList();
//}
//else
//merchMarkaYasGrupKodList = storesResponse.merchHierarchiesList.where((i) => i.aksesuarUrun == aksesuarKod).map((f)=> f.merchMarkaYasGrupKod.toString()).toList();


 int count = 0;

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
storesResponse.merchHierarchiesList
.where((i)=> mercYasGrupKod.contains(i.merchMarkaYasGrupKod))
.map((f)=> f.merchAltGrupKod.toString()).toList();

 int count = 0;

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

loadBuyerGrupTanimList(){

List<String> buyerGrupTanimList = new List<String>();

buyerGrupTanimList = storesResponse.merchHierarchiesList.map((f)=> f.buyerGrupTanim.toString()).toList();

 int count = 0;

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




  @override
  void initState() {
super.initState();

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));

  }

Future loaded(BuildContext context) async{
  
applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
loadAllCombo();
}



Future<void> executeAfterBuild() async {
  applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
  setState(() {
      
    });
}

void loadAllCombo(){

loadAksesuarUrunList();
loadMerchMarkaYasGrupKodList(aksesuarUrunList);
loadMerchAltGrupKodList(listMerchMarkaYasGrupDTO.map((f)=> f.tanim.toString()).toList());
loadBuyerGrupTanimList();

listSelectedAksesuarUrunDTO = capacityParameter.getAksesuarUrun != "" ? listAksesuarUrunDTO.where((i) => i.tanim == capacityParameter.getAksesuarUrun).first : listAksesuarUrunDTO[0];
listSelectedBuyerGrupTanimDTO = capacityParameter.getBuyerGrupTanim != "" ? listBuyerGrupTanimDTO.where((i) => i.tanim == capacityParameter.getBuyerGrupTanim).first : listBuyerGrupTanimDTO[0];
listSelectedMerchAltGroupDTO = capacityParameter.getMerchAltGrupKod != "" ? listMerchAltGroupDTO.where((i) => i.tanim == capacityParameter.getMerchAltGrupKod).first : listMerchAltGroupDTO[0];
listSelectedMerchMarkaYasGrupDTO = capacityParameter.getMerchYasGrupKod != "" ? listMerchMarkaYasGrupDTO.where((i) => i.tanim == capacityParameter.getMerchYasGrupKod).first : listMerchMarkaYasGrupDTO[0];

}


  @override
  Widget build(BuildContext context) {
executeAfterBuild();
    return new Scaffold(
      backgroundColor: LcwAssistColor.backGroundColor,
      appBar: new AppBar(
        title: Text(applicationManager.currentLanguage.getkapasiteFiltre),
     
      ),
      body: filterBody()
    );


    }

    Widget filterBody(){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[


 Container(padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0) ,child: 




Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[

Card(
  color: cardBackColor,
child:
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Padding(child: Text(applicationManager.currentLanguage.getAUTSecin,style: TextStyle(fontSize: 15.0,color: LcwAssistColor.primaryColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),padding: EdgeInsets.fromLTRB(3, 3, 3, 3),),

Card(child: 
Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child:


DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: 

 new DropdownButton<AksesuarUrunDTO>(
            //hint: new Text(""),
            value: listSelectedAksesuarUrunDTO,
            onChanged: (AksesuarUrunDTO newValue) {

 List<String> e3we = new List<String>();
 e3we.add(newValue.tanim);

              loadMerchMarkaYasGrupKodList(e3we);
              loadMerchAltGrupKodList(listMerchMarkaYasGrupDTO.map((f)=> f.tanim.toString()).toList());

              loadBuyerGrupTanimList();
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
              setState(() {
                 List<String> e3we = new List<String>();
 e3we.add(listSelectedMerchMarkaYasGrupDTO.tanim);

                loadMerchAltGrupKodList(e3we);
                listSelectedMerchMarkaYasGrupDTO = newValue;
                chan(newValue.kod);
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
  
  Expanded(flex: 7,child: RaisedButton(onPressed: ()=>
  btnfilterClick(),
  
  color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.done,color: Colors.white,),Text(applicationManager.currentLanguage.getfiltrele,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)],),),),
  Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0)),
  Expanded(flex: 7,child: RaisedButton(onPressed: ()=>
  btnClean(),color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.clear_all,color: Colors.white),Text(applicationManager.currentLanguage.gettemizle,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily))],),),)

],)

,)

],)
 ),

        ],),
      );
    }

void chan(int value){

  setState(() {
    });

}


void btnfilterClick() async{

//CapacityAnaliysisReportRequestDTO asas= new CapacityAnaliysisReportRequestDTO();
capacityParameter.setAksesuarUrun = listSelectedAksesuarUrunDTO.tanim == listAksesuarUrunDTO[0].tanim ? "" : listSelectedAksesuarUrunDTO.tanim;
capacityParameter.setBuyerGrupTanim =listSelectedBuyerGrupTanimDTO.tanim == listBuyerGrupTanimDTO[0].tanim ? "" : listSelectedBuyerGrupTanimDTO.tanim;
capacityParameter.setMerchAltGrupKod = listSelectedMerchAltGroupDTO.tanim == listMerchAltGroupDTO[0].tanim ? "" : listSelectedMerchAltGroupDTO.tanim;
capacityParameter.setMerchYasGrupKod = listSelectedMerchMarkaYasGrupDTO.tanim == listMerchMarkaYasGrupDTO[0].tanim ? "" : listSelectedMerchMarkaYasGrupDTO.tanim;
capacityParameter.setMagazaKod = "";


//final aa = await SharedPreferences.getInstance();

//aa.setString(SharedPreferencesConstant.capacityFilter, json.encode(asas.toMap()));

Navigator.pop(context, capacityParameter);


}

void btnClean(){

capacityParameter.setAksesuarUrun =   ""; 
capacityParameter.setBuyerGrupTanim = ""; 
capacityParameter.setMerchAltGrupKod =""; 
capacityParameter.setMerchYasGrupKod ="";

loadAllCombo();


setState(() {
});


}


}

