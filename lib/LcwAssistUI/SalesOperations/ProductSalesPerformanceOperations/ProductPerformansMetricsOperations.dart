import 'package:flutter/material.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/UcluCardTextDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
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
ProductPerformansMetricsOperations({Key key, @required this.productMetricsResponse}) : super(key: key);


  @override
  ProductPerformansMetricsState createState() => new ProductPerformansMetricsState(productMetricsResponse: productMetricsResponse);
}
class ProductPerformansMetricsState extends State<ProductPerformansMetricsOperations> with TickerProviderStateMixin{

final ProductMetricsResponse productMetricsResponse;
  ProductPerformansMetricsState({Key key, @required this.productMetricsResponse});

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

Stores storesResponse = new Stores();

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


    currentStore().then((result) {
            // If we need to rebuild the widget with the resulting data,
            // make sure to use `setState`
            setState(() {
                storesResponse = result;
            });
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //key: scaffoldState,
      appBar: AppBar(title: Text('Ürün Performans Metricleri'),),
      //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
      backgroundColor: LcwAssistColor.backGroundColor,
      body: ekranYerlesim(),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.endDocked,
    floatingActionButton: Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),child: buildFloatingButtonHasSub(),),//thisFloatActionButton(),
    bottomNavigationBar:thisBottomNavigator(),
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
    



    // child: Card(
    //   child: 
    //   Row(
    //   children: <Widget>[
    //     Expanded(flex: 140, child: 
    //     Padding(child: Image.asset('assets/chart_6.png',fit: BoxFit.cover,),padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),)            
    //     ),//, fit: BoxFit.cover
    //     Expanded(flex: 400,child: magazaCardDetay(),),
    //   ],
    // )
    //   ,
    // ),
  );
}

