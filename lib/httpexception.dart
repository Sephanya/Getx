

class HttpException implements Exception{
 final int? statusCode;
 final String? message;
 String returnMsg = '';

  HttpException(this.statusCode,{this.message});

  String toString() {

    if(message != null){
      return message!;

    }
    statusCodeHandler();
    return returnMsg;
  }
  void statusCodeHandler(){
    // if (statusCode! >= 400 && statusCode! <= 451){
    //   returnMsg = 'Client Error';
    // }
    // if (statusCode! >= 500 && statusCode! <= 511){
    //   returnMsg = 'Server Error';
    // }

    switch (statusCode) {
      case 400:

        this.returnMsg = "Bad request";
        break;
      case 401:

        this.returnMsg = "UnAuthorized access ";
        break;
      case 403:

        this.returnMsg = "Resource access forbidden";
        break;
      case 404:

        this.returnMsg = "Resource not Found";
        break;
      case 500:

        this.returnMsg = "Internal server error";
        break;
      default:

        this.returnMsg = "Unknown";
        break;
    }

  }
}

// class NoInternetException {
//   String message;
//   NoInternetException(this.message);
// }
//
// class NoServiceFoundException {
//   String message;
//   NoServiceFoundException(this.message);
// }
//
// class InvalidFormatException {
//   String message;
//   InvalidFormatException(this.message);
// }
//
// class UnknownException {
//   String message;
//   UnknownException(this.message);
// }







