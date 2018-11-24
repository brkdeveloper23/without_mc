import 'package:json_annotation/json_annotation.dart';
import 'package:lcwassist/DataAccess/LanguageDTOs/LcwAssistLanguagesDTO.dart';
// @JsonSerializable()
// class CurrentLangugeDTO{

// @JsonKey(name: 'kullaniciGirisi')
// String kullaniciGirisi;
// @JsonKey(name: 'kullaniciAdi')
// String kullaniciAdi;
// @JsonKey(name: 'parola')
// String parola;
// @JsonKey(name: 'giris')
// String giris;
// @JsonKey(name: 'turkce')
// String turkce;
// @JsonKey(name: 'ingilizce')
// String ingilizce;
// @JsonKey(name: 'arapca')
// String arapca;
// @JsonKey(name: 'rusca')
// String rusca;
// @JsonKey(name: 'versiyon')
// String versiyon;
// @JsonKey(name: 'magaza')
// String magaza;
// @JsonKey(name: 'anasayfa')
// String anasayfa;
// @JsonKey(name: 'kapasite')
// String kapasite;
// @JsonKey(name: 'satis')
// String satis;
// @JsonKey(name: 'magazaKarne')
// String magazaKarne;
// @JsonKey(name: 'magazaSec')
// String magazaSec;
// @JsonKey(name: 'ayarlar')
// String ayarlar;
// @JsonKey(name: 'cikis')
// String cikis;
// @JsonKey(name: 'magazaSatisIstatistikleri')
// String magazaSatisIstatistikleri;
// @JsonKey(name: 'kumulatifSatis')
// String kumulatifSatis;
// @JsonKey(name: 'barkodIleSorgulama')
// String barkodIleSorgulama;
// @JsonKey(name: 'barkodNumarasiGirin')
// String barkodNumarasiGirin;
// @JsonKey(name: 'urunVerRenkKodIleSorgula')
// String urunVerRenkKodIleSorgula;
// @JsonKey(name: 'urunKodunuGirin')
// String urunKodunuGirin;
// @JsonKey(name: 'renkKodunuGirin')
// String renkKodunuGirin;
// @JsonKey(name: 'barkodTara')
// String barkodTara;
// @JsonKey(name: 'kameraIleTaratarakAramaYapabilirsiniz')
// String kameraIleTaratarakAramaYapabilirsiniz;
// @JsonKey(name: 'urun')
// String urun;
// @JsonKey(name: 'detaylar')
// String detaylar;
// @JsonKey(name: 'feedbackIslemleri')
// String feedbackIslemleri;
// @JsonKey(name: 'feedBackGirin')
// String feedBackGirin;
// @JsonKey(name: 'gonder')
// String gonder;
// @JsonKey(name: 'magazaIsimKoduGirin')
// String magazaIsimKoduGirin;
// @JsonKey(name: 'magazaKodu')
// String magazaKodu;
// @JsonKey(name: 'magazaAdi')
// String magazaAdi;

//  CurrentLangugeDTO(
//       this.kullaniciGirisi,this.kullaniciAdi,this.arapca,this.ayarlar,this.anasayfa,this.barkodNumarasiGirin,this.barkodTara,this.cikis,this.kameraIleTaratarakAramaYapabilirsiniz,
//       this.detaylar,this.barkodIleSorgulama,this.feedbackIslemleri,this.feedBackGirin,this.gonder,this.giris,this.kapasite,this.ingilizce,this.kumulatifSatis,
//       this.magaza,this.magazaAdi,this.magazaIsimKoduGirin,this.magazaKarne,this.magazaKodu,this.magazaSatisIstatistikleri,this.magazaSec,this.parola,
//       this.renkKodunuGirin,this.rusca,this.satis,this.turkce,this.urunKodunuGirin,this.urun,this.versiyon,this.urunVerRenkKodIleSorgula
//       );

// }

