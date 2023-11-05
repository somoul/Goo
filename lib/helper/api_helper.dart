import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_string.dart';
import 'package:goo_rent/helper/context_provider.dart';
import 'package:goo_rent/src/authentication/sign_in/presentation/screen/signin_screen.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';
import 'package:goo_rent/utils/core/config.dart';

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

  String get _langCode => Get.locale?.languageCode == "km" ? "kh" : "en";

  Future<dynamic> onRequest({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    required METHODE? methode,
    required bool isAuthorize,
    bool isConvertToByte = false,
  }) async {
    final token = await LocalStorage.readToken();
    bool hasParam = url.contains("?");
    final fullUrl = '$baseurl$url${hasParam ? "&" : "?"}lang=$_langCode';
    Map<String, String> header0 = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isAuthorize ? 'Bearer $token' : ''
    };
    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(
            fullUrl,
            headers: header ?? header0,
            contentType: 'application/json',
          );

          if (showDebugBaseApi) {
            debugPrint("URL      : $fullUrl");
            debugPrint("DATA[${response.statusCode}]: ${response.body}");
          }
          return _returnResponse(response);
        case METHODE.post:
          // if (body != null) {
          final response = await post(fullUrl, json.encode(body),
              headers: header ?? header0);
          return _returnResponse(response);
        // }
        // return Future.error(
        //     const ErrorModel(bodyString: 'Body must be included'));

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
    }
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
        _tokenExpired();
        return;

      ///Session expired
      // return Future.error(ErrorModel(
      //     statusCode: response.statusCode,
      //     bodyString: json.decode(response.bodyString!)));
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

  _tokenExpired() async {
    var profileCon = ProfileController();
    profileCon.logout().then((value) async {
      await LocalStorage.removeToken();
      Get.offAll(const SignInScreen());
    });
  }
}
