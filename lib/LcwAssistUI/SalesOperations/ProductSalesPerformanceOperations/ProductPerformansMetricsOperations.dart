import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/UcluCardTextDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformanceDetailMetric.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
void main(){
  runApp(new MaterialApp(
    home:new ProductPerformansMetricsOperations(),
  ));
}
class ProductPerformansMetricsOperations extends StatefulWidget {

final ProductMetricsResponse productMetricsResponse;
final LcwAssistApplicationManager applicationManager;

ProductPerformansMetricsOperations({Key key, @required this.productMetricsResponse,@required this.applicationManager}) : super(key: key);


  @override
  ProductPerformansMetricsState createState() => new ProductPerformansMetricsState(productMetricsResponse: productMetricsResponse,applicationManager:applicationManager);
}
class ProductPerformansMetricsState extends State<ProductPerformansMetricsOperations> with TickerProviderStateMixin implements IsLcwAssistUIPage{ 

final ProductMetricsResponse productMetricsResponse;
  ProductPerformansMetricsState({Key key, @required this.productMetricsResponse, @required this.applicationManager});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

Icon currentPageStyleIcon = Icon(Icons.view_module);
bool currentPageStyle = true;

StoreChooseListViewDTO storesResponse = new StoreChooseListViewDTO();
bool sayfaYuklendiMi = false;
//Floating buton için
    static const List<IconData> icons = const [  Icons.thumb_up, Icons.thumb_down ];
    static const List<Color> iconColors = const [ Colors.green,Colors.red ];
    AnimationController _controller;
/////////////////

@override
void initState() {
//Floating buton için
    _controller = new AnimationController(vsync: this,
      duration: const Duration(milliseconds: 500),
    );
///////////////////////
    super.initState();
sayfaYuklendiMi = true;

//  WidgetsBinding.instance
//         .addPostFrameCallback((_) => loaded(context));
// setState(() {
  
// });
    currentStore().then((result) {
            // If we need to rebuild the widget with the resulting data,
            // make sure to use `setState`
            setState(() {
                storesResponse = result;
            });
        });
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
  onPressed: () => changePageStyle(),
)
      ],),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      backgroundColor: LcwAssistColor.backGroundColor,
      body: sayfaYuklendiMi == true ? storeReportPageBody(): Container(child: Text(''),),//(currentPageStyle == true ? storeReportPageBody() : ekranYerlesim()) : Container(child: Text(''),),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.endDocked,
    floatingActionButton: Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),child: buildFloatingButtonHasSub(),),//thisFloatActionButton(),
    bottomNavigationBar:thisBottomNavigator(),
    );
    }

//Expanded(flex: 12,child: Container(color: LcwAssistColor.backGroundColor,child: Padding(padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),child: buildPageView(),),),),

