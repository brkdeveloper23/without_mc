import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/GlobalWidget/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/Core/GlobalWidget/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/BestWorstOptionsDTOs/BestWorstOptionListResponseList.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsRequest.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/UcluCardTextDTO.dart';
import 'package:lcwassist/DataAccess/ResponseBase.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricsOperations.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
void main(){
  runApp(new MaterialApp(
    home:new BestWorstProductList(),
  ));
}
class BestWorstProductList extends StatefulWidget {

final List<BestWorstOptionListResponseList> bestWorstOptionList;
final LcwAssistApplicationManager applicationManager;
BestWorstProductList({Key key, @required this.bestWorstOptionList, @required this.applicationManager}) : super(key: key);


  @override
  BestWorstProductListState createState() => new BestWorstProductListState(bestWorstOptionList: bestWorstOptionList,applicationManager: applicationManager);
}
class BestWorstProductListState extends State<BestWorstProductList> with TickerProviderStateMixin implements IsLcwAssistUIPage{ 

final List<BestWorstOptionListResponseList> bestWorstOptionList;
  BestWorstProductListState({Key key, @required this.bestWorstOptionList, @required this.applicationManager});

LcwAssistApplicationManager applicationManager;
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

bool sayfaYuklendiMi = false;

@override
void initState() {
    super.initState();
sayfaYuklendiMi = false;

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
  }


  Future loaded(BuildContext context) async{
  
    sayfaYuklendiMi = true;
    
}

  Future<void> executeAfterBuild() async {
  
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      key: scaffoldState,
      appBar: AppBar(title: Text(applicationManager.currentLanguage.getbestWorstOptions),),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      backgroundColor: LcwAssistColor.backGroundColor,
      body: storeReportPageBody()//sayfaYuklendiMi == true ? (currentPageStyle == true ? storeReportPageBody() : ekranYerlesim()) : Container(child: Text(''),),//
    );
    }


    Widget storeReportPageBody(){
return
SingleChildScrollView(
                child:
Column(
     mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Card(child: 
    Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),child: 
Column(children:gridRows()
)  
    )
    )
    ],));
}

    List<Widget> gridRows(){

List<String> kolonlar = 
[
  this.applicationManager.currentLanguage.getbestWorstListColumn0,
  this.applicationManager.currentLanguage.getbestWorstListColumn1,
  this.applicationManager.currentLanguage.getbestWorstListColumn2,
  this.applicationManager.currentLanguage.getbestWorstListColumn3,
  this.applicationManager.currentLanguage.getbestWorstListColumn4,
  this.applicationManager.currentLanguage.getbestWorstListColumn5,
];



List<Widget> rows = [];

//HEADER
rows.add(
    Container(
  padding: EdgeInsets.all(5.0),
  color: Color.fromRGBO(232,243,255,1.0)//(244,242,248, 1.0)
  ,child:
  Row(
      children: <Widget>[
Expanded(flex: 2,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[0],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
Expanded(flex: 2,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[1],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[2],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[3],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[4],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
        Text(kolonlar[5],style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,)
    ])),
  
);
//productMetricsResponse

//for (var i = 0; i < 10; i++) {
  int count = 0;
  for (var i in  bestWorstOptionList) {
  rows.add(
  Container(
  padding: EdgeInsets.all(5.0),
  color: count % 2 == 0 ? Color.fromRGBO(255,255,255, 1.0) : Color.fromRGBO(240,249,255,1.0)//Color.fromRGBO(247,251,255,1.0)//(250,248,252, 1.0)
  ,child:
  Row(
      children: <Widget>[
Expanded(flex: 2,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.getUrunAd.toString(),style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
Expanded(flex: 2,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.getModelKod+"/"+i.getRenkKod.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center,),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.getMerchMarkaYasGrupKod.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.getMerchAltGrupKod.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        Text(i.getBuyerGrupTanim.toString() ?? "",style: TextStyle(color: LcwAssistColor.reportCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily),textAlign: TextAlign.center),)
      ,),
      Expanded(flex: 1,child: 
        Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: 
        IconButton(icon:  new Icon(Icons.play_circle_outline, color: Colors.blue[400],),onPressed:()=> showProductPerformansQueryPage(i),)
        
        ,)
      ,)
    ]))

  );
count++;
}

return rows;
}

   Future<void> showProductPerformansQueryPage(BestWorstOptionListResponseList productInfo) async{

  setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

ProductMetricsRequestDTO request = new ProductMetricsRequestDTO();

request.setModelCode = productInfo.getModelKod;
request.setColorCode = productInfo.getRenkKod;

request.setStoreCode = applicationManager.currentStore.storeCode;
request.setStoreRef = applicationManager.currentStore.depoRef.toString();//'671';
request.setCountryRef = applicationManager.currentStore.countryRef.toString() == "0" ? "48" : applicationManager.currentStore.countryRef.toString();
 
ProductMetricsResponse result;
ParsedResponse responseResult = await this.applicationManager.serviceManager.productSalesPerformanceService.productSalesPerformanceMetrics(request);

if(responseResult.statusCode == 200)
result = responseResult.body;
else
{
  await applicationManager.utils.resultApiStatus(context, responseResult.statusCode, applicationManager.currentLanguage);
  dispose();
  return;
}


 setState(() {
  Navigator.pop(context);
 });

if(result.product == null){
LcwAssistSnackBarDialogInfo(this.applicationManager.currentLanguage.geturunBulunamadi,scaffoldState,LcwAssistSnagitType.warning).snackbarShow();
 return;
 }

 var route = new MaterialPageRoute(
            builder: (BuildContext context) => ProductPerformansMetricsOperations(productMetricsResponse: result,
            applicationManager: this.applicationManager)
          );

          Navigator.of(context).push(route);

    }

}