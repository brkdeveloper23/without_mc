import 'package:flutter/material.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/DataAccess/WidgetDto.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AssistReportTable extends StatelessWidget {

final List<AssitReportDataDTO> assitReportData;
final Function onClick;

const AssistReportTable({ Key key, this.assitReportData, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return new //Text('data');
  SingleChildScrollView(
                child: 
getAllRow(this.assitReportData)
  );

  }

 
Widget getAllRow(List<AssitReportDataDTO> reportList)
  {

    List<Widget> list = new List<Widget>();

  int count = 0;
for (var item in reportList) {
  if(count ==  LcwAssistColor.reportCardColorList.length)
  count=0;

  list.add(satir(LcwAssistColor.reportCardColorList[count],  item.header,item.value,item.clickable));
count++;
}
    return new Column(children: list);
  }


  // List<Color> reportCardColorList = 
  // [Color.fromRGBO(239,138,14, 1.0),
  // Color.fromRGBO(0,116,198, 1.0,),
  // Color.fromRGBO(54,163,247, 1.0),
  // Color.fromRGBO(100,105,188, 1.0),
  // Color.fromRGBO(196,66,88, 1.0),
  // Color.fromRGBO(38,137,116, 1.0),
  // Color.fromRGBO(0,162,181, 1.0)
  // ];


  static Widget satir(Color lineColor,String masterText,String subText,bool hasDetail){

return Padding(
  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
  child: 
  Container(
  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
  decoration:  BoxDecoration(
    border:  Border(
       left:  BorderSide(width: 6.0, color:  lineColor),
    )),
  child: Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.stretch,

    children: <Widget>[
      //Text(masterText+masterText,style: TextStyle(fontSize: 15.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardHeaderColor))
      Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
        Text(masterText,style: TextStyle(fontSize: 17.0,fontFamily: 'Ubuntu',
        decoration: hasDetail ? TextDecoration.underline : null,
        color: hasDetail ? LcwAssistColor.linkColor : LcwAssistColor.reportCardHeaderColor),
        )
      ,hasDetail ? Icon(OMIcons.touchApp,size: 16.0,color: LcwAssistColor.linkColor,) : Text('')
      ],)
      ,Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),)
      ,Text(subText,style: TextStyle(fontSize: 19.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardSubHeaderColor))
                              
    ],
  ),
),
);

}
}