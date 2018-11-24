import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsRequest.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricsOperations.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/SalesServiceOperations/ProductSalesPerformanceService.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:barcode_scan/barcode_scan.dart';
void main(){
  runApp(new MaterialApp(
    home:new ProductPerformansQueryPage(),
  ));
}


class ProductPerformansQueryPage extends StatefulWidget{

  @override
  ProductPerformansQueryPageState createState() => new ProductPerformansQueryPageState();
}

class ProductPerformansQueryPageState extends State<ProductPerformansQueryPage>{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

final _formKeyBarkodIleSorgulama = GlobalKey<FormState>();
final _formKeyModelColorSorgulama = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
ProductMetricsRequestDTO productMetricsRequest  = new ProductMetricsRequestDTO();
Stores selectedStore;
String selectedStoreName="";
final controllerBarcode = TextEditingController();
FocusNode _textBarcodeFocus = new FocusNode();
FocusNode _textModelCodeFocus = new FocusNode();
FocusNode _textColorCodeFocus = new FocusNode();

final controllerModelCode = TextEditingController();
final controllerColorCode = TextEditingController();






@override
void initState() {
super.initState();

currentStore().then((result) {
            setState(() {
                selectedStore = result;
            });
        });


controllerBarcode.text = '8681363743975';
//controllerModelCode.text = '8SJ450Z1';
//controllerColorCode.text = 'JPX';

controllerBarcode.addListener(onBarcodeChange); 
_textBarcodeFocus.addListener(onBarcodeChange);

controllerModelCode.addListener(onModelColorChange); 
controllerColorCode.addListener(onModelColorChange); 
_textModelCodeFocus.addListener(onModelColorChange);
_textColorCodeFocus.addListener(onModelColorChange);




    
  }

  @override
  Widget build(BuildContext context) {

// setState(() {
//    currentStore();
// });

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
       //appBar: AppBar(title: Text('Ürün Sorgulama'),),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      key: scaffoldState,
      backgroundColor: LcwAssistColor.backGroundColor,
      body: ekranYerlesim(),
    );
    }

Future showProductPerformanceMetricPage(ProductMetricsResponseType type) async{

if(type == ProductMetricsResponseType.writeBarcode)
 {if (!_formKeyBarkodIleSorgulama.currentState.validate())
 return;
 }

if(type == ProductMetricsResponseType.writeModelAndColor)
 {if (!_formKeyModelColorSorgulama.currentState.validate())
 return;
 }

if(type == ProductMetricsResponseType.scanBarcode){
String qrResult = await BarcodeScanner.scan();
this.productMetricsRequest.setBarcode = qrResult;
}



  setState(() {
LcwAssistLoading.showAlert(context);
});

ProductMetricsResponse result = await ProductSalesPerformanceService.productSalesPerformanceMetrics(fillToModel(type));

 setState(() {
  Navigator.pop(context);
 });


 //LcwAssistSnackBarDialogInfo(result.product.modelKod,scaffoldState,LcwAssistSnagitType.info).snackbarShow();

 var route = new MaterialPageRoute(
            builder: (BuildContext context) => ProductPerformansMetricsOperations(productMetricsResponse: result)
          );

          Navigator.of(context).push(route);

}

ProductMetricsRequestDTO fillToModel(ProductMetricsResponseType type){

if(type == ProductMetricsResponseType.writeBarcode)
this.productMetricsRequest.setBarcode = controllerBarcode.text;
else if(type != ProductMetricsResponseType.scanBarcode)
this.productMetricsRequest.setBarcode = '';

if(type == ProductMetricsResponseType.writeModelAndColor){
this.productMetricsRequest.setModelCode = controllerModelCode.text;
this.productMetricsRequest.setColorCode = controllerColorCode.text;
} else{
  this.productMetricsRequest.setModelCode =''; 
this.productMetricsRequest.setColorCode = '';
}

this.productMetricsRequest.setStoreCode = '';
this.productMetricsRequest.setStoreRef = selectedStore.depoRef.toString();//'671';
this.productMetricsRequest.setCountryRef = selectedStore.countryRef.toString();
return this.productMetricsRequest;
}

