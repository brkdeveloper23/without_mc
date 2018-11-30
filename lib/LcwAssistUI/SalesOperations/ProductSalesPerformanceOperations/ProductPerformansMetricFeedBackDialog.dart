import 'package:flutter/material.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';

class ProductPerformansMetricFeedBackDialog extends StatefulWidget {
  @override
  ProductPerformansMetricFeedBackDialogState createState() => new ProductPerformansMetricFeedBackDialogState();
}

class ProductPerformansMetricFeedBackDialogState extends State<ProductPerformansMetricFeedBackDialog>  implements IsLcwAssistUIPage{

LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
bool sayfaYuklendiMi = false;

@override
void initState() {
    super.initState();

     sayfaYuklendiMi = false;
     WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context)); 

  }

  Future loaded(BuildContext context) async{
applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
sayfaYuklendiMi = true;

setState(() {});
}

Future<void> executeAfterBuild() async {
  
}



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: LcwAssistColor.backGroundColor,
      appBar: new AppBar(
        title:  sayfaYuklendiMi == true ? Text(applicationManager.currentLanguage.getfeedbackIslemleri) :  Text(''),
     
      ),
      body: sayfaYuklendiMi == true ? pageBody() : Container(child: Text(''),),

    );
  }

  Widget pageBody(){
    return       Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[



          Padding(child:   new TextFormField(
          scrollPadding: EdgeInsets.all(15.0),
              decoration: InputDecoration(
                hintText: applicationManager.currentLanguage.getfeedBackGirin
              ),
              //keyboardType: TextInputType.,
              maxLines: 6,
              //maxLength: 13,
            )
            ,padding: EdgeInsets.all(10.0),),

Row(
  mainAxisSize: MainAxisSize.max,
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  // crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
Expanded(child:

Padding(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
 child: RaisedButton( 
 //height: 50.0, 
 color: Colors.green[400],//LcwAssistColor.secondaryColor,//Theme.of(context).primaryColor, 
 textColor: Colors.white, 
 child: new Text(applicationManager.currentLanguage.getgonder,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 20.0,color: Colors.white),),
 onPressed: () => {}, 
 splashColor: Colors.redAccent,
)
,)
,)
],)









          ],
        ),
      ),
      );
  }
}