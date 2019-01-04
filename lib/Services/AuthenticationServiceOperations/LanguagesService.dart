import 'package:lcwassist/Core/BaseConst/SharedPreferencesConstant.dart';
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/CurrentLangugeDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/LcwAssistLanguagesDTO.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/MultiLangComboDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:localstorage/localstorage.dart';

class LanguagesService{
  LanguagesService(){

  }

Future setCurrentLanguage(int dilId) async{

List<LcwAssistLanguagesDTO> languages = new List<LcwAssistLanguagesDTO>();
//LocalDB'de dil ne bak ona göre çek.

final prefs = await SharedPreferences.getInstance();
String allLanguages = "";
allLanguages = prefs.getString(SharedPreferencesConstant.allLanguage);


 Iterable l = json.decode(allLanguages);
 languages = l.map((i)=> LcwAssistLanguagesDTO.fromJson(i)).where((i)=>i.dilId == dilId).toList();


String asafd = "[";
for(final asd in languages)
{
  asafd += json.encode(asd.toMap());
  asafd += ",";
}
asafd = asafd.substring(0, asafd.lastIndexOf(","));
asafd += "]";


if(prefs.getString(SharedPreferencesConstant.currentLanguage) != "")
prefs.remove(SharedPreferencesConstant.currentLanguage);

if(prefs.getString(SharedPreferencesConstant.currentLanguageId) != "")
prefs.remove(SharedPreferencesConstant.currentLanguageId);

prefs.setString(SharedPreferencesConstant.currentLanguageId, dilId.toString());
prefs.setString(SharedPreferencesConstant.currentLanguage, asafd);//languageString.toString());

}

Future getAllLanguages() async{

final prefs = await SharedPreferences.getInstance();

if(prefs.getString(SharedPreferencesConstant.allLanguage) != "")
prefs.remove(SharedPreferencesConstant.allLanguage);

//String jsonString = await languagesLoadFromFile();

//Map<String, dynamic> body = request.toMap();
var response = await http.post(
      Uri.encodeFull(UrlConst.allLanguagesDataUrl),
      headers: {
        "Content-Type": "application/json"
      }, body: json.encode("{'AksesuarUrun':''}")
    );

List<LcwAssistLanguagesDTO> languages = new List<LcwAssistLanguagesDTO>();


if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
     //result = LcwAssistLanguagesDTO.fromJson(json.decode(response.body));
    
//  Iterable l = json.decode(response.body);
//  languages = l.map((i)=> LcwAssistLanguagesDTO.fromJson(i)).where((i)=>i.dilId == 1).toList();


     prefs.setString(SharedPreferencesConstant.allLanguage,response.body );//json.encode(response.body));

     return languages;
}



}

Future<String> languagesLoadFromFile() async {
  return await rootBundle.loadString('assets/data/languages.json');
}

Future<CurrentLangugeDTO> currentLanguage() async{

CurrentLangugeDTO multiLangComboDTO;
//LocalDB'de dil ne bak ona göre çek.
List<LcwAssistLanguagesDTO> languages = new List<LcwAssistLanguagesDTO>();

String currentLanguage = "";
final prefs = await SharedPreferences.getInstance();
currentLanguage = prefs.getString(SharedPreferencesConstant.currentLanguage);

 Iterable l = json.decode(currentLanguage);
 languages = l.map((i)=> LcwAssistLanguagesDTO.fromJson(i)).toList();

  multiLangComboDTO = toFill(languages);


  return multiLangComboDTO;
}

Future<List<MultiLangComboDTO>> getUsingLanguages() async{

var response = await http.post(
      Uri.encodeFull(UrlConst.getUsingLanguagesUrl),
      headers: {
        "Content-Type": "application/json"
      }, //body: json.encode("{'AksesuarUrun':''}")
    );
    List<MultiLangComboDTO> result = new List<MultiLangComboDTO>();

if (response.statusCode == 200) {
List list = json.decode(response.body) as List;

list.map((i)=> result.add(MultiLangComboDTO.fromJson(i))).toList();

int aa = result.length;
}


return result;
}

