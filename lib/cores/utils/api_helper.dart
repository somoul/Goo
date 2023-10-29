import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_string.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/src/authentication/sign_in/presentation/screen/sign_in_screen.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({
    this.statusCode,
    this.bodyString,
  });
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
    final token = await LocalStorage.readToken();
    // tockenTest = _token;
    // BaseDialogLoading.show();
    final fullUrl = baseurl + url;
    Map<String, String> header0 = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isAuthorize ? 'Bearer $token' : ''
    };

    try {
      debugPrint('Body : $body');
      debugPrint('URL : $url');
      debugPrint('Header : ${header ?? header0}');

      switch (methode) {
        case METHODE.get:
          final response = await get(
            fullUrl,
            headers: header ?? header0,
            contentType: 'application/json',
          );
          return _returnResponse(response);
        case METHODE.post:
          // if (body != null) {

          final response = await post(fullUrl, json.encode(body),
              headers: header ?? header0);
          return _returnResponse(response);
          // }
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
      // BaseDialogLoading.show();
      return Future.error(e);
    } finally {
      // BaseDialogLoading.dismiss();
    }
  }

  _returnResponse(Response response) async {
    // debugPrint('Response Data : ${response.bodyString}');
    if (response.statusCode != 200) {
      debugPrint(
          'Error Response ${response.statusCode} > ${response.bodyString}');
    } else if (response.statusCode == 401) {
      LocalStorage.removeToken();
      Get.offAll(() => const SignInScreen());
      return;
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.bodyString!);
        print('vkakvnvanivvnrfisnafinevfasivividvinasviwivw : $responseJson');
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