Widget magazaCardDetay(){
  return 
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

  Row(children: <Widget>[Text('Magaza : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: Colors.white)),Text(storesResponse.storeName,style: TextStyle(fontSize: 17.0,color: Colors.white))]),
        Row(children: <Widget>[Text('Ürün : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: Colors.white)),
        Text(this.productMetricsResponse.product.barkod.toString(),style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)]),
        Row(children: <Widget>
        [
          
          Text(
          this.productMetricsResponse.product.modelKod+'/'+this.productMetricsResponse.product.renkKod+'-'+this.productMetricsResponse.product.renkTanim
          //productMetricsResponse.product.renkKod+'('+productMetricsResponse.product.renkTanim+')'
        ,style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily)),]),
        Row(children: <Widget>[Text(this.productMetricsResponse.product.urunAdi,
        style: TextStyle(fontSize: 17.0,color: Colors.white)),]),





        // Row(children: <Widget>[Text('Magaza : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor)),Text(storesResponse.storeName,style: TextStyle(fontSize: 17.0,color: Color.fromRGBO(127,127,127,1.0)))]),
        // Row(children: <Widget>[Text('Ürün : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily,color: LcwAssistColor.reportCardHeaderColor)),
        // Text(this.productMetricsResponse.product.barkod.toString(),style: TextStyle(fontSize: 17.0,color: Color.fromRGBO(127,127,127,1.0),fontFamily: LcwAssistTextStyle.currentTextFontFamily),)]),
        // Row(children: <Widget>
        // [
          
        //   Text(
        //   this.productMetricsResponse.product.modelKod+'/'+this.productMetricsResponse.product.renkKod+'-'+this.productMetricsResponse.product.renkTanim
        //   //productMetricsResponse.product.renkKod+'('+productMetricsResponse.product.renkTanim+')'
        // ,style: TextStyle(fontSize: 17.0,color: Color.fromRGBO(127,127,127,1.0),fontFamily: LcwAssistTextStyle.currentTextFontFamily)),]),
        // Row(children: <Widget>[Text(this.productMetricsResponse.product.urunAdi,
        // style: TextStyle(fontSize: 17.0,color: Color.fromRGBO(127,127,127,1.0))),]),


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
      bottom:  BorderSide(width: 2.0, color:  LcwAssistColor.cardLineColor)//Color.fromRGBO(182,0,62, 1.0))
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
    Text('Detaylar',style: TextStyle(color: Colors.white,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
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
sayfaBirSatir1.add(new UcluCardTextDTO('Küm.Satış Tutar',productMetricsResponse.productPerformansResultDTO.kumulatifSatisTutar));
sayfaBirSatir1.add(new UcluCardTextDTO('Ort. PSF',productMetricsResponse.productPerformansResultDTO.ortalamaPSF));
sayfaBirSatir1.add(new UcluCardTextDTO('Küm. Satış Adet',productMetricsResponse.productPerformansResultDTO.kumulatifSatisAdet));


List<UcluCardTextDTO> sayfaBirSatir3 = new List<UcluCardTextDTO>();
sayfaBirSatir3.add(new UcluCardTextDTO('İlk PSF',productMetricsResponse.productPerformansResultDTO.ilkPesinFiyat));
sayfaBirSatir3.add(new UcluCardTextDTO('İnd. Oranı',productMetricsResponse.productPerformansResultDTO.indirimOrani));
sayfaBirSatir3.add(new UcluCardTextDTO('Son PSF',productMetricsResponse.productPerformansResultDTO.sonPesitFiyat));

List<Widget> sayfa1 = new List<Widget>();
sayfa1.add(Row (children: <Widget>[Expanded(child :tutarUcluCard(Colors.white,sayfaBirSatir1,true))],));


sayfa1.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,'Küm. Sevk Adet',productMetricsResponse.productPerformansResultDTO.kumulatifSevkAdet,true)),
  Expanded(child :tutarCard(Colors.white,'STR',productMetricsResponse.productPerformansResultDTO.str,true))],));
sayfa1.add(Row (children: <Widget>[Expanded(child :tutarUcluCard(Colors.white,sayfaBirSatir3,false))],));


//SAYFA 2
List<UcluCardTextDTO> sayfaIkiSatir2 = new List<UcluCardTextDTO>();
sayfaIkiSatir2.add(new UcluCardTextDTO('Son 7 Gün Satış',productMetricsResponse.productPerformansResultDTO.son7GunSatisAdet));
sayfaIkiSatir2.add(new UcluCardTextDTO('Fiili Cover',productMetricsResponse.productPerformansResultDTO.fiiliCover));
sayfaIkiSatir2.add(new UcluCardTextDTO('Yol Stok',productMetricsResponse.productPerformansResultDTO.yolStok));



List<Widget> sayfa2 = new List<Widget>();

sayfa2.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,'Reyon Stok',productMetricsResponse.productPerformansResultDTO.reyonStok,true)),
  Expanded(child :tutarCard(Colors.white,'Depo Stok',productMetricsResponse.productPerformansResultDTO.depoStok,true))],));
sayfa2.add(Row (children: <Widget>[Expanded(child :tutarUcluCard(Colors.white,sayfaIkiSatir2,true))],));
sayfa2.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,'Onaylı/Onaysız Rezerve',productMetricsResponse.productPerformansResultDTO.onayliOnaysizRezerve,true)),
  Expanded(child :tutarCard(Colors.white,'Merkez Depo Stok',productMetricsResponse.productPerformansResultDTO.merkezDepoStokAdet,false))],));


List<Widget> sayfa3 = new List<Widget>();
sayfa3.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,'Bulunurluk',productMetricsResponse.productPerformansResultDTO.bulunurluk,false)),
  Expanded(child :tutarCard(Colors.white,'Derinlik',productMetricsResponse.productPerformansResultDTO.derinlik,false))],));


sayfa3.add(Row (children: <Widget>[
  Expanded(child :tutarCard(Colors.white,'Raf Ömrü',productMetricsResponse.productPerformansResultDTO.rafOmru,false)),
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

void _openAddEntryDialog() {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new ProductPerformansMetricFeedBackDialog();
      },
    fullscreenDialog: true
  ));
}

Future currentStore() async{

Stores stores;

stores = await applicationManager.serviceManager.storeChooseService.getCurrentStore();


return stores;
    }


}