class CurrentLangugeDTO {
  //int _dilId;
String _kullaniciGirisi="";
String _kullaniciAdi="";
String _parola="";
String _giris="";
String _turkce="";
String _ingilizce="";
String _arapca="";
String _rusca="";
String _versiyon="";
String _magaza="";
String _anasayfa="";
String _kapasite="";
String _satis="";
String _magazaSec="";
String _ayarlar="";
String _cikis="";
String _magazaSatisIstatistikleri="";
String _kumulatifSatis="";
String _barkodIleSorgulama="";
String _barkodNumarasiGirin="";
String _urunVerRenkKodIleSorgula="";
String _urunKodunuGirin="";
String _renkKodunuGirin="";
String _barkodTara="";
String _kameraIleTaratarakAramaYapabilirsiniz="";
String _urun="";
String _detaylar="";
String _feedbackIslemleri="";
String _feedBackGirin="";
String _gonder="";
String _magazaIsimKoduGirin="";
String _magazaKodu="";
String _magazaAdi="";
String _dilSecimi="";
String _tumMagazalar="";
String _oturumBaslatiliyor="";
String _yukleniyor="";
String _sistemAyarlari="";
String _tamam="";
String _uyari="";
String _girisHatasi="";
String _kapat="";
String _msg01="";
String _msg02="";
String _msg03="";
String _yetkiHatasi="";
String _guncellemeUyarisi="";
String _msg04="";
String _tumu="";
String _aradiginizBarkodBulunamadi="";
String _toplamFiiliDolulukBDHaric="";
String _netNihaiLCMDoluluk="";
String _reyonDolulukLCM="";
String _depoDolulukLCM="";
String _onayLimiti="";
String _toplamKapLCMNetNihaiKapLCM="";
String _reyonStokAdet="";
String _depoStokAdet="";
String _toplamStokAdet="";
String _son7gunSatisAdet="";
String _fiiliCover="";
String _yolStokAdet="";
String _onayliOnyasizRezerveAdet="";
String _transferINOUT="";
String _kapasiteAnaliz="";
String _uygula="";
String _AUTSecin="";
String _merchMarkaYasGrupSecin="";
String _merchAltGrupSecin="";
String _buyerGrupSecin="";
String _urunPerformansAnaliz="";
String _magazaBilgileriniGirin="";
String _msg05="";
String _urunBulunamadi="";
String _girisDegerleriniKontrolEdiniz="";
String _bildirimBasariylaGonderildi="";
String _kumulatifSatisTutar="";
String _ortalamaPSF="";
String _kumulatifSatisAdet="";
String _kumulatifSevkAdet="";
String _str="";
String _ilkPSF="";
String _indirimOrani="";
String _sonPSF="";
String _merkezDepoStok="";
String _bulunurluk="";
String _derinlik="";
String _rafOmru="";
String _bosGecemezsiniz="";
String _gonderiliyor="";
String _bilgi="";
String _feedbackAlinmistir="";
String _baslat="";
String _iptal="";
String _konusmaDurdur="";
String _konusmaBaslat="";
String _msg6="";
String _magazaAraniyor="";
String _hata="";
String _lutfenBirMagazaSecin="";
String _aradiginizKriterlerdeMagazaBulunamadi="";
String _outlet="";
String _inlet="";
String _adi="";
String _kodu="";
String _personelSayisi="";
String _musteriProfili="";
String _metrekare="";
String _tipi="";
String _sezon="";
String _operasyonelBolge="";
String _magazaBirinciMudur="";
String _magazaIkinciMudur="";
String _magazaKimlik="";
String _magazaKarne="";
String _sectiginizKriterlerdeDataBulunamamistir="";
String _satisTutarKDVsiz="";
String _tutarBuyume="";
String _satisTutarGY_KDVsiz="";
String _satisAdet="";
String _adetBuyume="";
String _satisAdetGY="";
String _hedefTutar="";
String _hedefTutarYuzdesi="";
String _conversionRate="";
String _musteriZiyareySayisi="";
String _sepetBuyukluguAdet="";
String _sepetBuyukluguTutarKDVsiz="";
String _stokDevirHizi="";
String _m2Verimlilik="";
String _beden="";
String _merkezDepoStokAdet="";
String _yuzdeSTR="";

