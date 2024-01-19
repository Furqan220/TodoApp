import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:todo_app/res/export_all.dart';

class NetworkApiService extends BaseApiServices {
  dynamic header({String? t}) => t != null
      ? {"Accept": "application/json", 'Content-Type': 'application/json'}
      : {"Authorization": "Bearer $t", 'Content-Type': 'application/json'};

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      http.Response response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data,
      {withHeader = false}) async {
    dynamic responseJson;

    try {
      if (withHeader) {
        http.Response response = await http
            .post(Uri.parse(url),
                body: jsonEncode(data), headers: header(t: AppUrl.tempApiToken))
            .timeout(const Duration(seconds: 10));
        responseJson = returnResponse(response);
      } else {
        http.Response response = await http
            .post(Uri.parse(url), body: jsonEncode(data), headers: header())
            .timeout(const Duration(seconds: 10));
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String url, {withHeader = false}) async {
    dynamic responseJson;

    try {
      if (withHeader) {
        http.Response response = await http
            .delete(Uri.parse(url), headers: header(t: AppUrl.tempApiToken))
            .timeout(const Duration(seconds: 10));
        responseJson = returnResponse(response);
      } else {
        http.Response response = await http
            .delete(Uri.parse(url), headers: header())
            .timeout(const Duration(seconds: 10));
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizedException(
            jsonDecode(response.body)["error"].toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code of ${response.statusCode}");
    }
  }


}
