abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url,dynamic data,{withHeader = false});
  Future<dynamic> getDeleteApiResponse(String url,{withHeader = false});
  
} 