  // CurrentLangugeDTO(
  //   this._dilId,
  //     this._kullaniciGirisi,
  //     this._kullaniciAdi,
  //     this._arapca,
  //     this._ayarlar,
  //     this._anasayfa,
  //     this._barkodNumarasiGirin,
  //     this._barkodTara,
  //     this._cikis,
  //     this._kameraIleTaratarakAramaYapabilirsiniz,
  //     this._detaylar,
  //     this._barkodIleSorgulama,
  //     this._feedbackIslemleri,
  //     this._feedBackGirin,
  //     this._gonder,
  //     this._giris,
  //     this._kapasite,
  //     this._ingilizce,
  //     this._kumulatifSatis,
  //     this._magaza,
  //     this._magazaAdi,
  //     this._magazaIsimKoduGirin,
  //     this._magazaKarne,
  //     this._magazaKodu,
  //     this._magazaSatisIstatistikleri,
  //     this._magazaSec,
  //     this._parola,
  //     this._renkKodunuGirin,
  //     this._rusca,
  //     this._satis,
  //     this._turkce,
  //     this._urunKodunuGirin,
  //     this._urun,
  //     this._versiyon,
  //     this._urunVerRenkKodIleSorgula);

set setkullaniciGirisi(String kullaniciGirisi) {_kullaniciGirisi = kullaniciGirisi;}
set setkullaniciAdi(String kullaniciAdi) {_kullaniciAdi = kullaniciAdi;}
set setparola(String parola) {_parola = parola;}
set setgiris(String giris) {_giris = giris;}
set setturkce(String turkce) {_turkce = turkce;}
set setingilizce(String ingilizce) {_ingilizce = ingilizce;}
set setarapca(String arapca) {_arapca = arapca;}
set setrusca(String rusca) {_rusca = rusca;}
set setversiyon(String versiyon) {_versiyon = versiyon;}
set setmagaza(String magaza) {_magaza = magaza;}
set setanasayfa(String anasayfa) {_anasayfa = anasayfa;}
set setkapasite(String kapasite) {_kapasite = kapasite;}
set setsatis(String satis) {_satis = satis;}
set setmagazaSec(String magazaSec) {_magazaSec = magazaSec;}
set setayarlar(String ayarlar) {_ayarlar = ayarlar;}
set setcikis(String cikis) {_cikis = cikis;}
set setmagazaSatisIstatistikleri(String magazaSatisIstatistikleri) {_magazaSatisIstatistikleri = magazaSatisIstatistikleri;}
set setkumulatifSatis(String kumulatifSatis) {_kumulatifSatis = kumulatifSatis;}
set setbarkodIleSorgulama(String barkodIleSorgulama) {_barkodIleSorgulama = barkodIleSorgulama;}
set setbarkodNumarasiGirin(String barkodNumarasiGirin) {_barkodNumarasiGirin = barkodNumarasiGirin;}
set seturunVerRenkKodIleSorgula(String urunVerRenkKodIleSorgula) {_urunVerRenkKodIleSorgula = urunVerRenkKodIleSorgula;}
set seturunKodunuGirin(String urunKodunuGirin) {_urunKodunuGirin = urunKodunuGirin;}
set setrenkKodunuGirin(String renkKodunuGirin) {_renkKodunuGirin = renkKodunuGirin;}
set setbarkodTara(String barkodTara) {_barkodTara = barkodTara;}
set setkameraIleTaratarakAramaYapabilirsiniz(String kameraIleTaratarakAramaYapabilirsiniz) {_kameraIleTaratarakAramaYapabilirsiniz = kameraIleTaratarakAramaYapabilirsiniz;}
set seturun(String urun) {_urun = urun;}
set setdetaylar(String detaylar) {_detaylar = detaylar;}
set setfeedbackIslemleri(String feedbackIslemleri) {_feedbackIslemleri = feedbackIslemleri;}
set setfeedBackGirin(String feedBackGirin) {_feedBackGirin = feedBackGirin;}
set setgonder(String gonder) {_gonder = gonder;}
set setmagazaIsimKoduGirin(String magazaIsimKoduGirin) {_magazaIsimKoduGirin = magazaIsimKoduGirin;}
set setmagazaKodu(String magazaKodu) {_magazaKodu = magazaKodu;}
set setmagazaAdi(String magazaAdi) {_magazaAdi = magazaAdi;}
set setdilSecimi(String dilSecimi) {_dilSecimi = dilSecimi;}
set settumMagazalar(String tumMagazalar) {_tumMagazalar = tumMagazalar;}
set setoturumBaslatiliyor(String oturumBaslatiliyor) {_oturumBaslatiliyor = oturumBaslatiliyor;}
set setyukleniyor(String yukleniyor) {_yukleniyor = yukleniyor;}
set setsistemAyarlari(String sistemAyarlari) {_sistemAyarlari = sistemAyarlari;}
set settamam(String tamam) {_tamam = tamam;}
set setuyari(String uyari) {_uyari = uyari;}
set setgirisHatasi(String girisHatasi) {_girisHatasi = girisHatasi;}
set setkapat(String kapat) {_kapat = kapat;}
set setmsg01(String msg01) {_msg01 = msg01;}
set setmsg02(String msg02) {_msg02 = msg02;}
set setmsg03(String msg03) {_msg03 = msg03;}
set setyetkiHatasi(String yetkiHatasi) {_yetkiHatasi = yetkiHatasi;}
set setguncellemeUyarisi(String guncellemeUyarisi) {_guncellemeUyarisi = guncellemeUyarisi;}
set setmsg04(String msg04) {_msg04 = msg04;}
set settumu(String tumu) {_tumu = tumu;}
set setaradiginizBarkodBulunamadi(String aradiginizBarkodBulunamadi) {_aradiginizBarkodBulunamadi = aradiginizBarkodBulunamadi;}
set settoplamFiiliDolulukBDHaric(String toplamFiiliDolulukBDHaric) {_toplamFiiliDolulukBDHaric = toplamFiiliDolulukBDHaric;}
set setnetNihaiLCMDoluluk(String netNihaiLCMDoluluk) {_netNihaiLCMDoluluk = netNihaiLCMDoluluk;}
set setreyonDolulukLCM(String reyonDolulukLCM) {_reyonDolulukLCM = reyonDolulukLCM;}
set setdepoDolulukLCM(String depoDolulukLCM) {_depoDolulukLCM = depoDolulukLCM;}
set setonayLimiti(String onayLimiti) {_onayLimiti = onayLimiti;}
set settoplamKapLCMNetNihaiKapLCM(String toplamKapLCMNetNihaiKapLCM) {_toplamKapLCMNetNihaiKapLCM = toplamKapLCMNetNihaiKapLCM;}
set setreyonStokAdet(String reyonStokAdet) {_reyonStokAdet = reyonStokAdet;}
set setdepoStokAdet(String depoStokAdet) {_depoStokAdet = depoStokAdet;}
set settoplamStokAdet(String toplamStokAdet) {_toplamStokAdet = toplamStokAdet;}
set setson7gunSatisAdet(String son7gunSatisAdet) {_son7gunSatisAdet = son7gunSatisAdet;}
set setfiiliCover(String fiiliCover) {_fiiliCover = fiiliCover;}
set setyolStokAdet(String yolStokAdet) {_yolStokAdet = yolStokAdet;}
set setonayliOnyasizRezerveAdet(String onayliOnyasizRezerveAdet) {_onayliOnyasizRezerveAdet = onayliOnyasizRezerveAdet;}
set settransferINOUT(String transferINOUT) {_transferINOUT = transferINOUT;}
set setkapasiteAnaliz(String kapasiteAnaliz) {_kapasiteAnaliz = kapasiteAnaliz;}
set setuygula(String uygula) {_uygula = uygula;}
set setAUTSecin(String AUTSecin) {_AUTSecin = AUTSecin;}
set setmerchMarkaYasGrupSecin(String merchMarkaYasGrupSecin) {_merchMarkaYasGrupSecin = merchMarkaYasGrupSecin;}
set setmerchAltGrupSecin(String merchAltGrupSecin) {_merchAltGrupSecin = merchAltGrupSecin;}
set setbuyerGrupSecin(String buyerGrupSecin) {_buyerGrupSecin = buyerGrupSecin;}
set seturunPerformansAnaliz(String urunPerformansAnaliz) {_urunPerformansAnaliz = urunPerformansAnaliz;}
set setmagazaBilgileriniGirin(String magazaBilgileriniGirin) {_magazaBilgileriniGirin = magazaBilgileriniGirin;}
set setmsg05(String msg05) {_msg05 = msg05;}
set seturunBulunamadi(String urunBulunamadi) {_urunBulunamadi = urunBulunamadi;}
set setgirisDegerleriniKontrolEdiniz(String girisDegerleriniKontrolEdiniz) {_girisDegerleriniKontrolEdiniz = girisDegerleriniKontrolEdiniz;}
set setbildirimBasariylaGonderildi(String bildirimBasariylaGonderildi) {_bildirimBasariylaGonderildi = bildirimBasariylaGonderildi;}
set setkumulatifSatisTutar(String kumulatifSatisTutar) {_kumulatifSatisTutar = kumulatifSatisTutar;}
set setortalamaPSF(String ortalamaPSF) {_ortalamaPSF = ortalamaPSF;}
set setkumulatifSatisAdet(String kumulatifSatisAdet) {_kumulatifSatisAdet = kumulatifSatisAdet;}
set setkumulatifSevkAdet(String kumulatifSevkAdet) {_kumulatifSevkAdet = kumulatifSevkAdet;}
set setstr(String str) {_str = str;}
set setilkPSF(String ilkPSF) {_ilkPSF = ilkPSF;}
set setindirimOrani(String indirimOrani) {_indirimOrani = indirimOrani;}
set setsonPSF(String sonPSF) {_sonPSF = sonPSF;}
set setmerkezDepoStok(String merkezDepoStok) {_merkezDepoStok = merkezDepoStok;}
set setbulunurluk(String bulunurluk) {_bulunurluk = bulunurluk;}
set setderinlik(String derinlik) {_derinlik = derinlik;}
set setrafOmru(String rafOmru) {_rafOmru = rafOmru;}
set setbosGecemezsiniz(String bosGecemezsiniz) {_bosGecemezsiniz = bosGecemezsiniz;}
set setgonderiliyor(String gonderiliyor) {_gonderiliyor = gonderiliyor;}
set setbilgi(String bilgi) {_bilgi = bilgi;}
set setfeedbackAlinmistir(String feedbackAlinmistir) {_feedbackAlinmistir = feedbackAlinmistir;}
set setbaslat(String baslat) {_baslat = baslat;}
set setiptal(String iptal) {_iptal = iptal;}
set setkonusmaDurdur(String konusmaDurdur) {_konusmaDurdur = konusmaDurdur;}
set setkonusmaBaslat(String konusmaBaslat) {_konusmaBaslat = konusmaBaslat;}
set setmsg6(String msg6) {_msg6 = msg6;}
set setmagazaAraniyor(String magazaAraniyor) {_magazaAraniyor = magazaAraniyor;}
set sethata(String hata) {_hata = hata;}
set setlutfenBirMagazaSecin(String lutfenBirMagazaSecin) {_lutfenBirMagazaSecin = lutfenBirMagazaSecin;}
set setaradiginizKriterlerdeMagazaBulunamadi(String aradiginizKriterlerdeMagazaBulunamadi) {_aradiginizKriterlerdeMagazaBulunamadi = aradiginizKriterlerdeMagazaBulunamadi;}
set setoutlet(String outlet) {_outlet = outlet;}
set setinlet(String inlet) {_inlet = inlet;}
set setadi(String adi) {_adi = adi;}
set setkodu(String kodu) {_kodu = kodu;}
set setpersonelSayisi(String personelSayisi) {_personelSayisi = personelSayisi;}
set setmusteriProfili(String musteriProfili) {_musteriProfili = musteriProfili;}
set setmetrekare(String metrekare) {_metrekare = metrekare;}
set settipi(String tipi) {_tipi = tipi;}
set setsezon(String sezon) {_sezon = sezon;}
set setoperasyonelBolge(String operasyonelBolge) {_operasyonelBolge = operasyonelBolge;}
set setmagazaBirinciMudur(String magazaBirinciMudur) {_magazaBirinciMudur = magazaBirinciMudur;}
set setmagazaIkinciMudur(String magazaIkinciMudur) {_magazaIkinciMudur = magazaIkinciMudur;}
set setmagazaKimlik(String magazaKimlik) {_magazaKimlik = magazaKimlik;}
set setmagazaKarne(String magazaKarne) {_magazaKarne = magazaKarne;}
set setsectiginizKriterlerdeDataBulunamamistir(String sectiginizKriterlerdeDataBulunamamistir) {_sectiginizKriterlerdeDataBulunamamistir = sectiginizKriterlerdeDataBulunamamistir;}
set setsatisTutarKDVsiz(String satisTutarKDVsiz) {_satisTutarKDVsiz = satisTutarKDVsiz;}
set settutarBuyume(String tutarBuyume) {_tutarBuyume = tutarBuyume;}
set setsatisTutarGY_KDVsiz(String satisTutarGY_KDVsiz) {_satisTutarGY_KDVsiz = satisTutarGY_KDVsiz;}
set setsatisAdet(String satisAdet) {_satisAdet = satisAdet;}
set setadetBuyume(String adetBuyume) {_adetBuyume = adetBuyume;}
set setsatisAdetGY(String satisAdetGY) {_satisAdetGY = satisAdetGY;}
set sethedefTutar(String hedefTutar) {_hedefTutar = hedefTutar;}
set sethedefTutarYuzdesi(String hedefTutarYuzdesi) {_hedefTutarYuzdesi = hedefTutarYuzdesi;}
set setconversionRate(String conversionRate) {_conversionRate = conversionRate;}
set setmusteriZiyareySayisi(String musteriZiyareySayisi) {_musteriZiyareySayisi = musteriZiyareySayisi;}
set setsepetBuyukluguAdet(String sepetBuyukluguAdet) {_sepetBuyukluguAdet = sepetBuyukluguAdet;}
set setsepetBuyukluguTutarKDVsiz(String sepetBuyukluguTutarKDVsiz) {_sepetBuyukluguTutarKDVsiz = sepetBuyukluguTutarKDVsiz;}
set setstokDevirHizi(String stokDevirHizi) {_stokDevirHizi = stokDevirHizi;}
set setM2Verimlilik(String m2Verimlilik) {_m2Verimlilik = m2Verimlilik;}
set setbeden(String beden) {_beden = beden;}
set setmerkezDepoStokAdet(String merkezDepoStokAdet) {_merkezDepoStokAdet = merkezDepoStokAdet;}
set setyuzdeSTR(String yuzdeSTR) {_yuzdeSTR = yuzdeSTR;}


