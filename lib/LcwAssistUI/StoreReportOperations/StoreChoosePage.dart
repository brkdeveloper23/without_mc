import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';

void main() => runApp(new MaterialApp(
  home: new StoreChoosePage(),
  debugShowCheckedModeBanner: false,
));

class StoreChoosePage extends StatefulWidget {
final LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

  final StoreChooseResponeDTO storesResponse;
  StoreChoosePage({Key key, @required this.storesResponse}) : super(key: key);

  @override
  //_StoreChoosePageState createState() => new _StoreChoosePageState(storesResponse: storesResponse);
  _StoreChoosePageState createState() => new _StoreChoosePageState();
}

class _StoreChoosePageState extends State<StoreChoosePage> with WidgetsBindingObserver implements IsLcwAssistUIPage{

// final StoreChooseResponeDTO storesResponse;
//   _StoreChoosePageState({Key key, @required this.storesResponse});
// _StoreChoosePageState()
// {
//    WidgetsBinding.instance
//         .addPostFrameCallback((_) => executeAfterBuild());
// }



LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
TextEditingController controller = new TextEditingController();
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
//StoreChooseResponeDTO storesResponse = new StoreChooseResponeDTO();
List<StoreChooseListViewDTO> storesResponseListView = new List<StoreChooseListViewDTO>();
List<StoreChooseListViewDTO> storesResponseSearchResult=  new List<StoreChooseListViewDTO>();
bool sayfaYuklendiMi = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);

     WidgetsBinding.instance
        .addPostFrameCallback((_) => 
        loaded(context)
        );

storesResponseSearchResult = new List<StoreChooseListViewDTO>();


  }



Future<void> executeAfterBuild() async {
//applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
}


Future loaded(BuildContext context) async{
  applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();


 if(await applicationManager.utils.checkToTokenExpireRedirectToLogin(applicationManager.currentLanguage, context))
 {
   applicationManager.utils.navigateToLoginPage(context);
 return;
 }


 setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

  //storesResponse = await applicationManager.serviceManager.storeChooseService.storeListRequest();

  storesResponseListView = await applicationManager.serviceManager.storeChooseService.storeListForListViewRequest();


sayfaYuklendiMi = true;
 setState(() {
  Navigator.pop(context);
 });
}

  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      key: scaffoldState,
      resizeToAvoidBottomPadding: false,
      body: sayfaYuklendiMi == true ? pageBody() : Container(child: Text(''),)
    );
  }

  Widget pageBody(){
    return 
    new Column(
        children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            child: new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: applicationManager.currentLanguage.getmagazaIsimKoduGirin, border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },),
                ),
              ),
            ),
          ),
          new Expanded(
            child: storesResponseSearchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
              itemCount: storesResponseSearchResult.length,
              itemBuilder: (context, i) {
                return  new Card(
                  child: new ListTile(
                    //  storeChooseService  leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
onTap: (){listViewClick(storesResponseSearchResult[i]);},
                    title:

                   Row(
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                      Container(
                      padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                      child:
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      new Text(storesResponseSearchResult[i].storeCode,style: TextStyle(fontWeight:  FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
                      new Text(storesResponseSearchResult[i].storeName,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily)),

                    ],)
                      ,),

                  Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: //Icon(Icons.star,color: Colors.yellow[800],)
                                    new IconButton(
  icon: storesResponseSearchResult[i].favorimi ?  Icon(Icons.star, color: Colors.yellow[800],size: 30, ): Icon(Icons.star_border, color: Colors.grey[700],size: 30, ),
  onPressed: () => saveFavoriteStore(storesResponseSearchResult[i].storeCode),
)
                  ,)
                   ],)
//Icon(Icons.star,color: Colors.yellow[700],)

                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            )
                : new ListView.builder(
              itemCount: storesResponseListView == null ? 0 : storesResponseListView.length,
              itemBuilder: (context, index) { 
                return new Card(
                  child: new ListTile(
                    //  storeChooseService  leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    //LcwAssistSnackBarDialogInfo('this.message',context,LcwAssistSnagitType.info);
                    onTap: (){listViewClick(storesResponseListView[index]);},
                    title:
                   Row(
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                      Container(
                      padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                      child:
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                  storesResponseListView[index].storeCode != "0" ?
                  new Text(storesResponseListView[index].storeCode,style: TextStyle(fontWeight:  FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)
                   : Text(''),
                      new Text(storesResponseListView[index].storeName,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily)),

                    ],)
                      ,),

                  Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
                  //Icon(Icons.star,color: Colors.yellow[800],)
                                    new IconButton(
  icon: storesResponseListView[index].favorimi ?  Icon(Icons.star, color: Colors.yellow[800],size: 30, ): Icon(Icons.star_border, color: Colors.grey[700],size: 30, ),
  onPressed: () => saveFavoriteStore(storesResponseListView[index].storeCode),
)
                  ,)
                   ],)
