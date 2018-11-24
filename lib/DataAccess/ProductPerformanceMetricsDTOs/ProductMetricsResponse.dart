
class ProductMetricsResponse {
  final Product product;
  final int depoRef;
  final int modelRef;
  final int renkRef;
  final int ulkeRef;
  final double ilkPesinFiyat;
  final double sonPesinFiyat;
  final double bulunurluk;
  final double derinlik;
  final double rafOmru;
  final int urunOptionSizeRef;
  final int merchAltGrupRef;
  final String errorMessage;
  final bool isSuccess;
  final bool isAuthorized;
  final List<ProductOptionMetrics> optionMetrics;
  final ProductPerformansResultDTO productPerformansResultDTO;
  ProductMetricsResponse({this.product,this.depoRef,this.modelRef,this.renkRef,this.ulkeRef,this.ilkPesinFiyat,this.sonPesinFiyat,this.bulunurluk,this.derinlik
  ,this.rafOmru,this.urunOptionSizeRef,this.merchAltGrupRef,this.optionMetrics,this.errorMessage,this.isSuccess,this.isAuthorized,this.productPerformansResultDTO});
  
factory ProductMetricsResponse.fromJson(Map<String, dynamic> json1) {

var productList = json1['product'];
var optionMetrics = json1['optionMetrics'] as List;

  return ProductMetricsResponse(
     //product: productList.map((i) => Product.fromJson(i)),
     product:  Product.fromJson(json1['product']),
     depoRef: json1['depoRef'],
     modelRef: json1['modelRef'],
     renkRef: json1['renkRef'],
     ulkeRef: json1['ulkeRef'],
     ilkPesinFiyat: json1['ilkPesinFiyat'],
     sonPesinFiyat: json1['sonPesinFiyat'],
     bulunurluk: json1['bulunurluk'],
     derinlik: json1['derinlik'],
     rafOmru: json1['rafOmru'],
     urunOptionSizeRef: json1['urunOptionSizeRef'],
     merchAltGrupRef: json1['merchAltGrupRef'],
     errorMessage: json1['errorMessage'],
     isSuccess: json1['isSuccess'],
     isAuthorized: json1['isAuthorized'],
     optionMetrics: optionMetrics.map((i) => ProductOptionMetrics.fromJson(i)).toList(),//optionMetrics.map((i) => ProductOptionMetrics.fromJson(i)).toList()
     productPerformansResultDTO: ProductPerformansResultDTO.fromJson(json1['productPerformansResultDTO'])
  );
}

}

class Product
    {
        final int barkod;
        final int urunRef;
        final String urunAdi;
        final int modelRef;
        final String modelKod;
        final int renkRef;
        final String renkKod;
        final String renkTanim;
        final int merchMarkaYasGrupRef;
        final String merchMarkaYasGrupTanim;
        final int merchAltGrupRef;
        final String merchAltGrupTanim;
        final String beden;
        final String boy;
        final int buyerGrupRef;
        final String buyerGrupTanim;
        final int urunOptionSizeRef;
        final String productImage;

        Product({this.barkod,this.urunRef,this.urunAdi,this.modelRef,this.modelKod,this.renkRef,this.renkKod,this.renkTanim
        ,this.merchMarkaYasGrupRef,this.merchMarkaYasGrupTanim,this.merchAltGrupRef,this.merchAltGrupTanim,this.beden,this.boy
        ,this.buyerGrupRef,this.buyerGrupTanim,this.urunOptionSizeRef,this.productImage});

factory Product.fromJson(Map<String, dynamic> json) {
  
  return Product(
    barkod: json['barkod'] ,
    urunRef: json['urunRef'],
    urunAdi: json['urunAdi'],
    modelRef: json['modelRef'],
    modelKod: json['modelKod'],
    renkRef: json['renkRef'],
    renkKod: json['renkKod'],
    renkTanim: json['renkTanim'],
    merchMarkaYasGrupRef: json['merchMarkaYasGrupRef'],
    merchMarkaYasGrupTanim: json['merchMarkaYasGrupTanim'],
    merchAltGrupRef: json['merchAltGrupRef'],
    merchAltGrupTanim: json['merchAltGrupTanim'],
    beden: json['beden'],
    boy: json['boy'],
    buyerGrupRef: json['buyerGrupRef'],
    buyerGrupTanim: json['buyerGrupTanim'],
    urunOptionSizeRef: json['urunOptionSizeRef'],
    productImage: json['productImage']
  );

}


    }