  String get getkullaniciGirisi => _kullaniciGirisi;
  String get getkullaniciAdi => _kullaniciAdi;
  String get getparola => _parola;
  String get getgiris => _giris;
  String get getturkce => _turkce;
  String get getingilizce => _ingilizce;
  String get getarapca => _arapca;
  String get getrusca => _rusca;
  String get getversiyon => _versiyon;
  String get getmagaza => _magaza;
  String get getanasayfa => _anasayfa;
  String get getkapasite => _kapasite;
  String get getsatis => _satis;
  String get getmagazaSec => _magazaSec;
  String get getayarlar => _ayarlar;
  String get getcikis => _cikis;
  String get getmagazaSatisIstatistikleri => _magazaSatisIstatistikleri;
  String get getkumulatifSatis => _kumulatifSatis;
  String get getbarkodIleSorgulama => _barkodIleSorgulama;
  String get getbarkodNumarasiGirin => _barkodNumarasiGirin;
  String get geturunVerRenkKodIleSorgula => _urunVerRenkKodIleSorgula;
  String get geturunKodunuGirin => _urunKodunuGirin;
  String get getrenkKodunuGirin => _renkKodunuGirin;
  String get getbarkodTara => _barkodTara;
  String get getkameraIleTaratarakAramaYapabilirsiniz => _kameraIleTaratarakAramaYapabilirsiniz;
  String get geturun => _urun;
  String get getdetaylar => _detaylar;
  String get getfeedbackIslemleri => _feedbackIslemleri;
  String get getfeedBackGirin => _feedBackGirin;
  String get getgonder => _gonder;
  String get getmagazaIsimKoduGirin => _magazaIsimKoduGirin;
  String get getmagazaKodu => _magazaKodu;
  String get getmagazaAdi => _magazaAdi;
  String get getdilSecimi => _dilSecimi;
  String get gettumMagazalar => _tumMagazalar;
  String get getoturumBaslatiliyor => _oturumBaslatiliyor;
  String get getyukleniyor => _yukleniyor;
  String get getsistemAyarlari => _sistemAyarlari;
  String get gettamam => _tamam;
  String get getuyari => _uyari;
  String get getgirisHatasi => _girisHatasi;
  String get getkapat => _kapat;
  String get getmsg01 => _msg01;
  String get getmsg02 => _msg02;
  String get getmsg03 => _msg03;
  String get getyetkiHatasi => _yetkiHatasi;
  String get getguncellemeUyarisi => _guncellemeUyarisi;
  String get getmsg04 => _msg04;
  String get gettumu => _tumu;
  String get getaradiginizBarkodBulunamadi => _aradiginizBarkodBulunamadi;
  String get gettoplamFiiliDolulukBDHaric => _toplamFiiliDolulukBDHaric;
  String get getnetNihaiLCMDoluluk => _netNihaiLCMDoluluk;
  String get getreyonDolulukLCM => _reyonDolulukLCM;
  String get getdepoDolulukLCM => _depoDolulukLCM;
  String get getonayLimiti => _onayLimiti;
  String get gettoplamKapLCMNetNihaiKapLCM => _toplamKapLCMNetNihaiKapLCM;
  String get getreyonStokAdet => _reyonStokAdet;
  String get getdepoStokAdet => _depoStokAdet;
  String get gettoplamStokAdet => _toplamStokAdet;
  String get getson7gunSatisAdet => _son7gunSatisAdet;
  String get getfiiliCover => _fiiliCover;
  String get getyolStokAdet => _yolStokAdet;
  String get getonayliOnyasizRezerveAdet => _onayliOnyasizRezerveAdet;
  String get gettransferINOUT => _transferINOUT;
  String get getkapasiteAnaliz => _kapasiteAnaliz;
  String get getuygula => _uygula;
  String get getAUTSecin => _AUTSecin;
  String get getmerchMarkaYasGrupSecin => _merchMarkaYasGrupSecin;
  String get getmerchAltGrupSecin => _merchAltGrupSecin;
  String get getbuyerGrupSecin => _buyerGrupSecin;
  String get geturunPerformansAnaliz => _urunPerformansAnaliz;
  String get getmagazaBilgileriniGirin => _magazaBilgileriniGirin;
  String get getmsg05 => _msg05;
  String get geturunBulunamadi => _urunBulunamadi;
  String get getgirisDegerleriniKontrolEdiniz => _girisDegerleriniKontrolEdiniz;
  String get getbildirimBasariylaGonderildi => _bildirimBasariylaGonderildi;
  String get getkumulatifSatisTutar => _kumulatifSatisTutar;
  String get getortalamaPSF => _ortalamaPSF;
  String get getkumulatifSatisAdet => _kumulatifSatisAdet;
  String get getkumulatifSevkAdet => _kumulatifSevkAdet;
  String get getstr => _str;
  String get getilkPSF => _ilkPSF;
  String get getindirimOrani => _indirimOrani;
  String get getsonPSF => _sonPSF;
  String get getmerkezDepoStok => _merkezDepoStok;
  String get getbulunurluk => _bulunurluk;
  String get getderinlik => _derinlik;
  String get getrafOmru => _rafOmru;
  String get getbosGecemezsiniz => _bosGecemezsiniz;
  String get getgonderiliyor => _gonderiliyor;
  String get getbilgi => _bilgi;
  String get getfeedbackAlinmistir => _feedbackAlinmistir;
  String get getbaslat => _baslat;
  String get getiptal => _iptal;
  String get getkonusmaDurdur => _konusmaDurdur;
  String get getkonusmaBaslat => _konusmaBaslat;
  String get getmsg6 => _msg6;
  String get getmagazaAraniyor => _magazaAraniyor;
  String get gethata => _hata;
  String get getlutfenBirMagazaSecin => _lutfenBirMagazaSecin;
  String get getaradiginizKriterlerdeMagazaBulunamadi => _aradiginizKriterlerdeMagazaBulunamadi;
  String get getoutlet => _outlet;
  String get getinlet => _inlet;
  String get getadi => _adi;
  String get getkodu => _kodu;
  String get getpersonelSayisi => _personelSayisi;
  String get getmusteriProfili => _musteriProfili;
  String get getmetrekare => _metrekare;
  String get gettipi => _tipi;
  String get getsezon => _sezon;
  String get getoperasyonelBolge => _operasyonelBolge;
  String get getmagazaBirinciMudur => _magazaBirinciMudur;
  String get getmagazaIkinciMudur => _magazaIkinciMudur;
  String get getmagazaKimlik => _magazaKimlik;
  String get getmagazaKarne => _magazaKarne;
  String get getsectiginizKriterlerdeDataBulunamamistir => _sectiginizKriterlerdeDataBulunamamistir;
  String get getsatisTutarKDVsiz => _satisTutarKDVsiz;
  String get gettutarBuyume => _tutarBuyume;
  String get getsatisTutarGY_KDVsiz => _satisTutarGY_KDVsiz;
  String get getsatisAdet => _satisAdet;
  String get getadetBuyume => _adetBuyume;
  String get getsatisAdetGY => _satisAdetGY;
  String get gethedefTutar => _hedefTutar;
  String get gethedefTutarYuzdesi => _hedefTutarYuzdesi;
  String get getconversionRate => _conversionRate;
  String get getmusteriZiyareySayisi => _musteriZiyareySayisi;
  String get getsepetBuyukluguAdet => _sepetBuyukluguAdet;
  String get getsepetBuyukluguTutarKDVsiz => _sepetBuyukluguTutarKDVsiz;
  String get getstokDevirHizi => _stokDevirHizi;
  String get getM2Verimlilik => _m2Verimlilik;
  String get getbeden => _beden;
  String get getmerkezDepoStokAdet => _merkezDepoStokAdet;
  String get getyuzdeSTR => _yuzdeSTR;
  //LcwAssistLanguagesDTO

//   CurrentLangugeDTO toFill(List<LcwAssistLanguagesDTO> currentLanguageRawData){
  
//   CurrentLangugeDTO currentLanguage;

//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "kullaniciGirisi").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "kullaniciAdi").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "giris").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "turkce").deger;
// currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "ingilizce").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "arapca").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "rusca").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "versiyon").deger;
// currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "magaza").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "anasayfa").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "kapasite").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "satis").deger;
// currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaKarne").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaSec").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "ayarlar").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "cikis").deger;
// currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaSatisIstatistikleri").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "kumulatifSatis").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "barkodIleSorgulama").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "barkodNumarasiGirin").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "urunVerRenkKodIleSorgula").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "urunKodunuGirin").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "renkKodunuGirin").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "barkodTara").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "kameraIleTaratarakAramaYapabilirsiniz").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "urun").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "detaylar").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "feedbackIslemleri").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "feedBackGirin").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "gonder").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaIsimKoduGirin").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaKodu").deger;
//   currentLanguage._anasayfa = currentLanguageRawData.firstWhere((i)=>i.kod == "magazaAdi").deger;
  

//   }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
map["kullaniciGirisi"] = _kullaniciGirisi;
map["kullaniciAdi"] = _kullaniciAdi;
map["parola"] = _parola;
map["giris"] = _giris;
map["turkce"] = _turkce;
map["ingilizce"] = _ingilizce;
map["arapca"] = _arapca;
map["rusca"] = _rusca;
map["versiyon"] = _versiyon;
map["magaza"] = _magaza;
map["anasayfa"] = _anasayfa;
map["kapasite"] = _kapasite;
map["satis"] = _satis;
map["magazaSec"] = _magazaSec;
map["ayarlar"] = _ayarlar;
map["cikis"] = _cikis;
map["magazaSatisIstatistikleri"] = _magazaSatisIstatistikleri;
map["kumulatifSatis"] = _kumulatifSatis;
map["barkodIleSorgulama"] = _barkodIleSorgulama;
map["barkodNumarasiGirin"] = _barkodNumarasiGirin;
map["urunVerRenkKodIleSorgula"] = _urunVerRenkKodIleSorgula;
map["urunKodunuGirin"] = _urunKodunuGirin;
map["renkKodunuGirin"] = _renkKodunuGirin;
map["barkodTara"] = _barkodTara;
map["kameraIleTaratarakAramaYapabilirsiniz"] = _kameraIleTaratarakAramaYapabilirsiniz;
map["urun"] = _urun;
map["detaylar"] = _detaylar;
map["feedbackIslemleri"] = _feedbackIslemleri;
map["feedBackGirin"] = _feedBackGirin;
map["gonder"] = _gonder;
map["magazaIsimKoduGirin"] = _magazaIsimKoduGirin;
map["magazaKodu"] = _magazaKodu;
map["magazaAdi"] = _magazaAdi;
map["dilSecimi"] = _dilSecimi;
map["tumMagazalar"] = _tumMagazalar;
map["oturumBaslatiliyor"] = _oturumBaslatiliyor;
map["yukleniyor"] = _yukleniyor;
map["sistemAyarlari"] = _sistemAyarlari;
map["tamam"] = _tamam;
map["uyarı"] = _uyari;
map["girisHatasi"] = _girisHatasi;
map["kapat"] = _kapat;
map["msg01"] = _msg01;
map["msg02"] = _msg02;
map["msg03"] = _msg03;
map["yetkiHatasi"] = _yetkiHatasi;
map["guncellemeUyarisi"] = _guncellemeUyarisi;
map["msg04"] = _msg04;
map["tumu"] = _tumu;
map["aradiginizBarkodBulunamadi"] = _aradiginizBarkodBulunamadi;
map["toplamFiiliDolulukBDHaric"] = _toplamFiiliDolulukBDHaric;
map["netNihaiLCMDoluluk"] = _netNihaiLCMDoluluk;
map["reyonDolulukLCM"] = _reyonDolulukLCM;
map["depoDolulukLCM"] = _depoDolulukLCM;
map["onayLimiti"] = _onayLimiti;
map["toplamKapLCM/NetNihaiKapLCM"] = _toplamKapLCMNetNihaiKapLCM;
map["reyonStokAdet"] = _reyonStokAdet;
map["depoStokAdet"] = _depoStokAdet;
map["toplamStokAdet"] = _toplamStokAdet;
map["son7gunSatisAdet"] = _son7gunSatisAdet;
map["fiiliCover"] = _fiiliCover;
map["yolStokAdet"] = _yolStokAdet;
map["onayliOnyasizRezerveAdet"] = _onayliOnyasizRezerveAdet;
map["transferINOUT"] = _transferINOUT;
map["kapasiteAnaliz"] = _kapasiteAnaliz;
map["uygula"] = _uygula;
map["AUTSecin"] = _AUTSecin;
map["merchMarkaYasGrupSecin"] = _merchMarkaYasGrupSecin;
map["merchAltGrupSecin"] = _merchAltGrupSecin;
map["buyerGrupSecin"] = _buyerGrupSecin;
map["urunPerformansAnaliz"] = _urunPerformansAnaliz;
map["magazaBilgileriniGirin"] = _magazaBilgileriniGirin;
map["msg05"] = _msg05;
map["urunBulunamadi"] = _urunBulunamadi;
map["girisDegerleriniKontrolEdiniz"] = _girisDegerleriniKontrolEdiniz;
map["bildirimBasariylaGonderildi"] = _bildirimBasariylaGonderildi;
map["kumulatifSatisTutar"] = _kumulatifSatisTutar;
map["ortalamaPSF"] = _ortalamaPSF;
map["kumulatifSatisAdet"] = _kumulatifSatisAdet;
map["kumulatifSevkAdet"] = _kumulatifSevkAdet;
map["str"] = _str;
map["ilkPSF"] = _ilkPSF;
map["indirimOrani"] = _indirimOrani;
map["sonPSF"] = _sonPSF;
map["merkezDepoStok"] = _merkezDepoStok;
map["bulunurluk"] = _bulunurluk;
map["derinlik"] = _derinlik;
map["rafOmru"] = _rafOmru;
map["bosGecemezsiniz"] = _bosGecemezsiniz;
map["gonderiliyor"] = _gonderiliyor;
map["bilgi"] = _bilgi;
map["feedbackAlinmistir"] = _feedbackAlinmistir;
map["baslat"] = _baslat;
map["iptal"] = _iptal;
map["konusmaDurdur"] = _konusmaDurdur;
map["konusmaBaslat"] = _konusmaBaslat;
map["msg6"] = _msg6;
map["magazaAraniyor"] = _magazaAraniyor;
map["hata"] = _hata;
map["lutfenBirMagazaSecin"] = _lutfenBirMagazaSecin;
map["aradıginizKriterlerdeMagazaBulunamadi"] = _aradiginizKriterlerdeMagazaBulunamadi;
map["outlet"] = _outlet;
map["inlet"] = _inlet;
map["adi"] = _adi;
map["kodu"] = _kodu;
map["personelSayisi"] = _personelSayisi;
map["musteriProfili"] = _musteriProfili;
map["metrekare"] = _metrekare;
map["tipi"] = _tipi;
map["sezon"] = _sezon;
map["operasyonelBolge"] = _operasyonelBolge;
map["magazaBirinciMudur"] = _magazaBirinciMudur;
map["magazaIkinciMudur"] = _magazaIkinciMudur;
map["magazaKimlik"] = _magazaKimlik;
map["magazaKarne"] = _magazaKarne;
map["sectiginizKriterlerdeDataBulunamamistir"] = _sectiginizKriterlerdeDataBulunamamistir;
map["satisTutarKDVsiz"] = _satisTutarKDVsiz;
map["tutarBuyume"] = _tutarBuyume;
map["satisTutarGY_KDVsiz"] = _satisTutarGY_KDVsiz;
map["satisAdet"] = _satisAdet;
map["adetBuyume"] = _adetBuyume;
map["satisAdetGY"] = _satisAdetGY;
map["hedefTutar"] = _hedefTutar;
map["hedefTutarYuzdesi"] = _hedefTutarYuzdesi;
map["conversionRate"] = _conversionRate;
map["musteriZiyareySayisi"] = _musteriZiyareySayisi;
map["sepetBuyukluguAdet"] = _sepetBuyukluguAdet;
map["sepetBuyukluguTutarKDVsiz"] = _sepetBuyukluguTutarKDVsiz;
map["stokDevirHizi"] = _stokDevirHizi;
map["M2Verimlilik"] = _m2Verimlilik;
map["beden"] = _beden;
map["merkezDepoStokAdet"] = _merkezDepoStokAdet;
map["yuzdeSTR"] = _yuzdeSTR;

    return map;
  }
}
