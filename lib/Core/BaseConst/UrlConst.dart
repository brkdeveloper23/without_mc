import 'dart:ui';

class UrlConst{
static String baseUrl = "https://lcwapigateway.lcwaikiki.com";
static String loginUrl = baseUrl + "/LCWAsistAuthorizationService/api/authorization/getaccesstokenasync";
static String getStoreAllUrl = baseUrl + "/SmartStoreDataService/api/Metrics/GetStoresAll";
static String getStoreReportOtherUrl = baseUrl + "/SmartStoreDataService/api/Metrics/GetStoreReportOther";
static String productMetricsUrl =  baseUrl + "/SmartStoreDataService/api/Metrics/GetProductMetricsForOther";
static String capacityMetricsUrl =  baseUrl + "/SmartStoreDataService/api/Metrics/GetCapacityAnalysisMetricsOther";
static String merchHierarciesFiltersUrl =  baseUrl + "/SmartStoreDataService/api/Metrics/GetMerchHierarcies";
static String allLanguagesDataUrl =  baseUrl + "/SmartStoreDataService/api/Metrics/GetAllLanguages";
static String getUsingLanguagesUrl =  baseUrl + "/SmartStoreDataService/api/Metrics/GetUsingLanguages";
static String bestWorstOptionProductList =  baseUrl + "/SmartStoreDataService/api/Metrics/GetBestWorstOptionProductList";
static String usingSaveFeedbackUrl =  baseUrl + "/SmartStoreDataService/api/Metrics/SaveFeedBackNew";
static String capacityPerformanceMetricFilters =  baseUrl + "/SmartStoreDataService/api/Metrics/GetCapacityPerformanceMetricFilters";
static String capacityPerformanceMetric =  baseUrl + "/SmartStoreDataService/api/Metrics/GetCapacityPerformanceResponseDTO";
static String getLatestAppVersionInfo = "https://appstore.lcwaikiki.com/Mobile/GetLatestAppVersionInfo";
}