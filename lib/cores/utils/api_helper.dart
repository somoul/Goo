import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_string.dart';
import 'package:goo_rent/cores/utils/context_provider.dart';
import 'package:goo_rent/cores/utils/response_model.dart';

class ApiHelper {
  static const requestTimeOut = Duration(seconds: 10);
  final _client = GetConnect(timeout: requestTimeOut);
  static final _singleton = ApiHelper();
  static ApiHelper get instance {
    _singleton._client.baseUrl = AppString.baseUrl;
    _singleton._client.defaultContentType = "application/json";
    // var loginUser = LocalStorageService().user;
    // if (loginUser != null) {
    //   _singleton._client.httpClient.addAuthenticator((dynamic request) async {
    //     var headers = {'Authorization': "Bearer ${loginUser.token}"};
    //     request.headers.addAll(headers);
    //     return request;
    //   });
    // }

    return _singleton;
  }

  void _showLoading(bool isLoading) {
    if (isLoading) {
      showDialog(
        context: ContextProvider.context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          // child:
          //  BackdropFilter(
          // filter: ImageFilter.blur(
          //   sigmaX: 5,
          //   sigmaY: 200,
          // ),
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey[400]!,
                      offset: const Offset(2, 2),
                    )
                  ]),
              padding: const EdgeInsets.all(30),
              child: const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: AppConstant.kSecondaryColor,
                ),
              ),
            ),
          ),
        ),
        // ),
      );
    }
  }

  Future<void> _hideLoading(bool isLoading) async {
    if (isLoading) {
      await Future.delayed(const Duration(milliseconds: 1000));
      Get.back(closeOverlays: true);
    }
  }

  Future<ResponseModel> $request(String url,
      {String method = "get",
      dynamic body,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      isLoading = false}) async {
    try {
      _showLoading(isLoading);
      final response = await _client.request(
        url,
        method,
        headers: headers,
        query: query,
        body: body,
      );
      _hideLoading(isLoading);
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  ResponseModel _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return ResponseModel.fromMap(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while communication with server with statusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
