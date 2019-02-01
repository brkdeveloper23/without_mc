import 'package:flutter/material.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AssistReportTable extends StatelessWidget {

final CurrentLangugeDTO currentLanguage;

const AssistReportTable({ Key key, this.currentLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
new Expanded(child: SingleChildScrollView(
                child:
Column(children: <Widget>[
// satir(Color.fromRGBO(239,138,14, 1.0),  currentLanguage.getsatisTutarKDVsiz,raporResult.bY_SatisTutar_KDVsiz,false),
// satir(Color.fromRGBO(0,116,198, 1.0),   currentLanguage.gettutarBuyume,raporResult.tutarBuyume,false),
// satir(Color.fromRGBO(54,163,247, 1.0),  currentLanguage.getsatisTutarGY_KDVsiz,raporResult.gY_SatisTutar_KDVsiz,false),
// satir(Color.fromRGBO(100,105,188, 1.0), currentLanguage.gethedefTutar,raporResult.bY_HedefTutar,false),
// satir(Color.fromRGBO(196,66,88, 1.0),   currentLanguage.gethedefTutarYuzdesi,raporResult.magazaHedefTutturmaYuzdesi,false),
// satir(Color.fromRGBO(38,137,116, 1.0),  currentLanguage.getsatisAdet,raporResult.bY_SatisAdet,false),
// satir(Color.fromRGBO(0,162,181, 1.0),   currentLanguage.getadetBuyume,raporResult.adetBuyume,false),
// satir(Color.fromRGBO(54,163,247, 1.0),  currentLanguage.getsatisAdetGY,raporResult.gY_SatisAdet,false),
// satir(Color.fromRGBO(0,116,198, 1.0),   currentLanguage.getconversionRate,raporResult.conversionRate,false),
// satir(Color.fromRGBO(239,138,14, 1.0),  currentLanguage.getmusteriZiyareySayisi,raporResult.magazaTrafik,false),
// satir(Color.fromRGBO(100,105,188, 1.0), currentLanguage.getsepetBuyukluguAdet,raporResult.sepetBuyukAdet,false),
// satir(Color.fromRGBO(196,66,88, 1.0),   currentLanguage.getsepetBuyukluguTutarKDVsiz,raporResult.sepetBuyukTutarKDVsiz,false),
// satir(Color.fromRGBO(38,137,116, 1.0),  currentLanguage.getstokDevirHizi,raporResult.stokDevirHizi,false),
// satir(Color.fromRGBO(0,162,181, 1.0),   currentLanguage.getM2Verimlilik,raporResult.m2Verimlilik,false),

],)

  ),
);
  }



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