//Icon(Icons.star,color: Colors.yellow[700],)

                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            ),
          ),
        ],
      );
  }

  void listViewClick(StoreChooseListViewDTO store) async{

    await applicationManager.serviceManager.storeChooseService.saveCurrentStore(store);

 //setState(() {
 // Navigator.pop(context);
 //});
setState(() {});
      var route = new MaterialPageRoute(
              builder: (BuildContext context) => HomePage()
            );
     Navigator.of(context).push(route);
     //setState(() {});
  }

  onSearchTextChanged(String text) async {
    storesResponseSearchResult = new List<StoreChooseListViewDTO>();

    if (text.isEmpty) {

  for(final fre in storesResponseListView.where((i) => i.favorimi == true)){
storesResponseListView.remove(fre);
if(fre.storeCode == "0")
storesResponseListView.insert(0, fre);
else
storesResponseListView.insert(1, fre);
  }



      setState(() {});
      return;
    }
 setState(() {});
   storesResponseListView.forEach((userDetail) {
      if (userDetail.storeCode.contains(text.toUpperCase()) || userDetail.storeName.contains(text.toUpperCase()))
        storesResponseSearchResult.add(userDetail);
    });


    setState(() {});
  }


saveFavoriteStore(String storeCode) async{

// if(storeCode == "0"){
//   await LcwAssistAlertDialogInfo(applicationManager.currentLanguage.getuyari,"Tum mağazaları favorilerden kaldırmazsınız.",applicationManager.currentLanguage.gettamam,context,LcwAssistDialogType.error).show();
// }

await applicationManager.serviceManager.storeChooseService.saveFavoriteStore(storeCode);


if(storesResponseListView.any((i)=> i.storeCode == storeCode)== true){

if(storesResponseListView.firstWhere((i)=> i.storeCode == storeCode).favorimi == true)
 storesResponseListView.firstWhere((i)=> i.storeCode == storeCode).favorimi = false;
else
if(storesResponseListView.firstWhere((i)=> i.storeCode == storeCode).favorimi == false)
 storesResponseListView.firstWhere((i)=> i.storeCode == storeCode).favorimi = true;
}


//Takla atıldı
if(storesResponseSearchResult.any((i)=> i.storeCode == storeCode)== true){

if(storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi == true)
{
 storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi = false;
 storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi = true;
 storesResponseListView.firstWhere((i)=> i.storeCode == storeCode).favorimi = true;
}
else
if(storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi == false)
{
 storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi = true;
 storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi = false;
 storesResponseListView.firstWhere((i)=> i.storeCode == storeCode).favorimi = false;
}
}

// if(storesResponseSearchResult.any((i)=> i.storeCode == storeCode)== true){
// if(storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi == true)
//  storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi = false;
// else
// if(storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi == false)
//  storesResponseSearchResult.firstWhere((i)=> i.storeCode == storeCode).favorimi = true;
 
// }


setState(() {
  
});
}

}
