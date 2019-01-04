import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
import 'package:lcwassist/Core/BaseConst/LcwAssistEnumType.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/SaveFeedbackRequestDTO.dart';
import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
import 'package:speech_recognition/speech_recognition.dart';

class ProductPerformansMetricFeedBackDialog extends StatefulWidget {
SaveFeedbackRequestDTO feedbackRequest;


ProductPerformansMetricFeedBackDialog({Key key, @required this.feedbackRequest}) : super(key: key);

  @override
  ProductPerformansMetricFeedBackDialogState createState() => 
  new ProductPerformansMetricFeedBackDialogState(feedbackRequest:feedbackRequest);
}

class ProductPerformansMetricFeedBackDialogState extends State<ProductPerformansMetricFeedBackDialog>  implements IsLcwAssistUIPage{
ProductPerformansMetricFeedBackDialogState({Key key, @required this.feedbackRequest});
final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
SaveFeedbackRequestDTO feedbackRequest;
String barkod;
LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();
bool sayfaYuklendiMi = false;
SpeechRecognition _speech;
bool _speechRecognitionAvailable = false;
bool _isListening = false;

String currencyCode = "en_US";//"tr_TR";
String transcription = '';
final _formKey = GlobalKey<FormState>();
final controllerFeedbackEditText = TextEditingController();

@override
void initState() {
    super.initState();

SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);

activateSpeechRecognizer();
     sayfaYuklendiMi = false;
     WidgetsBinding.instance
        .addPostFrameCallback((_) => loaded(context)); 

  }


void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  Future loaded(BuildContext context) async{
applicationManager.setCurrentLanguage = await applicationManager.serviceManager.languagesService.currentLanguage();


 if(await applicationManager.utils.checkToTokenExpireRedirectToLogin(applicationManager.currentLanguage, context))
 {
   applicationManager.utils.navigateToLoginPage(context);
 return;
 }

sayfaYuklendiMi = true;

setState(() {});
}

Future<void> executeAfterBuild() async {
  
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: LcwAssistColor.backGroundColor,
      resizeToAvoidBottomPadding: false,
      key: scaffoldState,
       appBar:
       !(feedbackRequest.getFeedBackType==2) ?  
       new AppBar(
        title:  sayfaYuklendiMi == true ? Text(applicationManager.currentLanguage.getfeedbackIslemleri) :  Text(''),
      ) : null,


      body: sayfaYuklendiMi == true ? pageBody() : Container(child: Text(''),),

    );
  }

  Widget pageBody(){
    return  Form(

key: _formKey,
child:  Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          Padding(child:   new TextFormField(
            controller: controllerFeedbackEditText,
            validator: (value) {

if (value.isEmpty) {

return this.applicationManager.currentLanguage.getbosGecemezsiniz;

}

},
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

Padding(padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 5.0), 
  child: 
Row(
  mainAxisSize: MainAxisSize.max,
  children: <Widget>[
  FloatingActionButton(
                backgroundColor: Colors.redAccent,
                child: Icon(_isListening ? Icons.pause : Icons.mic),
                onPressed: () => speak(),
              ),
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),),
Expanded(
  child:  MaterialButton( 
height: 45.0,
 color: Colors.green[400],//LcwAssistColor.secondaryColor,//Theme.of(context).primaryColor, 
 textColor: Colors.white, 
 child: new Text(applicationManager.currentLanguage.getgonder,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 20.0,color: Colors.white),),
 onPressed: () => saveFeedback(), 
 splashColor: Colors.redAccent,
),),
Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0),),
],),
            
//  RaisedButton( 
//  //height: 50.0, 
//  color: Colors.green[400],//LcwAssistColor.secondaryColor,//Theme.of(context).primaryColor, 
//  textColor: Colors.white, 
//  child: new Text(applicationManager.currentLanguage.getgonder,style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily,fontSize: 20.0,color: Colors.white),),
//  onPressed: () => {}, 
//  splashColor: Colors.redAccent,
// )
)
,)
],)

          ],
        ),
      ),
      ));
  }

  speak(){
//_isListening = !_isListening;
if(_speechRecognitionAvailable && !_isListening)
{
 start();

}else
{
cancel();
//stop();
}

setState(() {
  
});
}

saveFeedback() async{
  if (!_formKey.currentState.validate())
return;

LcwAssistLoading.showAlert(context,applicationManager.currentLanguage.getyukleniyor);

feedbackRequest.setMessage = controllerFeedbackEditText.text;

await this.applicationManager.serviceManager.productSalesPerformanceService.saveFeedback(feedbackRequest);

setState(() {

Navigator.pop(context);

});

LcwAssistSnackBarDialogInfo(this.applicationManager.currentLanguage.getfeedbackAlinmistir,scaffoldState,LcwAssistSnagitType.successful).snackbarShow();

controllerFeedbackEditText.text = "";
}

  void start() => _speech
      .listen(locale: 'tr_TR')
      .then((result) => print('_MyAppState.start => result ${result}'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() =>
      _speech.stop().then((result) => setState(() => _isListening = result));

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    setState(
        //() => selectedLang = 'tr_TR';//languages.firstWhere((l) => l.code == locale));
        () => currencyCode = currencyCode);//languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() => controllerFeedbackEditText.text = text);//transcription = text);//

  void onRecognitionComplete() => setState(() => _isListening = false);


}