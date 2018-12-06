import 'dart:async';
import 'package:flutter/material.dart'; 
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lcwassist/Core/BaseConst/UrlConst.dart';
import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsRequest.dart';

import 'package:lcwassist/DataAccess/ProductPerformanceMetricsDTOs/ProductMetricsResponse.dart';
import 'package:lcwassist/Services/AuthenticationServiceOperations/TokenOperations/TokenService.dart';

class ProductSalesPerformanceService{

  ProductSalesPerformanceService(){

}


static Future<ProductMetricsResponse> productSalesPerformanceMetrics(ProductMetricsRequestDTO request) async {
 
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

ProductMetricsResponse result;

if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
     result = ProductMetricsResponse.fromJson(json.decode(response.body));
    
     return result;
}

}


}