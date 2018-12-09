import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/UcluCardTextDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
void main(){
  runApp(new MaterialApp(
    home:new BosSayfa(),
  ));
}
class BosSayfa extends StatefulWidget {

final ProductMetricsResponse productMetricsResponse;
BosSayfa({Key key, @required this.productMetricsResponse}) : super(key: key);


  @override
  BosSayfaState createState() => new BosSayfaState(productMetricsResponse: productMetricsResponse);
}
class BosSayfaState extends State<BosSayfa> with TickerProviderStateMixin implements IsLcwAssistUIPage{ 

final ProductMetricsResponse productMetricsResponse;
  BosSayfaState({Key key, @required this.productMetricsResponse});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

Icon currentPageStyleIcon;
bool currentPageStyle;

Stores storesResponse = new Stores();
bool sayfaYuklendiMi = false;

@override
void initState() {
    super.initState();
sayfaYuklendiMi = false;

 WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context));
  }


  Future loaded(BuildContext context) async{
    currentPageStyleIcon = Icon(Icons.view_module);
    currentPageStyle = true;

    applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
    sayfaYuklendiMi = true;
}

Future<void> executeAfterBuild() async {
  
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //key: scaffoldState,
      appBar: AppBar(title: Text(applicationManager.currentLanguage.geturunPerformansAnaliz),actions: <Widget>[

        new IconButton(
  icon: new Icon(currentPageStyleIcon.icon, color: Colors.white,size: 30, ),
  onPressed: () => {}//changePageStyle(),
)
      ],),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      backgroundColor: LcwAssistColor.backGroundColor,
      body: Text('sadasd')//sayfaYuklendiMi == true ? (currentPageStyle == true ? storeReportPageBody() : ekranYerlesim()) : Container(child: Text(''),),//
    );
    }



}