Widget ekranYerlesim(){
  return SingleChildScrollView(child: Column(

    children: <Widget>[
      Container(padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0), color: LcwAssistColor.backGroundColor,child: barkodIleSorgulamaCard(),),
      Container(padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),color: LcwAssistColor.backGroundColor,child: urunKoduIleSorgulamaCard(),),
      Container(padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),color: LcwAssistColor.backGroundColor,child: barkodTaraSorgulamaCard(),),
      
    ],
  ),);
}

Widget barkodIleSorgulamaCard(){
  return Form(
    key: _formKeyBarkodIleSorgulama,
    child: Container(
    child: Card(
      child: Column(
        children: <Widget>[
          
          Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Container(padding: EdgeInsets.all(5.0), child: Text('Barkod ile sorgula'),)]),
          Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),child: Image.asset('assets/barcode_40.png'),),
          ),
          Expanded(
            flex: 3,
            child: new TextFormField(
           focusNode: _textBarcodeFocus,
              validator: (value) {
              if (value.isEmpty) {
                return 'Boş Geçemezsiniz.';
              }
            },
      controller: controllerBarcode,
              decoration: InputDecoration(
                hintText: 'Barkod numarasını girin'
              ),
              keyboardType: TextInputType.number,
              maxLength: 13,
            ),
          ),
          Expanded(
            flex: 1,
            child: 
            GestureDetector(
        onTap: ()=>showProductPerformanceMetricPage(ProductMetricsResponseType.writeBarcode),
        child: Image.asset('assets/search_40.png')
            
            )
          )
        ],
      )
        ],
      ),
    ),
  )
  );
}

Widget urunKoduIleSorgulamaCard(){
  return
  Form(
    key: _formKeyModelColorSorgulama,
    child: 
   Container(
    child: Card(
      child: Column(
        children: <Widget>[
          
          Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Container(padding: EdgeInsets.all(5.0), child: Text('Barkod ile sorgula'),)]),
          Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),child: Image.asset('assets/barcode_gir_40.png'),),
          ),
          Expanded(
            flex: 3,
            child: Column(children: <Widget>[ 
              
              TextFormField(
                focusNode: _textModelCodeFocus,
                 validator: (value) {
              if (value.isEmpty) {
                return 'Boş Geçemezsiniz.';
              }
            },
      controller: controllerModelCode,
              decoration: InputDecoration(
                
                hintText: 'Ürün kodunu girin',

              ),
               //textCapitalization: TextCapitalization.sentences,
              maxLength: 8,
            ),
            TextFormField(
              focusNode: _textColorCodeFocus,
               validator: (value) {
              if (value.isEmpty) {
                return 'Boş Geçemezsiniz.';
              }
            },
      controller: controllerColorCode,
              decoration: InputDecoration(
                
                hintText: 'Renk kodunu girin'
              ),
              maxLength: 4,
            ),
            Padding(padding: EdgeInsets.all(5.0),)
            ],),
          ),
         Expanded(
            flex: 1,
            child: 
            GestureDetector(
        onTap: ()=>showProductPerformanceMetricPage(ProductMetricsResponseType.writeModelAndColor),
        child: Image.asset('assets/search_40.png')
            
            )
          )
        ],
      )
        ],
      ),
    ),
  ));
}

Widget barkodTaraSorgulamaCard(){
  return Container(
    child: Card(
      child: Column(
        children: <Widget>[
          
          Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Container(padding: EdgeInsets.all(5.0), child: Text('Barkod Tara'),)]),
          Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),child: Image.asset('assets/barcode_tara_80.png'),),
          ),
          Expanded(
            flex: 3,
            child: new Text('Kamera ile taratarak arama yapabilirsiniz.'),
          ),
          Expanded(
            flex: 1,
            child:             GestureDetector(
       onTap: ()=>showProductPerformanceMetricPage(ProductMetricsResponseType.scanBarcode),
        child: Image.asset('assets/search_40.png')
            
            )
          )
        ],
      )
        ],
      ),
    ),
  );
}

void onBarcodeChange(){

controllerModelCode.text = '';
controllerColorCode.text = '';
}

void onModelColorChange(){

controllerBarcode.text = '';
}

Future currentStore() async{

Stores stores;

stores = await applicationManager.serviceManager.storeChooseService.getCurrentStore();

selectedStoreName = stores.storeName;

return stores;
    }

}






