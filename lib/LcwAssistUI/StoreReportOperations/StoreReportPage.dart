import 'package:flutter/material.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/ScatterPlotComboLineChart.dart';
import 'package:lcwassist/Core/GlobalWidget/ChartWidgets/StackedAreaLineChart.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreReportResponseDTO.dart';
import 'package:lcwassist/DataAccess/WidgetDto.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';

import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';


void main(){
  runApp(new MaterialApp(
    home:new StoreReportPage(),
  ));
}

class StoreReportPage extends StatefulWidget{

  @override
  StoreReportPageState createState() => new StoreReportPageState();
}

class StoreReportPageState extends State<StoreReportPage>  with TickerProviderStateMixin{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
Stores currentStore;
bool sayfaYuklendiMi = false;

StoreReportResponseDTO raporResult;

//Floating buton için
    static const List<IconData> icons = const [  Icons.thumb_up, Icons.thumb_down ];
    static const List<Color> iconColors = const [ Colors.green,Colors.red ];
    AnimationController _controller;
/////////////////


  @override
  void initState() {
super.initState();

//Floating buton için
    _controller = new AnimationController(vsync: this,
      duration: const Duration(milliseconds: 500),
    );
///////////////////////

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));


  }



Future loaded(BuildContext context) async{

 //await new Future.delayed(const Duration(seconds: 2 ));
   setState(() {
LcwAssistLoading.showAlert(context);
});

 currentStore = await applicationManager.serviceManager.storeChooseService.getCurrentStore();
 
 StoreReportRequestDTO parameter = new StoreReportRequestDTO();
 parameter.setStoreRef = 654;
 parameter.setFilterDonem = "YTD";

 loadStoreReport(parameter);


 await new Future.delayed(const Duration(seconds: 2 ));
sayfaYuklendiMi = true;
 setState(() {
  Navigator.pop(context);
  
 });


    }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: sayfaYuklendiMi == true ? storeReportPageBody() : Container(child: Text(''),),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.endDocked,
    floatingActionButton: Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),child: buildFloatingButtonHasSub(),),//thisFloatActionButton(),
    bottomNavigationBar:thisBottomNavigator(),
      //body: storeReportPageBody()

    );
    
    
    }

Widget storeReportPageBody(){
      return
            
       Container(child: Column(children: <Widget>[
Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
     Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
       children: <Widget>[

Container(
height: 75.0,
width: 75.0,
  child: 
Padding(child: Image.asset('assets/store_image.png',fit: BoxFit.cover,),padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),),),
Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),child: Text('Mağaza Kodu: ',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),),
      Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),child: Text(currentStore.storeCode,style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),)
    ],),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),child: Text('Mağaza Adı: ',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),),
      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),child: Text(currentStore.storeName,style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),)
    ],),
    
  ],),
)

     ],)
    
        ],
      ),
    )

 ,
 Expanded(flex: 70,child: Container(color: LcwAssistColor.backGroundColor,child: Padding(padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),child: buildPageView(),),),),
 Expanded(flex: 1,child: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        alignment: Alignment.centerRight,
        color: LcwAssistColor.backGroundColor,
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset('assets/diagram1.png')
          ],
        ),),)
 

      ]));
    }

Widget sayfa(List<Widget> satirlar){
    return Container(
    child: Column(
    children: <Widget>[
      Expanded(child: satirlar[0]),
      Expanded(child: satirlar[1]),
      Expanded(child: satirlar[2]),
    ],
  ));
}

