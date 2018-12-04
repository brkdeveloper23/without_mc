import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
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
StoreChooseResponeDTO storesResponse = new StoreChooseResponeDTO();
List<Stores> storesResponseSearchResult= [];
bool sayfaYuklendiMi = false;

  @override
  void initState() {
    super.initState();

     WidgetsBinding.instance
        .addPostFrameCallback((_) => 
        loaded(context)
        );

storesResponseSearchResult = [];


  }



Future<void> executeAfterBuild() async {
//applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
}


Future loaded(BuildContext context) async{
  applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
 setState(() {
LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);
});

  storesResponse = await applicationManager.serviceManager.storeChooseService.storeListRequest();

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
  icon: new Icon(Icons.star, color: Colors.yellow[800],size: 30, ),
  onPressed: () => tikla(),
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
              itemCount: storesResponse.stores == null ? 0 : storesResponse.stores.length,
              itemBuilder: (context, index) {
                return new Card(
                  child: new ListTile(
                    //  storeChooseService  leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    //LcwAssistSnackBarDialogInfo('this.message',context,LcwAssistSnagitType.info);
                    onTap: (){listViewClick(storesResponse.stores[index]);},
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

                  storesResponse.stores[index].storeCode != "0" ?
                  new Text(storesResponse.stores[index].storeCode,style: TextStyle(fontWeight:  FontWeight.bold,fontFamily: LcwAssistTextStyle.currentTextFontFamily),)
                   : Text(''),
                      new Text(storesResponse.stores[index].storeName,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily)),

                    ],)
                      ,),

                  Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),child: 
                  //Icon(Icons.star,color: Colors.yellow[800],)
                                    new IconButton(
  icon: new Icon(Icons.star, color: Colors.yellow[800],size: 30, ),
  onPressed: () => tikla(),
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

  void listViewClick(Stores store) async{

//LcwAssistSnackBarDialogInfo( store.storeCode+' - '+ store.storeName,scaffoldState,LcwAssistSnagitType.successful).snackbarShow();

    await applicationManager.serviceManager.storeChooseService.saveCurrentStore(store);
 //await new Future.delayed(const Duration(seconds: 2 ));
 setState(() {
  Navigator.pop(context);
 });
      var route = new MaterialPageRoute(
              builder: (BuildContext context) => HomePage()
            );
     Navigator.of(context).push(route);
     setState(() {});
  }

  onSearchTextChanged(String text) async {
    storesResponseSearchResult = [];
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    // _userDetails.forEach((userDetail) {
    //   if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text))
    //     _searchResult.add(userDetail);
    // });

    storesResponse.stores.forEach((userDetail) {
      if (userDetail.storeCode.contains(text.toUpperCase()) || userDetail.storeName.contains(text.toUpperCase()))
        storesResponseSearchResult.add(userDetail);
    });


    setState(() {});
  }


tikla() async{
await applicationManager.serviceManager.storeChooseService.saveFavoriteStore('T526');
}

}
