import 'package:lcwassist/Core/CoreFunctions/LcwAssistLoading.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistMessageDialogs/LcwAssistAlertDialogInfo.dart';
import 'package:lcwassist/Core/CoreFunctions/LcwAssistSnackBarDialogs/LcwAssistSnackBarDialogInfo.dart';
import 'package:lcwassist/Core/CoreFunctions/Utils.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/MultiLangComboDTO.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/LanguagesOperations/LanguagesService.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/LoginPageOperations/LoginPageService.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenOperations/TokenService.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/CapacityAnaliysisOperations/CapacityAnaliysisService.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/SalesServiceOperations/ProductSalesPerformanceService.dart';
import 'package:lcwassist/Services/LcwAssistUIServiceOperations/StoreReportOperations/StoreChooseService.dart';

class LcwAssistApplicationManager{

//Future onReadyLanguage;

LcwAssistApplicationManager() {

  // onReadyLanguage = new Future(() async {
  //     setCurrentLanguage = await languagesService.currentLanguage();
  //   });
}





// Future _init() async {
//     setCurrentLanguage = await languagesService.currentLanguage();
//   }


LcwAssistServiceManager _lcwAssistServiceManager;
LcwAssistServiceManager get serviceManager => _lcwAssistServiceManager = new LcwAssistServiceManager();

LanguagesService _languagesService;
LanguagesService get languagesService => _languagesService = new LanguagesService();

GlobalFunctions _globalFunctions;
GlobalFunctions get globalFunctions => _globalFunctions = new GlobalFunctions();

Utils _utils;
Utils get utils => _utils = new Utils();

CurrentLangugeDTO _currentLanguage;
CurrentLangugeDTO get currentLanguage => _currentLanguage;

set setCurrentLanguage(CurrentLangugeDTO currentLanguage) {
    _currentLanguage = currentLanguage;
}


}

class LcwAssistServiceManager{
LcwAssistServiceManager(){}

LoginPageService _loginPageService;
TokenService _tokenService;
ProductSalesPerformanceService _productSalesPerformanceService;
StoreChooseService _storeChooseService;
CapacityAnaliysisService _capacityAnaliysisService;


LoginPageService get loginService => _loginPageService = new LoginPageService();


TokenService get tokenService => _tokenService = new TokenService();
ProductSalesPerformanceService get productSalesPerformanceService => _productSalesPerformanceService = new ProductSalesPerformanceService();
StoreChooseService get storeChooseService => _storeChooseService = new StoreChooseService();
CapacityAnaliysisService get capacityAnaliysisService => _capacityAnaliysisService = new CapacityAnaliysisService();

}

class LcwAssistCoreManager{
LcwAssistCoreManager(){}


}

class GlobalFunctions{
  GlobalFunctions(){}

LcwAssistAlertDialogInfo _lcwAssistAlertDialogInfo;
LcwAssistAlertDialogInfo get lcwAssistAlertDialogInfo => _lcwAssistAlertDialogInfo;

LcwAssistLoading _lcwAssistLoading;
LcwAssistLoading get lcwAssistLoading => _lcwAssistLoading;

LcwAssistSnackBarDialogInfo _lcwAssistSnackBarDialogInfo;
LcwAssistSnackBarDialogInfo get lcwAssistSnackBarDialogInfo => _lcwAssistSnackBarDialogInfo;


}

class BaseConstant{
  BaseConstant(){}


}