import 'package:flutter/material.dart';
import 'package:lcwassist/DataAccess/WidgetDto.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';

class LcwAssistCustomWidgets{

static Widget tutarUcluCardAltAlta(List<UcluCardTextDTO> ucluKartText, bool isThereDetail){
 
  return Card(
    child:

    Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
      decoration:  BoxDecoration(
    border:  Border(
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    )),
      child:
    Column(
// mainAxisSize: MainAxisSize.max,
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

          Row(
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child: Text(ucluKartText[0].masterText,style: LcwAssistTextStyle.reportCardHeaderTextStyle,),),
            Container(child: Icon(Icons.arrow_forward,color: LcwAssistColor.thirdColor,),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child: Text(ucluKartText[0].subText,style:LcwAssistTextStyle.reportCardsubHeaderTextStyle))
            ],),


Row(
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Text(ucluKartText[1].masterText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,decoration: TextDecoration.underline,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor)),),//,color: LcwAssistColor.secondaryColor)),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Icon(Icons.arrow_forward,color: LcwAssistColor.thirdColor,),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Text(ucluKartText[1].subText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,decoration: TextDecoration.underline,fontFamily:  LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardSubHeaderColor)))//,color: LcwAssistColor.thirdColor)))
            ],),


Row(
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Text(ucluKartText[2].masterText,style: LcwAssistTextStyle.reportCardHeaderTextStyle),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Icon(Icons.arrow_forward,color: LcwAssistColor.thirdColor,),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Text(ucluKartText[2].subText,style: LcwAssistTextStyle.reportCardsubHeaderTextStyle))
            ],)


        ,
 isThereDetail == true ? Row(
   mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    new GestureDetector(
  onTap: ()=>{},
  child: new Card(
    color: LcwAssistColor.yellowGreen,//color: LcwAssistColor.specialOrange,
    child: Row(children: <Widget>[Icon(Icons.more_horiz,color: Colors.white,),
    Text('Detaylar',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
    Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),)],)
    ,),
)
  ],
): Row(),

      ],
    ),
  )


  );

}

static Widget tutarCardYatay(Color colorR,String masterText,String subText, bool isThereDetail){

  return Card(
    child:
    Container(
      decoration:  BoxDecoration(
    border:  Border(
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 4.0, color:  LcwAssistColor.cardLineColor),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF))//Color.fromRGBO(182,0,62, 1.0))
    )),
      child:
    Column(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
Row(children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),child: Text(masterText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardHeaderColor)),),

           Container(child: Icon(Icons.arrow_forward,color: LcwAssistColor.thirdColor,),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),child: Text(subText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardSubHeaderColor)))
             ],),
             isThereDetail == true ? Row(
   mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    new GestureDetector(
  onTap: ()=>{},
  child: new Card(
    color: LcwAssistColor.yellowGreen,//LcwAssistColor.specialOrange,
    child: Row(children: <Widget>[Icon(Icons.more_horiz,color: Colors.white,),
    Text('Detaylar',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
    Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),)],)
    ,),
)
  ],
): Row()


    ],)

  ));
}

static Widget tutarUcluCardYanYana(List<UcluCardTextDTO> ucluKartText, bool isThereDetail){

  return Card(
    child:

    Container(
      decoration:  BoxDecoration(
    border:  Border(
      // top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      // left:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      // right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 3.0, color:  LcwAssistColor.cardLineColor)//Color.fromRGBO(182,0,62, 1.0))
    )),
      child:
    Column(
// mainAxisSize: MainAxisSize.max,
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(child: Container(
          child:
          Row(


            children: <Widget>[
Expanded(flex: 2,
child:
          Column(
             mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text(ucluKartText[0].masterText,textAlign: TextAlign.center,style: LcwAssistTextStyle.reportCardHeaderTextStyle),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text(ucluKartText[0].subText,textAlign: TextAlign.center,style:LcwAssistTextStyle.reportCardsubHeaderTextStyle))


            ],)),

Expanded(flex: 1,
child:
Column(
  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: Text(ucluKartText[1].masterText,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0,decoration: TextDecoration.underline,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.secondaryColor)),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text(ucluKartText[1].subText,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,decoration: TextDecoration.underline,fontFamily:  LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.thirdColor)))
            ],)),

Expanded(flex: 2,
child:
Column(
  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text(ucluKartText[2].masterText,textAlign: TextAlign.center,style: LcwAssistTextStyle.reportCardHeaderTextStyle),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text(ucluKartText[2].subText,textAlign: TextAlign.center,style: LcwAssistTextStyle.reportCardsubHeaderTextStyle))
            ],)),

            ]

            ),),
            ),
 isThereDetail == true ? Row(
   mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    new GestureDetector(
  onTap: ()=>{},
  child: new Card(
    color: LcwAssistColor.yellowGreen,//color: LcwAssistColor.specialOrange,
    child: Row(children: <Widget>[Icon(Icons.more_horiz,color: Colors.white,),
    Text('Detaylar',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
    Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),)],)
    ,),
)
  ],
): Row(),

      ],
    ),
  )


  );

}

static Widget tutarCardDikey(String masterText,String subText, bool isThereDetail){

  return Card(
    // shape: BeveledRectangleBorder(
    //             borderRadius: BorderRadius.circular(5.0),
    //           ),
    child:
    Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      decoration:  BoxDecoration(
        //borderRadius: BorderRadius.circular(10.0),
    border:  Border(
      // top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      // left:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      // right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 3.0, color:  LcwAssistColor.cardLineColor)//Color.fromRGBO(182,0,62, 1.0))
    )),
      child:
    Column(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
Column(
  children: <Widget>[
            Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text(masterText,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardHeaderColor)),)            ],),
              Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text(subText,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardSubHeaderColor)))
             ],),
             isThereDetail == true ? Row(
   mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    new GestureDetector(
  onTap: ()=>{},
  child: new Card(
    color: LcwAssistColor.yellowGreen,//LcwAssistColor.specialOrange,
    child: Row(children: <Widget>[Icon(Icons.more_horiz,color: Colors.white,),
    Text('Detaylar',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
    Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),)],)
    ,),
)
  ],
): Row()


    ],)

  ));
}

}