Widget storeReportPageBody(){

return 
new Column(
  children: <Widget>[
    // Card(child: Column(
    //     mainAxisSize: MainAxisSize.max,
    // crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: <Widget>[
    //     yeniHeader(),//magazaCardDetay2()
    //   ],
    // )),
magazaCardDetay3(),
    currentPageStyle == true ?
    Expanded(child: 
      SingleChildScrollView(
                child:
Column(children: <Widget>[

new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.salesDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(54,163,247, 1.0),  applicationManager.currentLanguage.getkumulatifSatisTutar,productMetricsResponse.productPerformansResultDTO.kumulatifSatisTutar,true)),

LcwAssistCustomWidgets.satir(Color.fromRGBO(0,116,198, 1.0),   applicationManager.currentLanguage.getortalamaPSF,productMetricsResponse.productPerformansResultDTO.ortalamaPSF,false),
new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.salesDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(239,138,14, 1.0),  applicationManager.currentLanguage.getkumulatifSatisAdet,productMetricsResponse.productPerformansResultDTO.kumulatifSatisAdet,true),),
new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.salesDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(100,105,188, 1.0), applicationManager.currentLanguage.getkumulatifSevkAdet,productMetricsResponse.productPerformansResultDTO.kumulatifSevkAdet,true),),
new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.salesDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(196,66,88, 1.0),   applicationManager.currentLanguage.getstr,productMetricsResponse.productPerformansResultDTO.str,true),),
LcwAssistCustomWidgets.satir(Color.fromRGBO(38,137,116, 1.0),  applicationManager.currentLanguage.getilkPSF,productMetricsResponse.productPerformansResultDTO.ilkPesinFiyat,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,162,181, 1.0),   applicationManager.currentLanguage.getindirimOrani,productMetricsResponse.productPerformansResultDTO.indirimOrani,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(54,163,247, 1.0),  applicationManager.currentLanguage.getsonPSF,productMetricsResponse.productPerformansResultDTO.sonPesitFiyat,false),
new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.stockDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,116,198, 1.0),   applicationManager.currentLanguage.getreyonStokAdet,productMetricsResponse.productPerformansResultDTO.reyonStok,true),),
new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.stockDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(239,138,14, 1.0),  applicationManager.currentLanguage.getdepoStokAdet,productMetricsResponse.productPerformansResultDTO.depoStok,true),),
new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.stockDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(100,105,188, 1.0), applicationManager.currentLanguage.getson7gunSatisAdet,productMetricsResponse.productPerformansResultDTO.son7GunSatisAdet,true),),
LcwAssistCustomWidgets.satir(Color.fromRGBO(196,66,88, 1.0),   applicationManager.currentLanguage.getfiiliCover,productMetricsResponse.productPerformansResultDTO.fiiliCover,false),
new GestureDetector(
  onTap:() =>detayaGit(ProductPerformansDetailType.stockDetail),
  child:
LcwAssistCustomWidgets.satir(Color.fromRGBO(38,137,116, 1.0),  applicationManager.currentLanguage.getyolStokAdet,productMetricsResponse.productPerformansResultDTO.yolStok,true),),
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,162,181, 1.0),   applicationManager.currentLanguage.getonayliOnyasizRezerveAdet,productMetricsResponse.productPerformansResultDTO.onayliOnaysizRezerve,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(54,163,247, 1.0),  applicationManager.currentLanguage.getmerkezDepoStok,productMetricsResponse.productPerformansResultDTO.merkezDepoStokAdet,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(0,116,198, 1.0),   applicationManager.currentLanguage.getbulunurluk,productMetricsResponse.productPerformansResultDTO.bulunurluk,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(239,138,14, 1.0),  applicationManager.currentLanguage.getderinlik,productMetricsResponse.productPerformansResultDTO.derinlik,false),
LcwAssistCustomWidgets.satir(Color.fromRGBO(100,105,188, 1.0), applicationManager.currentLanguage.getrafOmru,productMetricsResponse.productPerformansResultDTO.rafOmru,false),
// Container(
//   decoration:  BoxDecoration(
//     border:  Border(
//       bottom:  BorderSide(width: 3.0, color:  LcwAssistColor.cardLineColor)//Color.fromRGBO(182,0,62, 1.0))
//     )) 
// ),
],)

  ),)

:Expanded(child: Container(color: LcwAssistColor.backGroundColor,child: Padding(padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),child: buildPageView(),),),),







  ],
);
}

Widget ekranYerlesim(){
    return Column(
    children: <Widget>[
      Expanded(flex: 4,child: Container(color: LcwAssistColor.backGroundColor,
      child: 
      Padding(child: masterCardInfo(),padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),),)
      ,),//masterCardInfo()

      Expanded(flex: 12,child: Container(color: LcwAssistColor.backGroundColor,child: Padding(padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),child: buildPageView(),),),),
      Expanded(flex: 1,child: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        alignment: Alignment.centerRight,
        color: LcwAssistColor.backGroundColor,
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset('assets/diagram1.png')
          ],
        ),),)//child: buildFlatButton(),),)
      
    ],
  );
}

Widget sayfa(List<Widget> satirlar){
    return Container(
    //padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
    child: Column(
    children: <Widget>[
      Expanded(child: satirlar[0]),
      Expanded(child: satirlar[1]),
      Expanded(child: satirlar[2]),
    ],
  ));
}

Widget masterCardInfo(){
  return Container
  (
color: LcwAssistColor.thirdColor,
child:
      Row(
      children: <Widget>[
        Expanded(flex: 140, child: 
        Padding(child: Image.asset('assets/chart_6.png',fit: BoxFit.cover,),padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),)            
        ),//, fit: BoxFit.cover
        Expanded(flex: 400,child: magazaCardDetay(),),
      ],
    )
      ,


  );
}

