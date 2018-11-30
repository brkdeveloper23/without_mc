import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
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
    home:new HomeFeedBack(),
  ));
}

class HomeFeedBack extends StatefulWidget{

  @override
  HomeFeedBackState createState() => new HomeFeedBackState();
}

class HomeFeedBackState extends State<HomeFeedBack>  with TickerProviderStateMixin implements IsLcwAssistUIPage{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
Stores currentStore;
bool sayfaYuklendiMi = false;
final _formKeyBarkodIleSorgulama = GlobalKey<FormState>();
final _formKeyModelColorSorgulama = GlobalKey<FormState>();

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



 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));


  }
Future<void> executeAfterBuild() async {
  
}


Future loaded(BuildContext context) async{

 //await new Future.delayed(const Duration(seconds: 2 ));
 applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
   setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});


 //await new Future.delayed(const Duration(seconds: 2 ));
sayfaYuklendiMi = true;
 setState(() {
  Navigator.pop(context);
 });


    }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
       key: scaffoldState,
      body: sayfaYuklendiMi == true ? pageBody() : Container(child: Text(''),),
    );
    
    
    }

void mesaj(){
LcwAssistSnackBarDialogInfo('Feedback Alınmıştır.',scaffoldState,LcwAssistSnagitType.successful).snackbarShow();
}
    
    Widget pageBody(){

      return Center(

        child: Padding(
padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
child: 
new GestureDetector(
  onTap:() =>mesaj(),
  child:
Card(
child: Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Padding(
padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0)),
   Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[


         Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),child: Image.asset('assets/homepageFeedback_48.png'),),
        Container(
          width: MediaQuery.of(context).size.width*0.85,
          child: 
        new Wrap(
          spacing: 4.0,
                runSpacing: 4.0,
                children: <Widget>[

        Text(applicationManager.currentLanguage.geturunBagimliBagimsizFeedbackGonder,
        style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(88,159,255, 1.0),
        fontWeight: FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),
                ])
        ),
        
      ],
    ),

    Container(padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0), color: LcwAssistColor.backGroundColor,child: barkodIleSorgulamaCard(),),
      Container(padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),color: LcwAssistColor.backGroundColor,child: urunKoduIleSorgulamaCard(),),
      Container(padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),color: LcwAssistColor.backGroundColor,child: barkodTaraSorgulamaCard(),),
      Container(padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),color: LcwAssistColor.backGroundColor,child: urunBagimsizFeedbackCard(),),
      
   
    // Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),child: Image.asset('assets/homepageFeedback_256.png'),),
    // Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),child: 
    // Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: <Widget>[
    //     Text('Bir FeedBack Bırak',style: TextStyle(fontSize: 30.0,color: Color.fromRGBO(88,159,255, 1.0),fontWeight: FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),
    //     Icon(Icons.touch_app,color: Color.fromRGBO(88,159,255, 1.0),size: 30.0)
    //   ],
    // )
    // ,)
  ],
),
),
),
      ),







      
//         child: Padding(
// padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 80.0),
// child: 
// new GestureDetector(
//   onTap:() =>mesaj(),
//   child:
// Card(
// child: Column(
//   mainAxisSize: MainAxisSize.min,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: <Widget>[
//     Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),child: Image.asset('assets/homepageFeedback_256.png'),),
//     Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),child: 
//     Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Text('Bir FeedBack Bırak',style: TextStyle(fontSize: 30.0,color: Color.fromRGBO(88,159,255, 1.0),fontWeight: FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),
//         Icon(Icons.touch_app,color: Color.fromRGBO(88,159,255, 1.0),size: 30.0)
//       ],
//     )
//     ,)
//   ],
// ),
// ),
// ),
//       ),




      );

    }

Widget barkodIleSorgulamaCard(){
  return Form(
    key: _formKeyBarkodIleSorgulama,
    child: Container(
    child: Card(
      child: Column(
        children: <Widget>[
          
          Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Container(padding: EdgeInsets.all(5.0), child: Text(applicationManager.currentLanguage.getbarkodNumarasiGirin),)]),
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
                return applicationManager.currentLanguage.getbosGecemezsiniz;
              }
            },
      controller: controllerBarcode,
              decoration: InputDecoration(
                hintText: applicationManager.currentLanguage.getbarkodNumarasiGirin
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
        child: Image.asset('assets/right_oval_40.png')
            
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
          
          Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Container(padding: EdgeInsets.all(5.0), child: Text(applicationManager.currentLanguage.getbarkodIleSorgulama),)]),
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
                return applicationManager.currentLanguage.getbosGecemezsiniz;
              }
            },
      controller: controllerModelCode,
              decoration: InputDecoration(
                
                hintText: applicationManager.currentLanguage.geturunKodunuGirin,

              ),
               //textCapitalization: TextCapitalization.sentences,
              maxLength: 8,
            ),
            TextFormField(
              focusNode: _textColorCodeFocus,
               validator: (value) {
              if (value.isEmpty) {
                return applicationManager.currentLanguage.getbosGecemezsiniz;
              }
            },
      controller: controllerColorCode,
              decoration: InputDecoration(
                
                hintText: applicationManager.currentLanguage.getrenkKodunuGirin,
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
        child: Image.asset('assets/right_oval_40.png')
            
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
          
          Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Container(padding: EdgeInsets.all(5.0), child: Text(applicationManager.currentLanguage.getbarkodTara),)]),
          Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),child: Image.asset('assets/barcode_tara_80.png'),),
          ),
          Expanded(
            flex: 3,
            child: new Text(applicationManager.currentLanguage.getkameraIleTaratarakAramaYapabilirsiniz),
          ),
          Expanded(
            flex: 1,
            child:             GestureDetector(
       onTap: ()=>showProductPerformanceMetricPage(ProductMetricsResponseType.scanBarcode),
        child: Image.asset('assets/right_oval_40.png')
            
            )
          )
        ],
      )
        ],
      ),
    ),
  );
}

Widget urunBagimsizFeedbackCard(){
  return Container(
    child: Card(
      child: Column(
        children: <Widget>[
          
          
          Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),child: Image.asset('assets/message_balon_40.png')),
          ),
          Expanded(
            flex: 3,
            child: new Text(applicationManager.currentLanguage.geturunBagimsizFeedbackGonder),
          ),
          Expanded(
            flex: 1,
            child:             GestureDetector(
       onTap: ()=>showProductPerformanceMetricPage(ProductMetricsResponseType.scanBarcode),
        child: Image.asset('assets/right_oval_40.png')
            
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
//this.productMetricsRequest.setBarcode = qrResult;
}



  setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

//ProductMetricsResponse result = await ProductSalesPerformanceService.productSalesPerformanceMetrics(fillToModel(type));

 setState(() {
  Navigator.pop(context);
 });


 //LcwAssistSnackBarDialogInfo(result.product.modelKod,scaffoldState,LcwAssistSnagitType.info).snackbarShow();

//  var route = new MaterialPageRoute(
//             builder: (BuildContext context) => ProductPerformansMetricsOperations(productMetricsResponse: result)
//           );

//           Navigator.of(context).push(route);

}





}