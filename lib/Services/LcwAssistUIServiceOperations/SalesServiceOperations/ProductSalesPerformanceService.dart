import 'dart:async';
import 'package:flutter/material.dart'; 
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/CapacityAnaliysisDTOs/CapacityAnalysisMetricsFilterDTO.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/BestWorstOptionsDTOs/BestWorstOptionListResponseList.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/BestWorstOptionsDTOs/BestWorstOptionsFilterRequestDTO.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsRequest.dart';

import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/SaveFeedbackRequestDTO.dart';
import 'package:lcwassist/DataAccess/ResponseBase.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenService.dart';

class ProductSalesPerformanceService{

  ProductSalesPerformanceService(){

} 

 
 Future<ParsedResponse<ProductMetricsResponse>> productSalesPerformanceMetrics(ProductMetricsRequestDTO request) async {
 
String token =  await TokenService.getAuthToken();
request.setStoreCode = request.getStoreCode == "0" ? "" : request.getStoreCode;
Map<String, dynamic> body = request.toMap();
var response = await http.post( 
      //Uri.encodeFull("https://lcwapigateway.lcwaikiki.com/SmartStoreDataService/api/Metrics/GetProductMetricsForOther"),
      Uri.encodeFull(UrlConst.productMetricsUrl),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode(body)
    );

if(response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, null);
    }

if(json.decode(response.body)["product"] == null)
{
return new ParsedResponse(response.statusCode, new ProductMetricsResponse());
}else
{
  return new ParsedResponse(response.statusCode, ProductMetricsResponse.fromJson(json.decode(response.body)));
}

// //var bodyResult;
// Map<String, dynamic>  bodyResult;
// if (response.statusCode == 200) {
//     // If the call to the server was successful, parse the JSON
//      bodyResult = json.decode(response.body);

//       if(bodyResult["product"] != null )
//      result = ProductMetricsResponse.fromJson(json.decode(response.body));
    
//      return result;
// }

} 

 Future saveFeedback(SaveFeedbackRequestDTO request) async{

  String token =  await TokenService.getAuthToken();

Map<String, dynamic> body = request.toMap();
var response = await http.post( 
      //Uri.encodeFull("https://lcwapigateway.lcwaikiki.com/SmartStoreDataService/api/Metrics/GetProductMetricsForOther"),
      Uri.encodeFull(UrlConst.usingSaveFeedbackUrl),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode(body)
    );

Map<String, dynamic>  bodyResult;
if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
     bodyResult = json.decode(response.body);

}

}

 Future<ParsedResponse<List<BestWorstOptionListResponseList>>> bestWorstOptionProductList(BestWorstOptionsFilterRequestDTO request) async {
 
String token =  await TokenService.getAuthToken();

Map<String, dynamic> body = request.toMap();

var response = await http.post( 
      //Uri.encodeFull("https://lcwapigateway.lcwaikiki.com/SmartStoreDataService/api/Metrics/GetProductMetricsForOther"),
      Uri.encodeFull(UrlConst.bestWorstOptionProductList),
      headers: {
        "Authorization": "Bearer " +token,
        "Content-Type": "application/json"
      }, body: json.encode(body)
    );

List<BestWorstOptionListResponseList> result = new List<BestWorstOptionListResponseList>();


// List<Map<String, dynamic>>  bodyResult;
// List list = List();
// if (response.statusCode == 200) {
    
//      list = json.decode(response.body) as List;
//  list.map((i)=> result.add(BestWorstOptionListResponseList.fromJson(i))).toList();

// int sss = result.length;


if(response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, null);
    }

Iterable l = json.decode(response.body);

 result = l.map((i)=> BestWorstOptionListResponseList.fromJson(i)).toList();

return new ParsedResponse(response.statusCode, result);

}
 
}