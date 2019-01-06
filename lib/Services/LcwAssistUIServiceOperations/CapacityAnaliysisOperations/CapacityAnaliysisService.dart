import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportRequestDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnaliysisReportResponseDTO.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
import 'package:lcwassist/DataAccess/ResponseBase.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenService.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class CapacityAnaliysisService{

CapacityAnaliysisService(){}

Future<ParsedResponse<CapacityAnaliysisReportResponseDTO>> capacityAnalysisMetrics(CapacityAnaliysisReportRequestDTO request) async {
 
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

// if (response.statusCode == 200) {
//     // If the call to the server was successful, parse the JSON
//      result = CapacityAnaliysisReportResponseDTO.fromJson(json.decode(response.body));
    
//      return result;
// }
if(response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, null);
    }

return new ParsedResponse(response.statusCode, CapacityAnaliysisReportResponseDTO.fromJson(json.decode(response.body)));
}

Future<ParsedResponse<CapacityAnalysisMetricsFilterDTO>> capacityAnalysisMetricsFilters() async {
 
String token =  await TokenService.getAuthToken();
//Map<String, dynamic> body = request.toMap();
var response = await http.post(
      Uri.encodeFull(UrlConst.merchHierarciesFiltersUrl),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode("{'AksesuarUrun':'','MerchMarkaYasGrupKod':'','MerchAltGrupKod':''}")
    );


if(response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, null);
    }

return new ParsedResponse(response.statusCode, CapacityAnalysisMetricsFilterDTO.fromJson(json.decode(response.body)));

}

}