Widget magazaCardDetay2(){
  return 
     Padding(
       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
       child: 
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

Container(
  child: //brightness_1
  Row(children: <Widget>[Icon(Icons.remove,color: Color.fromRGBO(54,163,247, 1.0),size: 20,),Text( applicationManager.currentLanguage.getmagaza+' : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor)),Text(storesResponse.storeName,style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardSubHeaderColor))]),
  ),       
       
        Row(children: <Widget>[Icon(Icons.remove,color: Color.fromRGBO(0,116,198, 1.0),size: 20,),Text(applicationManager.currentLanguage.geturun+' : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor)),
        
        Text(this.productMetricsResponse.product.barkod.toString(),style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)]),
        Row(children: <Widget>
        [
          Icon(Icons.remove,color: Color.fromRGBO(239,138,14, 1.0),size: 20,),
          Text(
          this.productMetricsResponse.product.modelKod+' / '+this.productMetricsResponse.product.renkKod+'-'+this.productMetricsResponse.product.renkTanim
          //productMetricsResponse.product.renkKod+'('+productMetricsResponse.product.renkTanim+')'
        ,style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),]),
        Row(children: <Widget>[
          Icon(Icons.remove,color: Color.fromRGBO(100,105,188, 1.0),size: 20,),
          Text(this.productMetricsResponse.product.urunAdi,
        style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardHeaderColor)),])


      ],
   
  ),);
}

Widget magazaCardDetay(){
  return 
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

  Row(children: <Widget>[Text( applicationManager.currentLanguage.getmagaza+' : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: Colors.white)),Text(storesResponse.storeName,style: TextStyle(fontSize: 17.0,color: Colors.white))]),
        Row(children: <Widget>[Text(applicationManager.currentLanguage.geturun+' : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: Colors.white)),
        Text(this.productMetricsResponse.product.barkod.toString(),style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)]),
        Row(children: <Widget>
        [
          
          Text(
          this.productMetricsResponse.product.modelKod+'/'+this.productMetricsResponse.product.renkKod+'-'+this.productMetricsResponse.product.renkTanim
          //productMetricsResponse.product.renkKod+'('+productMetricsResponse.product.renkTanim+')'
        ,style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),]),
        Row(children: <Widget>[Text(this.productMetricsResponse.product.urunAdi,
        style: TextStyle(fontSize: 17.0,color: Colors.white)),]),


      ],
   
  );
}

Widget tutarUcluCard(Color colorR,List<UcluCardTextDTO> ucluKartText, bool isThereDetail){
  
  return Card(
    child: 

    Container(
      decoration:  BoxDecoration(
    border:  Border(
      // top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      // left:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      // right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 4.0, color:  colorR)//Color.fromRGBO(182,0,62, 1.0))
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
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child: Text(ucluKartText[0].masterText,style: LcwAssistTextStyle.reportCardHeaderTextStyle),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child: Text(ucluKartText[0].subText,style:LcwAssistTextStyle.reportCardsubHeaderTextStyle))
            ],)),

Expanded(flex: 1,
child: 
Column(
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),child: Text(ucluKartText[1].masterText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,decoration: TextDecoration.underline,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.secondaryColor)),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child: Text(ucluKartText[1].subText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,decoration: TextDecoration.underline,fontFamily:  LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.thirdColor)))
            ],)),

Expanded(flex: 2,
child: 
Column(
          children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child: Text(ucluKartText[2].masterText,style: LcwAssistTextStyle.reportCardHeaderTextStyle),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),child: Text(ucluKartText[2].subText,style: LcwAssistTextStyle.reportCardsubHeaderTextStyle))
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
    Text(applicationManager.currentLanguage.getdetaylar,style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
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

Widget tutarCard(Color colorR,String masterText,String subText, bool isThereDetail){
  
  return Card(
    child: 
    Container(
      decoration:  BoxDecoration(
    border:  Border(
      top:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      left:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      right:  BorderSide(width: 1.0, color:  Color(0xFFFFFFFFFF)),
      bottom:  BorderSide(width: 4.0, color:  Color.fromRGBO(colorR.red, colorR.green, colorR.blue, 1.0))//Color.fromRGBO(182,0,62, 1.0))
    )),
      child: 
    Column(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
Column(children: <Widget>[
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Text(masterText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardHeaderColor)),),
            Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),child: Text(subText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,fontFamily: 'Ubuntu',color: LcwAssistColor.reportCardSubHeaderColor)))
             ],),
             isThereDetail == true ? Row(
   mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    new GestureDetector(
  onTap: ()=>{},
  child: new Card(
    color: LcwAssistColor.yellowGreen,//LcwAssistColor.specialOrange,
    child: Row(children: <Widget>[Icon(Icons.more_horiz,color: Colors.white,),
    Text(applicationManager.currentLanguage.getdetaylar,style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
    Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),)],)    
    ,),
)
  ],
): Row()
        

    ],)
    
  ));
}