CurrentLangugeDTO toFill(List<LcwAssistLanguagesDTO> currentLanguageRawData){
  
  CurrentLangugeDTO currentLanguage = new CurrentLangugeDTO();
  
currentLanguage.setkullaniciGirisi = currentLanguageRawData.firstWhere((i)=>i.kod == "kullaniciGirisi").deger;
currentLanguage.setkullaniciAdi = currentLanguageRawData.firstWhere((i)=>i.kod == "kullaniciAdi").deger;
currentLanguage.setparola = currentLanguageRawData.firstWhere((i)=>i.kod == "parola").deger;
currentLanguage.setgiris = currentLanguageRawData.firstWhere((i)=>i.kod == "giris").deger;
currentLanguage.setturkce = currentLanguageRawData.firstWhere((i)=>i.kod == "turkce").deger;
currentLanguage.setingilizce = currentLanguageRawData.firstWhere((i)=>i.kod == "ingilizce").deger;
currentLanguage.setarapca = currentLanguageRawData.firstWhere((i)=>i.kod == "arapca").deger;
currentLanguage.setrusca = currentLanguageRawData.firstWhere((i)=>i.kod == "rusca").deger;
currentLanguage.setversiyon = currentLanguageRawData.firstWhere((i)=>i.kod == "versiyon").deger;
currentLanguage.setmagaza = currentLanguageRawData.firstWhere((i)=>i.kod == "magaza").deger;
currentLanguage.setanasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "anasayfa").deger;
currentLanguage.setkapasite = currentLanguageRawData.firstWhere((i)=>i.kod == "kapasite").deger;
currentLanguage.setsatis = currentLanguageRawData.firstWhere((i)=>i.kod == "satis").deger;
currentLanguage.setmagazaSec = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaSec").deger;
currentLanguage.setayarlar = currentLanguageRawData.firstWhere((i)=>i.kod == "ayarlar").deger;
currentLanguage.setcikis = currentLanguageRawData.firstWhere((i)=>i.kod == "cikis").deger;
currentLanguage.setmagazaSatisIstatistikleri = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaSatisIstatistikleri").deger;
currentLanguage.setkumulatifSatis = currentLanguageRawData.firstWhere((i)=>i.kod == "kumulatifSatis").deger;
currentLanguage.setbarkodIleSorgulama = currentLanguageRawData.firstWhere((i)=>i.kod == "barkodIleSorgulama").deger;
currentLanguage.setbarkodNumarasiGirin = currentLanguageRawData.firstWhere((i)=>i.kod == "barkodNumarasiGirin").deger;
currentLanguage.seturunVerRenkKodIleSorgula = currentLanguageRawData.firstWhere((i)=>i.kod == "urunVerRenkKodIleSorgula").deger;
currentLanguage.seturunKodunuGirin = currentLanguageRawData.firstWhere((i)=>i.kod == "urunKodunuGirin").deger;
currentLanguage.setrenkKodunuGirin = currentLanguageRawData.firstWhere((i)=>i.kod == "renkKodunuGirin").deger;
currentLanguage.setbarkodTara = currentLanguageRawData.firstWhere((i)=>i.kod == "barkodTara").deger;
currentLanguage.setkameraIleTaratarakAramaYapabilirsiniz = currentLanguageRawData.firstWhere((i)=>i.kod == "kameraIleTaratarakAramaYapabilirsiniz").deger;
currentLanguage.seturun = currentLanguageRawData.firstWhere((i)=>i.kod == "urun").deger;
currentLanguage.setdetaylar = currentLanguageRawData.firstWhere((i)=>i.kod == "detaylar").deger;
currentLanguage.setfeedbackIslemleri = currentLanguageRawData.firstWhere((i)=>i.kod == "feedbackIslemleri").deger;
currentLanguage.setfeedBackGirin = currentLanguageRawData.firstWhere((i)=>i.kod == "feedBackGirin").deger;
currentLanguage.setgonder = currentLanguageRawData.firstWhere((i)=>i.kod == "gonder").deger;
currentLanguage.setmagazaIsimKoduGirin = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaIsimKoduGirin").deger;
currentLanguage.setmagazaKodu = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaKodu").deger;
currentLanguage.setmagazaAdi = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaAdi").deger;
currentLanguage.setdilSecimi = currentLanguageRawData.firstWhere((i)=>i.kod == "dilSecimi").deger;
currentLanguage.settumMagazalar = currentLanguageRawData.firstWhere((i)=>i.kod == "tumMagazalar").deger;
currentLanguage.setoturumBaslatiliyor = currentLanguageRawData.firstWhere((i)=>i.kod == "oturumBaslatiliyor").deger;
currentLanguage.setyukleniyor = currentLanguageRawData.firstWhere((i)=>i.kod == "yukleniyor").deger;
currentLanguage.setsistemAyarlari = currentLanguageRawData.firstWhere((i)=>i.kod == "sistemAyarlari").deger;
currentLanguage.settamam = currentLanguageRawData.firstWhere((i)=>i.kod == "tamam").deger;
currentLanguage.setuyari = currentLanguageRawData.firstWhere((i)=>i.kod == "uyarı").deger;
currentLanguage.setgirisHatasi = currentLanguageRawData.firstWhere((i)=>i.kod == "girisHatasi").deger;
currentLanguage.setkapat = currentLanguageRawData.firstWhere((i)=>i.kod == "kapat").deger;
currentLanguage.setmsg01 = currentLanguageRawData.firstWhere((i)=>i.kod == "msg01").deger;
currentLanguage.setmsg02 = currentLanguageRawData.firstWhere((i)=>i.kod == "msg02").deger;
currentLanguage.setmsg03 = currentLanguageRawData.firstWhere((i)=>i.kod == "msg03").deger;
currentLanguage.setyetkiHatasi = currentLanguageRawData.firstWhere((i)=>i.kod == "yetkiHatasi").deger;
currentLanguage.setguncellemeUyarisi = currentLanguageRawData.firstWhere((i)=>i.kod == "guncellemeUyarisi").deger;
currentLanguage.setmsg04 = currentLanguageRawData.firstWhere((i)=>i.kod == "msg04").deger;
currentLanguage.settumu = currentLanguageRawData.firstWhere((i)=>i.kod == "tumu").deger;
currentLanguage.setaradiginizBarkodBulunamadi = currentLanguageRawData.firstWhere((i)=>i.kod == "aradiginizBarkodBulunamadi").deger;
currentLanguage.settoplamFiiliDolulukBDHaric = currentLanguageRawData.firstWhere((i)=>i.kod == "toplamFiiliDolulukBDHaric").deger;
currentLanguage.setnetNihaiLCMDoluluk = currentLanguageRawData.firstWhere((i)=>i.kod == "netNihaiLCMDoluluk").deger;
currentLanguage.setreyonDolulukLCM = currentLanguageRawData.firstWhere((i)=>i.kod == "reyonDolulukLCM").deger;
currentLanguage.setdepoDolulukLCM = currentLanguageRawData.firstWhere((i)=>i.kod == "depoDolulukLCM").deger;
currentLanguage.setonayLimiti = currentLanguageRawData.firstWhere((i)=>i.kod == "onayLimiti").deger;
currentLanguage.settoplamKapLCMNetNihaiKapLCM = currentLanguageRawData.firstWhere((i)=>i.kod == "toplamKapLCM/NetNihaiKapLCM").deger;
currentLanguage.setreyonStokAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "reyonStokAdet").deger;
currentLanguage.setdepoStokAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "depoStokAdet").deger;
currentLanguage.settoplamStokAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "toplamStokAdet").deger;
currentLanguage.setson7gunSatisAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "son7gunSatisAdet").deger;
currentLanguage.setfiiliCover = currentLanguageRawData.firstWhere((i)=>i.kod == "fiiliCover").deger;
currentLanguage.setyolStokAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "yolStokAdet").deger;
currentLanguage.setonayliOnyasizRezerveAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "onayliOnyasizRezerveAdet").deger;
currentLanguage.settransferINOUT = currentLanguageRawData.firstWhere((i)=>i.kod == "transferINOUT").deger;
currentLanguage.setkapasiteAnaliz = currentLanguageRawData.firstWhere((i)=>i.kod == "kapasiteAnaliz").deger;
currentLanguage.setuygula = currentLanguageRawData.firstWhere((i)=>i.kod == "uygula").deger;
currentLanguage.setAUTSecin = currentLanguageRawData.firstWhere((i)=>i.kod == "AUTSecin").deger;
currentLanguage.setmerchMarkaYasGrupSecin = currentLanguageRawData.firstWhere((i)=>i.kod == "merchMarkaYasGrupSecin").deger;
currentLanguage.setmerchAltGrupSecin = currentLanguageRawData.firstWhere((i)=>i.kod == "merchAltGrupSecin").deger;
currentLanguage.setbuyerGrupSecin = currentLanguageRawData.firstWhere((i)=>i.kod == "buyerGrupSecin").deger;
currentLanguage.seturunPerformansAnaliz = currentLanguageRawData.firstWhere((i)=>i.kod == "urunPerformansAnaliz").deger;
currentLanguage.setmagazaBilgileriniGirin = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaBilgileriniGirin").deger;
currentLanguage.setmsg05 = currentLanguageRawData.firstWhere((i)=>i.kod == "msg05").deger;
currentLanguage.seturunBulunamadi = currentLanguageRawData.firstWhere((i)=>i.kod == "urunBulunamadi").deger;
currentLanguage.setgirisDegerleriniKontrolEdiniz = currentLanguageRawData.firstWhere((i)=>i.kod == "girisDegerleriniKontrolEdiniz").deger;
currentLanguage.setbildirimBasariylaGonderildi = currentLanguageRawData.firstWhere((i)=>i.kod == "bildirimBasariylaGonderildi").deger;
currentLanguage.setkumulatifSatisTutar = currentLanguageRawData.firstWhere((i)=>i.kod == "kumulatifSatisTutar").deger;
currentLanguage.setortalamaPSF = currentLanguageRawData.firstWhere((i)=>i.kod == "ortalamaPSF").deger;
currentLanguage.setkumulatifSatisAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "kumulatifSatisAdet").deger;
currentLanguage.setkumulatifSevkAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "kumulatifSevkAdet").deger;
currentLanguage.setstr = currentLanguageRawData.firstWhere((i)=>i.kod == "str").deger;
currentLanguage.setilkPSF = currentLanguageRawData.firstWhere((i)=>i.kod == "ilkPSF").deger;
currentLanguage.setindirimOrani = currentLanguageRawData.firstWhere((i)=>i.kod == "indirimOrani").deger;
currentLanguage.setsonPSF = currentLanguageRawData.firstWhere((i)=>i.kod == "sonPSF").deger;
currentLanguage.setmerkezDepoStok = currentLanguageRawData.firstWhere((i)=>i.kod == "merkezDepoStok").deger;
currentLanguage.setbulunurluk = currentLanguageRawData.firstWhere((i)=>i.kod == "bulunurluk").deger;
currentLanguage.setderinlik = currentLanguageRawData.firstWhere((i)=>i.kod == "derinlik").deger;
currentLanguage.setrafOmru = currentLanguageRawData.firstWhere((i)=>i.kod == "rafOmru").deger;
currentLanguage.setbosGecemezsiniz = currentLanguageRawData.firstWhere((i)=>i.kod == "bosGecemezsiniz").deger;
currentLanguage.setgonderiliyor = currentLanguageRawData.firstWhere((i)=>i.kod == "gonderiliyor").deger;
currentLanguage.setbilgi = currentLanguageRawData.firstWhere((i)=>i.kod == "bilgi").deger;
currentLanguage.setfeedbackAlinmistir = currentLanguageRawData.firstWhere((i)=>i.kod == "feedbackAlinmistir").deger;
currentLanguage.setbaslat = currentLanguageRawData.firstWhere((i)=>i.kod == "baslat").deger;
currentLanguage.setiptal = currentLanguageRawData.firstWhere((i)=>i.kod == "iptal").deger;
currentLanguage.setkonusmaDurdur = currentLanguageRawData.firstWhere((i)=>i.kod == "konusmaDurdur").deger;
currentLanguage.setkonusmaBaslat = currentLanguageRawData.firstWhere((i)=>i.kod == "konusmaBaslat").deger;
currentLanguage.setmsg6 = currentLanguageRawData.firstWhere((i)=>i.kod == "msg6").deger;
currentLanguage.setmagazaAraniyor = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaAraniyor").deger;
currentLanguage.sethata = currentLanguageRawData.firstWhere((i)=>i.kod == "hata").deger;
currentLanguage.setlutfenBirMagazaSecin = currentLanguageRawData.firstWhere((i)=>i.kod == "lutfenBirMagazaSecin").deger;
currentLanguage.setaradiginizKriterlerdeMagazaBulunamadi = currentLanguageRawData.firstWhere((i)=>i.kod == "aradıginizKriterlerdeMagazaBulunamadi").deger;
currentLanguage.setoutlet = currentLanguageRawData.firstWhere((i)=>i.kod == "outlet").deger;
currentLanguage.setinlet = currentLanguageRawData.firstWhere((i)=>i.kod == "inlet").deger;
currentLanguage.setadi = currentLanguageRawData.firstWhere((i)=>i.kod == "adi").deger;
currentLanguage.setkodu = currentLanguageRawData.firstWhere((i)=>i.kod == "kodu").deger;
currentLanguage.setpersonelSayisi = currentLanguageRawData.firstWhere((i)=>i.kod == "personelSayisi").deger;
currentLanguage.setmusteriProfili = currentLanguageRawData.firstWhere((i)=>i.kod == "musteriProfili").deger;
currentLanguage.setmetrekare = currentLanguageRawData.firstWhere((i)=>i.kod == "metrekare").deger;
currentLanguage.settipi = currentLanguageRawData.firstWhere((i)=>i.kod == "tipi").deger;
currentLanguage.setsezon = currentLanguageRawData.firstWhere((i)=>i.kod == "sezon").deger;
currentLanguage.setoperasyonelBolge = currentLanguageRawData.firstWhere((i)=>i.kod == "operasyonelBolge").deger;
currentLanguage.setmagazaBirinciMudur = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaBirinciMudur").deger;
currentLanguage.setmagazaIkinciMudur = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaIkinciMudur").deger;
currentLanguage.setmagazaKimlik = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaKimlik").deger;
currentLanguage.setmagazaKarne = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaKarne").deger;
currentLanguage.setsectiginizKriterlerdeDataBulunamamistir = currentLanguageRawData.firstWhere((i)=>i.kod == "sectiginizKriterlerdeDataBulunamamistir").deger;
currentLanguage.setsatisTutarKDVsiz = currentLanguageRawData.firstWhere((i)=>i.kod == "satisTutarKDVsiz").deger;
currentLanguage.settutarBuyume = currentLanguageRawData.firstWhere((i)=>i.kod == "tutarBuyume").deger;
currentLanguage.setsatisTutarGY_KDVsiz = currentLanguageRawData.firstWhere((i)=>i.kod == "satisTutarGY_KDVsiz").deger;
currentLanguage.setsatisAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "satisAdet").deger;
currentLanguage.setadetBuyume = currentLanguageRawData.firstWhere((i)=>i.kod == "adetBuyume").deger;
currentLanguage.setsatisAdetGY = currentLanguageRawData.firstWhere((i)=>i.kod == "satisAdetGY").deger;
currentLanguage.sethedefTutar = currentLanguageRawData.firstWhere((i)=>i.kod == "hedefTutar").deger;
currentLanguage.sethedefTutarYuzdesi = currentLanguageRawData.firstWhere((i)=>i.kod == "hedefTutarYuzdesi").deger;
currentLanguage.setconversionRate = currentLanguageRawData.firstWhere((i)=>i.kod == "conversionRate").deger;
currentLanguage.setmusteriZiyareySayisi = currentLanguageRawData.firstWhere((i)=>i.kod == "musteriZiyareySayisi").deger;
currentLanguage.setsepetBuyukluguAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "sepetBuyukluguAdet").deger;
currentLanguage.setsepetBuyukluguTutarKDVsiz = currentLanguageRawData.firstWhere((i)=>i.kod == "sepetBuyukluguTutarKDVsiz").deger;
currentLanguage.setstokDevirHizi = currentLanguageRawData.firstWhere((i)=>i.kod == "stokDevirHizi").deger;
currentLanguage.setM2Verimlilik = currentLanguageRawData.firstWhere((i)=>i.kod == "M2Verimlilik").deger;
currentLanguage.setbeden = currentLanguageRawData.firstWhere((i)=>i.kod == "beden").deger;
currentLanguage.setmerkezDepoStokAdet = currentLanguageRawData.firstWhere((i)=>i.kod == "merkezDepoStokAdet").deger;
currentLanguage.setyuzdeSTR = currentLanguageRawData.firstWhere((i)=>i.kod == "yuzdeSTR").deger;
currentLanguage.sethosgeldiniz = currentLanguageRawData.firstWhere((i)=>i.kod == "hosgeldiniz").deger;
currentLanguage.setmagazaSatisIstatistikleri = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaSatisIstatistikleri").deger;
currentLanguage.setkapasiteFiltre = currentLanguageRawData.firstWhere((i)=>i.kod == "kapasiteFiltre").deger;
currentLanguage.settemizle = currentLanguageRawData.firstWhere((i)=>i.kod == "temizle").deger;
currentLanguage.setfiltrele = currentLanguageRawData.firstWhere((i)=>i.kod == "filtrele").deger;
currentLanguage.setbirFeedBackBirak = currentLanguageRawData.firstWhere((i)=>i.kod == "birFeedBackBirak").deger;
currentLanguage.seturunBagimsizFeedbackGonder = currentLanguageRawData.firstWhere((i)=>i.kod == "urunBagimsizFeedbackGonder").deger;
currentLanguage.seturunBagimliBagimsizFeedbackGonder = currentLanguageRawData.firstWhere((i)=>i.kod == "urunBagimliBagimsizFeedbackGonder").deger;
currentLanguage.setaradiginizKriterlerdeDataBulunamadi = currentLanguageRawData.firstWhere((i)=>i.kod == "aradiginizKriterlerdeDataBulunamadi").deger;
currentLanguage.setbirimLCM = currentLanguageRawData.firstWhere((i)=>i.kod == "birimLCM").deger;
currentLanguage.setworstOptions = currentLanguageRawData.firstWhere((i)=>i.kod == "worstOptions").deger;
currentLanguage.setbestWorstOptions = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstOptions").deger;
currentLanguage.setbestWorstOptionsAciklama = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstOptionsAciklama").deger;
currentLanguage.setbestOptions = currentLanguageRawData.firstWhere((i)=>i.kod == "bestOptions").deger;
currentLanguage.setbestWorstOptionSiralamaTipi = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstOptionSiralamaTipi").deger;
currentLanguage.setbestWorstDMKupKar = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstDMKupKar").deger;
currentLanguage.setbestWorstDevirHizi = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstDevirHizi").deger;
currentLanguage.setoturumSonlanmistir = currentLanguageRawData.firstWhere((i)=>i.kod == "oturumSonlanmistir").deger;
currentLanguage.setsonraki = currentLanguageRawData.firstWhere((i)=>i.kod == "sonraki").deger;
currentLanguage.setbestWorstListColumn0 = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstListColumn0").deger;
currentLanguage.setbestWorstListColumn1 = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstListColumn1").deger;
currentLanguage.setbestWorstListColumn2 = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstListColumn2").deger;
currentLanguage.setbestWorstListColumn3 = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstListColumn3").deger;
currentLanguage.setbestWorstListColumn4 = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstListColumn4").deger;
currentLanguage.setbestWorstListColumn5 = currentLanguageRawData.firstWhere((i)=>i.kod == "bestWorstListColumn5").deger;
currentLanguage.setkapasitePerformans = currentLanguageRawData.firstWhere((i)=>i.kod == "kapasitePerformans").deger;

return currentLanguage;
  }



}