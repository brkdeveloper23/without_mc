import 'package:flutter/material.dart';

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


void main(){
  runApp(new MaterialApp(
    home:new CapacityFilterPage(),
  ));
}

class CapacityFilterPage extends StatefulWidget{

  final CapacityAnalysisMetricsFilterDTO storesResponse;
  CapacityFilterPage({Key key, @required this.storesResponse}) : super(key: key);

  @override
  CapacityFilterPageState createState() => new CapacityFilterPageState(storesResponse:storesResponse);
}

class CapacityFilterPageState extends State<CapacityFilterPage>  with TickerProviderStateMixin{

final CapacityAnalysisMetricsFilterDTO storesResponse;
CapacityFilterPageState({Key key, @required this.storesResponse});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();




List<String> aksesuarUrunList = new List<String>();
String aksesuarUrun="";

List<MerchMarkaYasGrupDTO> listMerchMarkaYasGrupDTO = new List<MerchMarkaYasGrupDTO>();
MerchMarkaYasGrupDTO listSelectedMerchMarkaYasGrupDTO;

List<MerchAltGroupDTO> listMerchAltGroupDTO = new List<MerchAltGroupDTO>();
MerchAltGroupDTO listSelectedMerchAltGroupDTO;

List<BuyerGrupTanimDTO> listBuyerGrupTanimDTO = new List<BuyerGrupTanimDTO>();
BuyerGrupTanimDTO listSelectedBuyerGrupTanimDTO;

List<AksesuarUrunDTO> listAksesuarUrunDTO = new List<AksesuarUrunDTO>();
AksesuarUrunDTO listSelectedAksesuarUrunDTO;

loadMerchMarkaYasGrupKodList(){

List<String> merchMarkaYasGrupKodList = new List<String>();
merchMarkaYasGrupKodList = storesResponse.merchHierarchiesList.map((f)=> f.merchMarkaYasGrupKod.toString()).toList();

 int count = 0;

 listMerchMarkaYasGrupDTO.add(MerchMarkaYasGrupDTO(kod: count,tanim: "TÜMÜ"));
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

loadMerchAltGrupKodList(){
List<String> merchAltGrupKodList = new List<String>();

merchAltGrupKodList = storesResponse.merchHierarchiesList.map((f)=> f.merchAltGrupKod.toString()).toList();

 int count = 0;

 listMerchAltGroupDTO.add(MerchAltGroupDTO(kod: count,tanim: "TÜMÜ"));
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

 listBuyerGrupTanimDTO.add(BuyerGrupTanimDTO(kod: count,tanim: "TÜMÜ"));
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

loadAksesuarUrunList(){

List<String> buyerGrupTanimList = new List<String>();

aksesuarUrunList = storesResponse.merchHierarchiesList.map((f)=> f.aksesuarUrun.toString()).toList();

 int count = 0;

 listAksesuarUrunDTO.add(AksesuarUrunDTO(kod: count,tanim: "TÜMÜ"));
 listSelectedAksesuarUrunDTO = listAksesuarUrunDTO[0];
 count++;
for(final i in buyerGrupTanimList)
{
  //Distinct yaptık.
  if(!listAksesuarUrunDTO.map((f)=> f.tanim.toString()).toList().contains(i))
  {
  listAksesuarUrunDTO.add(AksesuarUrunDTO(kod: count,tanim: i));
  count++;
  }
}
}


  @override
  void initState() {
super.initState();

loadMerchMarkaYasGrupKodList();
loadMerchAltGrupKodList();
loadBuyerGrupTanimList();
loadAksesuarUrunList();

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
  }

Future loaded(BuildContext context) async{

    }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: LcwAssistColor.backGroundColor,
      appBar: new AppBar(
        title: const Text('Kapasite Filtre'),
     
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

Padding(padding: EdgeInsets.all(4.0),child: Row(children: <Widget>[
  
  Expanded(flex: 7,child: RaisedButton(onPressed: ()=>{},color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.done,color: Colors.white,),Text('FİLTRELE',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)],),),),
Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0)),
  Expanded(flex: 5,child: RaisedButton(onPressed: ()=>{},color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.clear_all,color: Colors.white),Text('TEMİZLE',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily))],),),)

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

}

