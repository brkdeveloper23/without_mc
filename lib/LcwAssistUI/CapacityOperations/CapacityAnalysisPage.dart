import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';

import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/GlobalWidget/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/Core/GlobalWidget/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportResponseDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/ResponseBase.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/CapacityOperations/CapacityFilterPage.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformanceDetailMetric.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


void main(){
  runApp(new MaterialApp(
    home:new CapacityAnalysisPage(),
  ));
}

class CapacityAnalysisPage extends StatefulWidget{

  @override
  CapacityAnalysisPageState createState() => new CapacityAnalysisPageState();
}

class CapacityAnalysisPageState extends State<CapacityAnalysisPage>  with TickerProviderStateMixin implements IsLcwAssistUIPage{

CapacityAnaliysisReportRequestDTO capacityParameter = new CapacityAnaliysisReportRequestDTO();
LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
StoreChooseListViewDTO currentStore;
bool sayfaYuklendiMi = false;
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

CapacityAnaliysisReportResponseDTO raporResult;
CapacityAnalysisMetricsFilterDTO raporFilterList;

//Floating buton için
    static const List<IconData> icons = const [  Icons.thumb_up, Icons.thumb_down ];
    static const List<Color> iconColors = const [ Color.fromRGBO(77,174,81, 1.0),Color.fromRGBO(255,99,71, 1.0) ];
    //static const List<Color> iconColors = const [ Colors.white,Colors.white ];
    //index == 0 ? Color.fromRGBO(255,99,71, 1.0) : Color.fromRGBO(77,174,81, 1.0),
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

SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
  }

Future<void> executeAfterBuild() async {
  
}


Future loaded(BuildContext context) async{
applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();

 //await new Future.delayed(const Duration(seconds: 2 ));
   setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

 currentStore = await applicationManager.serviceManager.storeChooseService.getCurrentStore();

 

capacityParameter.setAksesuarUrun = "";
capacityParameter.setBuyerGrupTanim = "";
capacityParameter.setMerchGrupKod = "";
capacityParameter.setMagazaKod = currentStore.storeCode;
capacityParameter.setMerchAltGrupKod = "";
capacityParameter.setMerchYasGrupKod = "";

await loadCapacityReport(capacityParameter);


sayfaYuklendiMi = true;
 setState(() {
  Navigator.pop(context);

 });

    }


  @override
Widget build(BuildContext context) {

    return new Scaffold(
      body: sayfaYuklendiMi == true ? storeReportPageBody() : Container(child: Text(''),),
      key: scaffoldState,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endDocked,
    floatingActionButton: Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),child: thisFloatActionButton(),),//thisFloatActionButton(),
    bottomNavigationBar:thisBottomNavigator(),
      //body: storeReportPageBody()

    );


    }

Widget resimYukle(){
 return Container(
    decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/deneme_rapor.png"),
            fit: BoxFit.fill,
          ),
        )
  );
}


    Widget yeniHeader(){
  return 
   
  Column(
     mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Card(child: 
Container(
  padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
  decoration:  BoxDecoration(
    border:  Border( 
       left:  BorderSide(width: 6.0, color:  Color.fromRGBO(0,116,198, 1.0)),
    )),
  child:
    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 10),child: 
    Column(children: <Widget>[
      Container(
  padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
  decoration:  BoxDecoration(
    border:  Border(
       bottom:  BorderSide(width: 0.5, color:  Colors.grey[400]),
    )),
  child: 
    Row(
      children: <Widget>[
    Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
    child: Icon(Icons.account_balance,
      color: LcwAssistColor.pageCardHeaderColor),),
    
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),child: 
        Text("Mağaza Bilgileri",style: TextStyle(color: LcwAssistColor.pageCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 17.0),),)
      
    ]))
    ,
        Row(
      
      children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),child: Text(applicationManager.currentLanguage.getmagazaAdi+' : ',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 17.0),),),
      
Expanded(child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),child: 
        Text(currentStore.storeName,style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 17.0),),)
      ,)
    ])
    
    ],),)
    ))    
    ],);
}