Widget buildPageView() {

List<UcluCardTextDTO> sayfaBirSatir1 = new List<UcluCardTextDTO>();
sayfaBirSatir1.add(new UcluCardTextDTO(applicationManager.currentLanguage.getkumulatifSatisTutar,productMetricsResponse.productPerformansResultDTO.kumulatifSatisTutar));
sayfaBirSatir1.add(new UcluCardTextDTO(applicationManager.currentLanguage.getortalamaPSF,productMetricsResponse.productPerformansResultDTO.ortalamaPSF));
sayfaBirSatir1.add(new UcluCardTextDTO(applicationManager.currentLanguage.getkumulatifSatisAdet,productMetricsResponse.productPerformansResultDTO.kumulatifSatisAdet));


List<UcluCardTextDTO> sayfaBirSatir3 = new List<UcluCardTextDTO>();
sayfaBirSatir3.add(new UcluCardTextDTO(applicationManager.currentLanguage.getilkPSF,productMetricsResponse.productPerformansResultDTO.ilkPesinFiyat));
sayfaBirSatir3.add(new UcluCardTextDTO(applicationManager.currentLanguage.getindirimOrani,productMetricsResponse.productPerformansResultDTO.indirimOrani));
sayfaBirSatir3.add(new UcluCardTextDTO(applicationManager.currentLanguage.getsonPSF,productMetricsResponse.productPerformansResultDTO.sonPesitFiyat));

List<Widget> sayfa1 = new List<Widget>();
sayfa1.add(Row (children: <Widget>[Expanded(child :tutarUcluCard(Color.fromRGBO(54,163,247, 1.0),sayfaBirSatir1,false))],));


sayfa1.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Color.fromRGBO(100,105,188, 1.0),applicationManager.currentLanguage.getkumulatifSevkAdet,productMetricsResponse.productPerformansResultDTO.kumulatifSevkAdet,false)),
  Expanded(child :tutarCard(Color.fromRGBO(239,138,14, 1.0),applicationManager.currentLanguage.getstr,productMetricsResponse.productPerformansResultDTO.str,false))],));
sayfa1.add(Row (children: <Widget>[Expanded(child :tutarUcluCard(Color.fromRGBO(0,116,198, 1.0),sayfaBirSatir3,false))],));


//SAYFA 2
List<UcluCardTextDTO> sayfaIkiSatir2 = new List<UcluCardTextDTO>();
sayfaIkiSatir2.add(new UcluCardTextDTO(applicationManager.currentLanguage.getson7gunSatisAdet,productMetricsResponse.productPerformansResultDTO.son7GunSatisAdet));
sayfaIkiSatir2.add(new UcluCardTextDTO(applicationManager.currentLanguage.getfiiliCover,productMetricsResponse.productPerformansResultDTO.fiiliCover));
sayfaIkiSatir2.add(new UcluCardTextDTO(applicationManager.currentLanguage.getyolStokAdet,productMetricsResponse.productPerformansResultDTO.yolStok));



List<Widget> sayfa2 = new List<Widget>();

sayfa2.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,applicationManager.currentLanguage.getreyonStokAdet,productMetricsResponse.productPerformansResultDTO.reyonStok,true)),
  Expanded(child :tutarCard(Colors.white,applicationManager.currentLanguage.getdepoStokAdet,productMetricsResponse.productPerformansResultDTO.depoStok,true))],));
sayfa2.add(Row (children: <Widget>[Expanded(child :tutarUcluCard(Colors.white,sayfaIkiSatir2,true))],));
sayfa2.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,applicationManager.currentLanguage.getonayliOnyasizRezerveAdet,productMetricsResponse.productPerformansResultDTO.onayliOnaysizRezerve,true)),
  Expanded(child :tutarCard(Colors.white,applicationManager.currentLanguage.getmerkezDepoStok,productMetricsResponse.productPerformansResultDTO.merkezDepoStokAdet,false))],));


