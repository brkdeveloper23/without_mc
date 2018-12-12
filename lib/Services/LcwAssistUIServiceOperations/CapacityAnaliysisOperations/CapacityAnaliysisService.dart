import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportResponseDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenOperations/TokenService.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class CapacityAnaliysisService{

CapacityAnaliysisService(){}

Future<CapacityAnaliysisReportResponseDTO> capacityAnalysisMetrics(CapacityAnaliysisReportRequestDTO request) async {
 
String token =  await TokenService.getAuthToken();
request.setMagazaKod = request.getMagazaKod == "0" ? "" : request.getMagazaKod;
Map<String, dynamic> body = request.toMap();
var response = await http.post(
      Uri.encodeFull(UrlConst.capacityMetricsUrl),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode(body)
    );

CapacityAnaliysisReportResponseDTO result;

if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
     result = CapacityAnaliysisReportResponseDTO.fromJson(json.decode(response.body));
    
     return result;
}

}


Future<CapacityAnalysisMetricsFilterDTO> capacityAnalysisMetricsFilters() async {
 
String token =  await TokenService.getAuthToken();
//Map<String, dynamic> body = request.toMap();
var response = await http.post(
      Uri.encodeFull(UrlConst.capacityMetricsFiltersUrl),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode("{'AksesuarUrun':'','MerchMarkaYasGrupKod':'','MerchAltGrupKod':''}")
    );

CapacityAnalysisMetricsFilterDTO result;

if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
     result = CapacityAnalysisMetricsFilterDTO.fromJson(json.decode(response.body));
     
     return result;
}

}






}