class ProductOptionMetrics 
    {
        
        final String beden;
        final String boy;
        final ProductOptionMetricsOLTP optionMetricsOLTP;
        final ProductOptionStockMetrics stockMetrics;
        final ProductSalesMetrics salesMetrics;

        final int depoRef;
        final int modelRef;
        final int renkRef;
        final int urunOptionSizeRef;

        ProductOptionMetrics({this.beden,this.boy,this.optionMetricsOLTP,this.stockMetrics
        ,this.salesMetrics,this.depoRef,this.modelRef,this.renkRef,this.urunOptionSizeRef});

factory ProductOptionMetrics.fromJson(Map<String, dynamic> json) {

var optionMetricsOLTP = json['optionMetricsOLTP'];
var stockMetrics = json['stockMetrics'];
var salesMetrics = json['salesMetrics'];

  return ProductOptionMetrics(
     optionMetricsOLTP: ProductOptionMetricsOLTP.fromJson(optionMetricsOLTP),
     stockMetrics: ProductOptionStockMetrics.fromJson(stockMetrics),//stockMetricsList.map((i) => ProductOptionStockMetrics.fromJson(i)).toList(),
     salesMetrics: ProductSalesMetrics.fromJson(salesMetrics),//salesMetricsList.map((i) => ProductSalesMetrics.fromJson(i)).toList(),

     beden: json['beden'],
     boy: json['boy'],

     depoRef: json['depoRef'],
     modelRef: json['modelRef'],
     renkRef: json['renkRef'],
     urunOptionSizeRef: json['urunOptionSizeRef']
  );
}




    }


    class ProductOptionMetricsOLTP
    {
        final int depoRef;
        final int modelRef;
        final int renkRef;
        final int urunOptionSizeRef;
        final int anlikReyonStok;
        final int anlikDepoStok;
        final int onayliRezerveAdet;
        final int onaysizRezerveAdet;
        final int yolAdet;

ProductOptionMetricsOLTP({this.depoRef,this.modelRef,this.renkRef,this.urunOptionSizeRef,this.anlikReyonStok,this.anlikDepoStok,
this.onayliRezerveAdet,this.onaysizRezerveAdet,this.yolAdet});



factory ProductOptionMetricsOLTP.fromJson(Map<String, dynamic> json) {
  return ProductOptionMetricsOLTP(
    depoRef: json['depoRef'],
    modelRef: json['modelRef'],
    renkRef: json['renkRef'],
    urunOptionSizeRef: json['urunOptionSizeRef'],
    anlikReyonStok: json['anlikReyonStok'],
    anlikDepoStok: json['anlikDepoStok'],
    onayliRezerveAdet: json['onayliRezerveAdet'],
    onaysizRezerveAdet: json['onaysizRezerveAdet'],
    yolAdet: json['yolAdet']
   
  );



    }
    }


    class ProductOptionStockMetrics
    {
        final int urunOptionSizeRef;
        final int fiiliStokAdet;
        final int merkeziStokAdet;

ProductOptionStockMetrics({this.urunOptionSizeRef,this.fiiliStokAdet,this.merkeziStokAdet});
        
factory ProductOptionStockMetrics.fromJson(Map<String, dynamic> json) {
  return ProductOptionStockMetrics(
    urunOptionSizeRef: json['urunOptionSizeRef'],
    fiiliStokAdet: json['fiiliStokAdet'],
    merkeziStokAdet: json['merkeziStokAdet']
   
  );
    }
    }


    class ProductSalesMetrics 
    {
        final int kumulatifSatisAdet;
        final double kumulatifSatisTutar;
        final int son7GunSatisAdet;


        final int depoRef;
        final int modelRef;
        final int renkRef;
        final int urunOptionSizeRef;


ProductSalesMetrics({this.kumulatifSatisAdet,this.kumulatifSatisTutar,this.son7GunSatisAdet
,this.depoRef,this.modelRef,this.renkRef,this.urunOptionSizeRef});
        
factory ProductSalesMetrics.fromJson(Map<String, dynamic> json) {
  return ProductSalesMetrics(
    kumulatifSatisAdet: json['kumulatifSatisAdet'],
    kumulatifSatisTutar: json['kumulatifSatisTutar'],
    son7GunSatisAdet: json['son7GunSatisAdet'],
    depoRef: json['depoRef'],
    modelRef: json['modelRef'],
    renkRef: json['renkRef'],
    urunOptionSizeRef: json['urunOptionSizeRef']
  );
    }


    }


class ProductPerformansResultDTO
{
        final String kumulatifSatisTutar ;
        
        final String kumulatifSatisAdet ;

        final String ortalamaPSF ;

        final String kumulatifSevkAdet ;

        final String str ;

        final String ilkPesinFiyat ;

        final String indirimOrani ;

        final String sonPesitFiyat ;

        final String reyonStok ;

        final String depoStok ;

        final String son7GunSatisAdet ;

        final String fiiliCover ;

        final String yolStok ;

        final String onayliOnaysizRezerve ;

        final String merkezDepoStokAdet ;

        final String bulunurluk ;

        final String derinlik ;

        final String rafOmru ;

ProductPerformansResultDTO({
  this.kumulatifSatisTutar,this.kumulatifSatisAdet,this.ortalamaPSF,this.kumulatifSevkAdet,this.str,this.ilkPesinFiyat,
  this.indirimOrani,this.sonPesitFiyat,this.reyonStok,this.depoStok,this.fiiliCover,this.yolStok,this.onayliOnaysizRezerve,this.merkezDepoStokAdet,
  this.bulunurluk,this.derinlik,this.rafOmru,this.son7GunSatisAdet
});
        
factory ProductPerformansResultDTO.fromJson(Map<String, dynamic> json) {
  return ProductPerformansResultDTO(
    kumulatifSatisTutar: json['kumulatifSatisTutar'],
    kumulatifSatisAdet: json['kumulatifSatisAdet'],
    ortalamaPSF: json['ortalamaPSF'],
    kumulatifSevkAdet: json['kumulatifSevkAdet'],
    str: json['str'],
    ilkPesinFiyat: json['ilkPesinFiyat'],
    indirimOrani: json['indirimOrani'],
    sonPesitFiyat: json['sonPesitFiyat'],
    reyonStok: json['reyonStok'],
    depoStok: json['depoStok'],
    fiiliCover: json['fiiliCover'],
    yolStok: json['yolStok'],
    onayliOnaysizRezerve: json['onayliOnaysizRezerve'],
    merkezDepoStokAdet: json['merkezDepoStokAdet'],
    bulunurluk: json['bulunurluk'],
    derinlik: json['derinlik'],
    rafOmru: json['rafOmru'],
    son7GunSatisAdet: json['son7GunSatisAdet']
  );
    }


}