// import 'package:flutter/material.dart';
// import 'package:lcwassist/Core/Abstracts/IsLcwAssistUIPage.dart';
// import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
// import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/UcluCardTextDTO.dart';
// import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseListViewDTO.dart';
// import 'package:lcwassist/DataAccess/StoreReportOperations/StoreChooseDTOs/StoreChooseResponeDTO.dart';
// import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
// import 'package:lcwassist/LcwAssistBase/LcwAssistApplicationManager.dart';
// import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansMetricFeedBackDialog.dart';
// import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';
// import 'package:lcwassist/Style/CoreWidgets/LcwAssistCustomWidgets.dart';
// import 'package:lcwassist/Style/LcwAssistColor.dart';
// import 'package:lcwassist/Style/LcwAssistTextStyle.dart';
// import 'package:outline_material_icons/outline_material_icons.dart';
// import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
// void main(){
//   runApp(new MaterialApp(
//     home:new SpeechSayfa(),
//   ));
// }
// class SpeechSayfa extends StatefulWidget {

// final ProductMetricsResponse productMetricsResponse;
// SpeechSayfa({Key key, @required this.productMetricsResponse}) : super(key: key);


//   @override
//   SpeechState createState() => new SpeechState(productMetricsResponse: productMetricsResponse);
// }
// class SpeechState extends State<SpeechSayfa> with TickerProviderStateMixin implements IsLcwAssistUIPage{ 

// final ProductMetricsResponse productMetricsResponse;
//   SpeechState({Key key, @required this.productMetricsResponse});

// LcwAssistApplicationManager applicationManager = new LcwAssistApplicationManager();

// Icon currentPageStyleIcon;
// bool currentPageStyle;

// Stores storesResponse = new Stores();
// bool sayfaYuklendiMi = false;

// @override
// void initState() {
//     super.initState();
// sayfaYuklendiMi = false;

//  WidgetsBinding.instance
//         .addPostFrameCallback((_) => loaded(context));
//   }


//   Future loaded(BuildContext context) async{
//     currentPageStyleIcon = Icon(Icons.view_module);
//     currentPageStyle = true;

//     applicationManager.setCurrentLanguage = await applicationManager.languagesService.currentLanguage();
//     sayfaYuklendiMi = true;
// }

// Future<void> executeAfterBuild() async {
  
// }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       resizeToAvoidBottomPadding: false,
//       //key: scaffoldState,
//       appBar: AppBar(title: Text(applicationManager.currentLanguage.geturunPerformansAnaliz),actions: <Widget>[

//         new IconButton(
//   icon: new Icon(currentPageStyleIcon.icon, color: Colors.white,size: 30, ),
//   onPressed: () => {}//changePageStyle(),
// )
//       ],),
//       //drawer: DrawerOnly.leftSideMenuDiz(LcwAssistPageDrawerNumberConst.satis,context),
//       backgroundColor: LcwAssistColor.backGroundColor,
//       body: Text('sadasd')//sayfaYuklendiMi == true ? (currentPageStyle == true ? storeReportPageBody() : ekranYerlesim()) : Container(child: Text(''),),//
//     );
//     }



// }
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

void main() {
  runApp(new SpeechSayfa());
}

const languages = const [
  const Language('Francais', 'fr_FR'),
  const Language('English', 'en_US'),
  const Language('Pусский', 'ru_RU'),
  const Language('Italiano', 'it_IT'),
  const Language('Español', 'es_ES'),
  const Language('Turkce', 'tr_TR'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class SpeechSayfa extends StatefulWidget {
  @override
  _SpeechSayfa createState() => new _SpeechSayfa();
}

class _SpeechSayfa extends State<SpeechSayfa> {
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  //String _currentLocale = 'en_US';
  Language selectedLang = languages.first;

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
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

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('SpeechRecognition'),
          actions: [
            new PopupMenuButton<Language>(
              onSelected: _selectLangHandler,
              itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
            )
          ],
        ),
        body: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Center(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new Expanded(
                      child: new Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.grey.shade200,
                          child: new Text(transcription))),
                  _buildButton(
                    onPressed: _speechRecognitionAvailable && !_isListening
                        ? () => start()
                        : null,
                    label: _isListening
                        ? 'Listening...'
                        : 'Listen (${selectedLang.code})',
                  ),
                  _buildButton(
                    onPressed: _isListening ? () => cancel() : null,
                    label: 'Cancel',
                  ),
                  _buildButton(
                    onPressed: _isListening ? () => stop() : null,
                    label: 'Stop',
                  ),
                ],
              ),
            )),
      ),
    );
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => new CheckedPopupMenuItem<Language>(
            value: l,
            checked: selectedLang == l,
            child: new Text(l.name),
          ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  Widget _buildButton({String label, VoidCallback onPressed}) => new Padding(
      padding: new EdgeInsets.all(12.0),
      child: new RaisedButton(
        color: Colors.cyan.shade600,
        onPressed: onPressed,
        child: new Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ));

  void start() => _speech
      .listen(locale: selectedLang.code)
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
        () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() => transcription = text);

  void onRecognitionComplete() => setState(() => _isListening = false);
}