List<Widget> sayfa3 = new List<Widget>();
sayfa3.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,applicationManager.currentLanguage.getbulunurluk,productMetricsResponse.productPerformansResultDTO.bulunurluk,false)),
  Expanded(child :tutarCard(Colors.white,applicationManager.currentLanguage.getderinlik,productMetricsResponse.productPerformansResultDTO.derinlik,false))],));


sayfa3.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,applicationManager.currentLanguage.getrafOmru,productMetricsResponse.productPerformansResultDTO.rafOmru,false)),
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
                onPressed: () { _openAddEntryDialog();},
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
                  child: new Icon(_controller.isDismissed ? Icons.record_voice_over : Icons.close,),
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

Widget buildFloatingButtonHasSubbbb() {
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
                mini: true,
                child: new Icon(icons[index],  color: iconColors[index]),
                onPressed: () {},
              ),
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            heroTag: null,
            backgroundColor: Color.fromRGBO(244,81,108,1.0),//Color.fromRGBO(44,45,58,1.0),
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 0.5 *3.14),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.record_voice_over : Icons.close,),
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

Widget magazaCardDetay3(){
  return Column(
     mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 5), child: 
    Card(child: 
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child: 
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
    Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),child: Icon(Icons.bubble_chart,color: LcwAssistColor.pageCardHeaderColor),),
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),child: 
        Text("Ürün Bilgileri",style: TextStyle(color: LcwAssistColor.pageCardHeaderColor,
        fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 17.0),),)
      
    ]))
,
     Padding(
       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
       child: 
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
Container(
  child: //brightness_1
  Row(children: <Widget>[
    //Icon(Icons.remove,color: Color.fromRGBO(54,163,247, 1.0),size: 20,),
    Text( applicationManager.currentLanguage.getmagaza+' : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor)),Text(storesResponse.storeName,style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardSubHeaderColor))]),
  ),       
       
        Row(children: <Widget>[
          //Icon(Icons.remove,color: Color.fromRGBO(0,116,198, 1.0),size: 20,),
          Text(applicationManager.currentLanguage.geturun+' : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor)),
        
        Text(this.productMetricsResponse.product.barkod.toString(),style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)]),
        Row(children: <Widget>
        [
          //Icon(Icons.remove,color: Color.fromRGBO(239,138,14, 1.0),size: 20,),
          Text(
          this.productMetricsResponse.product.modelKod+' / '+this.productMetricsResponse.product.renkKod+'-'+this.productMetricsResponse.product.renkTanim
          //productMetricsResponse.product.renkKod+'('+productMetricsResponse.product.renkTanim+')'
        ,style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardHeaderColor,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),]),
        Row(children: <Widget>[
          //Icon(Icons.remove,color: Color.fromRGBO(100,105,188, 1.0),size: 20,),
          Text(this.productMetricsResponse.product.urunAdi,
        style: TextStyle(fontSize: 17.0,color: LcwAssistColor.reportCardHeaderColor)),])


      ],
   
  ),)
    
    ],),)
    ))    
    ],);
}

void _openAddEntryDialog() {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new ProductPerformansMetricFeedBackDialog();
      },
    fullscreenDialog: true
  ));
}

Future currentStore() async{

StoreChooseListViewDTO stores;

stores = await applicationManager.serviceManager.storeChooseService.getCurrentStore();


return stores;
    }

changePageStyle(){
    if(currentPageStyle){
    currentPageStyleIcon = Icon(Icons.view_list);
    currentPageStyle = false;
  }else{
    currentPageStyleIcon = Icon(Icons.view_module);
    currentPageStyle = true;
  }

  setState(() {
      
    });
}

void detayaGit(ProductPerformansDetailType type) async{

    // var route = new MaterialPageRoute(
    //         builder: (BuildContext context) => ProductPerformanceDetailMetric()
    //       );

    // Navigator.of(context).push(route);


 
//     await 
// Navigator.of(context).push(new MaterialPageRoute<Null>(
//       builder: (BuildContext context) {
//         return new ProductPerformanceDetailMetric();//(storesResponse:this.raporFilterList,capacityParameter:this.capacityParameter);
//       },
//     fullscreenDialog: true
//   ));


  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new ProductPerformanceDetailMetric(productMetricsResponse: productMetricsResponse,applicationManager: applicationManager,productPerformansDetailType:type);
      },
    fullscreenDialog: true
  ));

}
}