Widget buildPageView() {

List<UcluCardTextDTO> sayfaBirSatir1 = new List<UcluCardTextDTO>();
sayfaBirSatir1.add(new UcluCardTextDTO('Satış Tutar(KDVsiz)',raporResult.bY_SatisTutar_KDVsiz));
sayfaBirSatir1.add(new UcluCardTextDTO('Tutar Büyüme',raporResult.tutarBuyume));
sayfaBirSatir1.add(new UcluCardTextDTO('Satış Tutar GY(KDVsiz)',raporResult.gY_SatisTutar_KDVsiz));

List<UcluCardTextDTO> sayfaBirSatir3 = new List<UcluCardTextDTO>();
sayfaBirSatir3.add(new UcluCardTextDTO('Satış Adet',raporResult.bY_SatisAdet));
sayfaBirSatir3.add(new UcluCardTextDTO('Adet Büyüme',raporResult.adetBuyume));
sayfaBirSatir3.add(new UcluCardTextDTO('Satış Adet GY',raporResult.gY_SatisAdet));

List<Widget> sayfa1 = new List<Widget>();
sayfa1.add(Row (children: <Widget>[Expanded(child :LcwAssistCustomWidgets.tutarUcluCardYanYana(sayfaBirSatir1,false))],));

sayfa1.add(Row (children: <Widget>[Expanded(child :LcwAssistCustomWidgets.tutarUcluCardYanYana(sayfaBirSatir3,false))],));

sayfa1.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('Hedef Tutar',raporResult.bY_HedefTutar,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('Hedef Tut. Yüz',raporResult.magazaHedefTutturmaYuzdesi,false))],));


//SAYFA 2

List<Widget> sayfa2 = new List<Widget>();

sayfa2.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('Conversion Rate',raporResult.conversionRate,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('Müş. Ziy. Say',raporResult.magazaTrafik,false))],));
sayfa2.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('Sep Büy.Adet',raporResult.sepetBuyukAdet,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('Sepet Büy. Tutar(KDVsiz)',raporResult.sepetBuyukTutarKDVsiz,false))],));
sayfa2.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('Stok Devir Hızı',raporResult.stokDevirHizi,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey('M2 Verimlilik',raporResult.m2Verimlilik,false))],));



return PageView(
      children: [
        sayfa(sayfa1),
        sayfa(sayfa2),
      ],
    );

// return ListView
// (
//   children: <Widget>[
//     LcwAssistCustomWidgets.tutarUcluCardAltAlta(LcwAssistColor.thirdColor,sayfaBirSatir1,false),
//     LcwAssistCustomWidgets.tutarUcluCardAltAlta(LcwAssistColor.thirdColor,sayfaBirSatir3,false),
    
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'Hedef Tutar',raporResult.bY_HedefTutar,false),
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'Hedef Tut. Yüz',raporResult.magazaHedefTutturmaYuzdesi,false),
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'Conversion Rate',raporResult.conversionRate,false),
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'Müş. Ziy. Say',raporResult.magazaTrafik,false),
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'Sep Büy.Adet',raporResult.sepetBuyukAdet,false),
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'Sepet Büy. Tutar(KDVsiz)',raporResult.sepetBuyukTutarKDVsiz,false),
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'Stok Devir Hızı',raporResult.stokDevirHizi,false),
// LcwAssistCustomWidgets.tutarCardYatay(LcwAssistColor.thirdColor,'M2 Verimlilik',raporResult.m2Verimlilik,false),
  
//   ],
// );


}

Future loadStoreReport(StoreReportRequestDTO parameter) async{

StoreReportResponseDTO result = await applicationManager.serviceManager.storeChooseService.storeReport(parameter);
raporResult = result;
String asd = result.conversionRate;

}

Widget thisBottomNavigator() {
  return
   BottomAppBar(
      color: Colors.white,//Color.fromRGBO(44, 152, 240, 1.0),
      //shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           IconButton(icon: Icon(Icons.menu,color: Colors.white,), onPressed: () {},),
          // IconButton(icon: Icon(Icons.search), onPressed: () {},),
        ],
      ),
    );
}

Widget thisFloatActionButton(){
return FloatingActionButton(
      child: const Icon(Icons.star), onPressed: () {},);
    }

Widget buildFloatingButtonHasSub() {
  return  new Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(
                  0.0,
                  1.0 - index / icons.length / 2.0,
                  curve: Curves.easeOut
                ),
              ),
              child: new FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.white,
                mini: false,
                child: new Icon(icons[index],  color: iconColors[index]),
                onPressed: () { },
              ),
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            heroTag: null,
            backgroundColor: LcwAssistColor.floatingButtonColor,//Color.fromRGBO(44,45,58,1.0),
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 1 *3.14),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.filter_list : Icons.close,size: 35.0,),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
      );
  }

}

