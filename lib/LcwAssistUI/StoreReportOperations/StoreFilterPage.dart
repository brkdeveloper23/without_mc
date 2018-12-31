import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';

import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportResponseDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/MultiLangComboDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportResponseDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


void main(){
  runApp(new MaterialApp(
    home:new StoreFilterPage(),
  ));
}

class StoreFilterPage extends StatefulWidget{

  final List<StorePeriodFilterDTO> storesDonemFilters;
  final StorePeriodFilterDTO storeCurrentFilterParameter;

  StoreFilterPage({Key key, @required this.storesDonemFilters,@required this.storeCurrentFilterParameter}) : super(key: key);

  @override
  StoreFilterPageState createState() => new StoreFilterPageState(storesDonemFilters:storesDonemFilters,storeCurrentFilterParameter: storeCurrentFilterParameter);
}

class StoreFilterPageState extends State<StoreFilterPage>  with TickerProviderStateMixin  implements IsLcwAssistUIPage{

final List<StorePeriodFilterDTO> storesDonemFilters;
final StorePeriodFilterDTO storeCurrentFilterParameter;


StoreFilterPageState({Key key, @required this.storesDonemFilters,@required this.storeCurrentFilterParameter});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

Color cardBackColor = Colors.grey[100];

StorePeriodFilterDTO listSelectedAksesuarUrunDTO;

loadAksesuarUrunList(){


//listSelectedAksesuarUrunDTO = storeCurrentFilterParameter ?? storesDonemFilters[0];


if(storeCurrentFilterParameter == null)
 listSelectedAksesuarUrunDTO = storesDonemFilters[0];
 else
 listSelectedAksesuarUrunDTO = storesDonemFilters.firstWhere((i) => i.id == storeCurrentFilterParameter.id);

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
  
applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();


 if(await applicationManager.utils.checkToTokenExpireRedirectToLogin(applicationManager.currentLanguage, context))
 {
   applicationManager.utils.navigateToLoginPage(context);
 return;
 }

loadAllCombo();
}



Future<void> executeAfterBuild() async {
  applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
  setState(() {
      
    });
}

void loadAllCombo(){

loadAksesuarUrunList();
}


  @override
  Widget build(BuildContext context) {
executeAfterBuild();
    return new Scaffold(
      backgroundColor: LcwAssistColor.backGroundColor,
      appBar: new AppBar(
        title: Text(applicationManager.currentLanguage.getmagazaKarne),
     
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

 new DropdownButton<StorePeriodFilterDTO>(
            //hint: new Text(""),
            value: listSelectedAksesuarUrunDTO,
            onChanged: (StorePeriodFilterDTO newValue) {
              setState(() {
                listSelectedAksesuarUrunDTO = newValue;
                chan(newValue.id);
              });
            },
            items: storesDonemFilters.map((StorePeriodFilterDTO user) {
              return new DropdownMenuItem<StorePeriodFilterDTO>(
                value: user,
                child: new Text(
                  user.deger,
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
  
  Expanded(child: RaisedButton(onPressed: ()=>
  btnfilterClick(),
  
  color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.done,color: Colors.white,),Text(applicationManager.currentLanguage.getfiltrele,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)],),),),
  Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0)),
  // Expanded(flex: 7,child: RaisedButton(onPressed: ()=>
  // btnClean(),color: LcwAssistColor.thirdColor,child: Row(children: <Widget>[Icon(Icons.clear_all,color: Colors.white),Text(applicationManager.currentLanguage.gettemizle,style: TextStyle(fontSize: 18.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily))],),),)

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

Navigator.pop(context, listSelectedAksesuarUrunDTO);

}

// void btnClean(){

// storeCurrentFilterParameter = 

// loadAllCombo();


// setState(() {
// });


// }





}

