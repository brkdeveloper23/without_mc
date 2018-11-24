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
    home:new LcvAssistTema(),
  ));
}

class LcvAssistTema extends StatefulWidget{

  @override
  LcvAssistTemaState createState() => new LcvAssistTemaState();
}

class LcvAssistTemaState extends State<LcvAssistTema>{

StoreChooseService storeChooseService = new StoreChooseService();
String selectedStoreName = "";

  @override
  void initState() {
super.initState();


  }



  @override
  Widget build(BuildContext context) {
 
    return new Scaffold(
      body:Container(child: Column(children: <Widget>[

         RaisedButton(child: Text('Tema Mavi'),onPressed: () =>temalar(1),),
         RaisedButton(child: Text('Tema Füme'),onPressed: () =>temalar(2),),
         RaisedButton(child: Text('Tema Mor'),onPressed: () =>temalar(3),),
         

      ],)), 
    );
}

void temalar(int tema){



setState(() {
if(tema == 1){
  LcwAssistColor.primaryColor =  Color.fromRGBO(8,112,211,1.0);
LcwAssistColor.secondaryColor = Color.fromRGBO(1,95,190,1.0);
}else if(tema == 2){
  LcwAssistColor.primaryColor = Color.fromRGBO(25,36,56,1.0);
LcwAssistColor.secondaryColor =  Color.fromRGBO(18,26,41,1.0);
}else if(tema == 3){
  LcwAssistColor.primaryColor = Color.fromRGBO(77,40,191,1.0);
LcwAssistColor.secondaryColor =  Color.fromRGBO(103,53,255,1.0);
}
});

}


}

