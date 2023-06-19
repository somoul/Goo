import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:goo_rent/cores/constant/app_string.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
}

enum METHODE {
  get,
  post,
  delete,
  update,
}

class ApiHelper extends GetConnect {
  final String baseurl = AppString.baseUrl;
  Future<dynamic> onRequest(
      {required String url,
      Map<String, String>? header,
      Map<String, dynamic>? body,
      required METHODE? methode,
      required bool isAuthorize,
      bool isConvertToByte = false}) async {
    // final _token = await StorageDataLocal.getData('current_user') ?? "";
    // tockenTest = _token;
    final fullUrl = baseurl + url;
    Map<String, String> header0 = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isAuthorize ? 'Bearer' : ''
    };
    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(fullUrl, headers: header ?? header0);
          return _returnResponse(response);
        case METHODE.post:
          if (body != null) {
            final response = await post(fullUrl, json.encode(body),
                headers: header ?? header0);
            return _returnResponse(response);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        case METHODE.delete:
          final response = await delete(fullUrl, headers: header ?? header0);
          return _returnResponse(response);
        case METHODE.update:
          if (body != null) {
            final response = await put(fullUrl, json.encode(body),
                headers: header ?? header0);
            return _returnResponse(response);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        default:
          break;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  dynamic _returnResponse(Response response) {
    debugPrint('Response Data : ${response.bodyString}');
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.bodyString!);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.bodyString!);
        return responseJson;
      case 202:
        var responseJson = json.decode(response.bodyString!);
        return responseJson;
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 401:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 500:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));

      default:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
    }
  }
}