Widget storeReportPageBody(){

return 
new Column(
  children: <Widget>[
//      Column(
//      mainAxisSize: MainAxisSize.max,
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//       Card(child: 
//     Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child: 
//     Row(
      
//       children: <Widget>[
//     Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),child: Icon(Icons.account_balance,color: Colors.grey[700],size: 30,),),
//     Divider(color: Colors.red,),
//       Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),child: Text(applicationManager.currentLanguage.getmagazaAdi+' : ',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 17.0),),),
      
// Expanded(child: 
//         Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
//         Text(currentStore.storeName,style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,
//         fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 17.0),),)
//       ,)
//     ]),)
//     )


//     ],),

Padding(padding: EdgeInsets.fromLTRB(6, 0, 6, 0),child: yeniHeader(),),


    Expanded(child: 
      SingleChildScrollView(
                child: 
Column(children: <Widget>[
new GestureDetector(
  onTap:() =>detayaGit(),
  //behavior: HitTestBehavior.opaque,
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(239,138,14, 1.0),
 applicationManager.currentLanguage.gettoplamFiiliDolulukBDHaric,raporResult.toplamFiiliDolulukLCM,false)),
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,116,198, 1.0),  applicationManager.currentLanguage.getnetNihaiLCMDoluluk,raporResult.netNihaiLCMDoluluk,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(54,163,247, 1.0), applicationManager.currentLanguage.getreyonDolulukLCM,raporResult.reyonDolulukLCM,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(100,105,188, 1.0),applicationManager.currentLanguage.getdepoDolulukLCM,raporResult.depoDolulukLCM,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(196,66,88, 1.0),  applicationManager.currentLanguage.getonayLimiti,raporResult.onayLimiti,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(38,137,116, 1.0), applicationManager.currentLanguage.gettoplamKapLCMNetNihaiKapLCM,raporResult.toplamKapOverNetNihai,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,162,181, 1.0),  applicationManager.currentLanguage.getreyonStokAdet,raporResult.reyonStokAdet,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(54,163,247, 1.0), applicationManager.currentLanguage.getdepoStokAdet,raporResult.depoStokAdet,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,116,198, 1.0),  applicationManager.currentLanguage.gettoplamStokAdet,raporResult.toplamStokAdet,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(239,138,14, 1.0), applicationManager.currentLanguage.getson7gunSatisAdet,raporResult.sonYediGunSatis,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(100,105,188, 1.0),applicationManager.currentLanguage.getfiiliCover,raporResult.fiiliCover,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(196,66,88, 1.0),  applicationManager.currentLanguage.getyolStokAdet,raporResult.yolStokAdet,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(38,137,116, 1.0), applicationManager.currentLanguage.getonayliOnyasizRezerveAdet,raporResult.onayliOnaysizRezerveAdet,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,162,181, 1.0),  applicationManager.currentLanguage.gettransferINOUT,raporResult.transferInOut,false),

// Container(
//   decoration:  BoxDecoration(
//     border:  Border(
//       bottom:  BorderSide(width: 3.0, color:  LcwAssistColor.cardLineColor)//Color.fromRGBO(182,0,62, 1.0))
//     )) 
// ),
],)

  ),)
  ],
);
}

void detayaGit(){

    var route = new MaterialPageRoute(
            builder: (BuildContext context) => ProductPerformanceDetailMetric()
          );

    Navigator.of(context).push(route);

}

Widget storeReportPageBody2(){
      return

       Container(
         color: LcwAssistColor.thirdColor,
         child: Column(children: <Widget>[
Column(
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
      Padding(padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),child: Text(applicationManager.currentLanguage.getmagazaKodu+ " : ",style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),),
      Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),child: Text(currentStore.storeCode,style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),)
    ],),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),child: Text(applicationManager.currentLanguage.getmagazaAdi+' : ',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),),
      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),child: Text(currentStore.storeName,style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),)
    ],),

  ],),
)

     ],)

        ],
      ),
    





           
// Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//      Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[

// Container(
// height: 75.0,
// width: 75.0,
//   child:
// Padding(child: Image.asset('assets/store_image.png',fit: BoxFit.cover,),padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),),),
// Container(
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//     Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//       Padding(padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),child: Text('Mağaza Kodu: ',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),),
//       Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),child: Text(currentStore.storeCode,style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),)
//     ],),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//       Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),child: Text('Mağaza Adı: ',style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),),
//       Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),child: Text(currentStore.storeName,style: TextStyle(color: LcwAssistColor.reportCardSubHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 15.0,fontWeight: FontWeight.bold),),)
//     ],),

//   ],),
// )

//      ],)

//         ],
//       ),
//     )
 
 Expanded(flex: 70,child: Container(color: Colors.grey[100],child: Padding(padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),child: buildPageView(),),),),
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
    //padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
    child: Column(
    children: <Widget>[
      Expanded(child: Padding(child: satirlar[0],padding: EdgeInsets.all(10.0),)),
      Expanded(child: Padding(child: satirlar[1],padding: EdgeInsets.all(10.0),)),
      Expanded(child: Padding(child: satirlar[2],padding: EdgeInsets.all(10.0),)),
      //Expanded(child: satirlar[1]),
      //Expanded(child: satirlar[2]),
    ],
  ));
}

Widget buildPageView() {

List<Widget> sayfa1 = new List<Widget>();

sayfa1.add(Row (children: <Widget>[
  Expanded(child :
  
  LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.gettoplamFiiliDolulukBDHaric,raporResult.toplamFiiliDolulukLCM,false),//,false,context)
  
  ),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getnetNihaiLCMDoluluk,raporResult.netNihaiLCMDoluluk,false))],));

