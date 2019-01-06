class ResponseBase{
   String errorMessage;
   bool isSuccess;
   bool isAuthorized;

//ResponseBase({this.errorMessage,this.isSuccess,this.isAuthorized});


}


class ParsedResponse<T> {
  ParsedResponse(this.statusCode, this.body);
  final int statusCode;
  final T body;

  bool isOk() {
    return statusCode >= 200 && statusCode < 300;
  }
}


// class ParsedResponse<T> {
//   ParsedResponse(this.responseInfo, this.body);
//   final ResponseBase responseInfo;
//   final T body;

//   // bool isOk() {
//   //   return statusCode >= 200 && statusCode < 300;
//   // }
// }