sayfa1.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getreyonDolulukLCM,raporResult.reyonDolulukLCM,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getdepoDolulukLCM,raporResult.depoDolulukLCM,false))],));


sayfa1.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getonayLimiti,raporResult.onayLimiti,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.gettoplamKapLCMNetNihaiKapLCM,raporResult.toplamKapOverNetNihai,false))],));


//SAYFA 2

List<Widget> sayfa2 = new List<Widget>();

sayfa2.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getreyonStokAdet,raporResult.reyonStokAdet,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getdepoStokAdet,raporResult.depoStokAdet,false))],));
sayfa2.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.gettoplamStokAdet,raporResult.toplamStokAdet,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getson7gunSatisAdet,raporResult.sonYediGunSatis,false))],));
sayfa2.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getfiiliCover,raporResult.fiiliCover,false)),
  Expanded(child :Text(''))],));



List<Widget> sayfa3 = new List<Widget>();

sayfa3.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getyolStokAdet,raporResult.yolStokAdet,false)),
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.getonayliOnyasizRezerveAdet,raporResult.onayliOnaysizRezerveAdet,false))],));
sayfa3.add(Row (children: <Widget>[
  Expanded(child :LcwAssistCustomWidgets.tutarCardDikey(applicationManager.currentLanguage.gettransferINOUT,raporResult.transferInOut,false)),
  Expanded(child :Text(''))],));

sayfa3.add(Row (children: <Widget>[
  Expanded(child :Text('')),
  Expanded(child :Text(''))],));

return PageView(
      children: [
        sayfa(sayfa1),
        sayfa(sayfa2),
        sayfa(sayfa3),
      ],
    );

}

Future loadCapacityReport(CapacityAnaliysisReportRequestDTO parameter) async{

//CapacityAnaliysisReportResponseDTO result = await applicationManager.serviceManager.capacityAnaliysisService.capacityAnalysisMetrics(parameter);

ParsedResponse responseCapacityMetrics = await applicationManager.serviceManager.capacityAnaliysisService.capacityAnalysisMetrics(parameter);
//raporResult = result;

ParsedResponse responseCapacityFilterList = await applicationManager.serviceManager.capacityAnaliysisService.capacityAnalysisMetricsFilters();
//raporFilterList = await applicationManager.serviceManager.capacityAnaliysisService.capacityAnalysisMetricsFilters();

if(responseCapacityMetrics.statusCode == 200)
raporResult = responseCapacityMetrics.body;
else
{
  await applicationManager.utils.resultApiStatus(context, responseCapacityMetrics.statusCode, applicationManager.currentLanguage);
  return;
}

if(responseCapacityFilterList.statusCode == 200)
raporFilterList = responseCapacityFilterList.body;
else
{
  await applicationManager.utils.resultApiStatus(context, responseCapacityFilterList.statusCode, applicationManager.currentLanguage);
  return;
}

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
  backgroundColor: LcwAssistColor.floatingButtonColor,
      child: const Icon(Icons.filter_list), onPressed: () {_openFilterDialog();},);
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
                backgroundColor: Colors.white,//index == 0 ? Color.fromRGBO(255,99,71, 1.0) : Color.fromRGBO(77,174,81, 1.0),
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

void _openFilterDialog() async{
//  CapacityAnaliysisReportRequestDTO  result = await  Navigator.of(context).push(new MaterialPageRoute<Null>(
//       builder: (BuildContext context) {
//         return new CapacityFilterPage(storesResponse:this.raporFilterList);
//       },
//     fullscreenDialog: true
//   ));

var result = null;

result =  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CapacityFilterPage(storesResponse:this.raporFilterList,capacityParameter:this.capacityParameter)),
  );
  
capacityParameter = result ?? capacityParameter;
// capacityParameter = await 
// Navigator.of(context).push(new MaterialPageRoute<Null>(
//       builder: (BuildContext context) {
//         return new CapacityFilterPage(storesResponse:this.raporFilterList,capacityParameter:this.capacityParameter);
//       },
//     fullscreenDialog: true
//   ));

if(capacityParameter != null){
  capacityParameter.setMagazaKod = currentStore.storeCode;

   setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});


await loadCapacityReport(capacityParameter);

 setState(() {
  Navigator.pop(context);
 });

if(raporResult == null){
sayfaYuklendiMi = false;
LcwAssistAlertDialogInfo(applicationManager.currentLanguage.getuyari, applicationManager.currentLanguage.getaradiginizKriterlerdeDataBulunamadi, applicationManager.currentLanguage.gettamam, context, LcwAssistDialogType.warning);
}else
{
  sayfaYuklendiMi = true;
}

setState(() {  
});
}
  //LcwAssistSnackBarDialogInfo(result.getAksesuarUrun,scaffoldState,LcwAssistSnagitType.info).snackbarShow();
}

}

