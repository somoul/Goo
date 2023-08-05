// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect.dart';
// // import 'package:global_configuration/global_configuration.dart';

// class ErrorModel {
//   final int? statusCode;
//   final dynamic bodyString;
//   const ErrorModel({this.statusCode, this.bodyString});
// }

// enum METHODE {
//   get,
//   post,
//   delete,
//   update,
// }

// class ApiBaseHelper extends GetConnect {
//   final String? baseurl = "https://stagging_api.goocambodia.com/api/client/";
//   // "${GlobalConfigs().get('api_base_url')}";
//   static String? tockenTest;

//   Future<dynamic> onNetworkRequesting(
//       {required String url,
//       Map<String, String>? header,
//       Map<String, dynamic>? body,
//       required METHODE? methode,
//       required bool isAuthorize,
//       bool isConvertToByte = false}) async {
//     //final _token = await StorageDataLocal.getData('current_user') ?? "";
//     const token =
//         "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMmU1ZWNjZWY0MmNmMGZiNjhjYmRkZGQ1NzcwNTlmMDFlZmUyNzRkMTliYjYwNGQwZGNjY2M0MGExZTMzZDc4MmE2ZjJiOGNkNmJkNjQ3MDQiLCJpYXQiOjE2ODY3NTY0MDguNDc3Njc5LCJuYmYiOjE2ODY3NTY0MDguNDc3NjgyLCJleHAiOjE3MTgzNzg4MDguNDc0NTc1LCJzdWIiOiIzOSIsInNjb3BlcyI6W119.jZJ_FKNPvym51DSgw9WHaMcvEq3xxsthZjw5jvm1bBYHXPUgJL5TqSKtjwrDUrYR3bRSRPSWQTbV8O5UcBHcXOEFJo0CmPGJnDLvA6S75Ui6AXo-2-yo_EClZZw_mbaI8hHDJVgjYD0uTLBSjtMjUZ8pKNU84JMLYMt7gDqE32qctr8gMIm1oGlj7ho10AZDkTUKsuM1KUwX0Sy4ACGwA8dxm1lmJdJXYHcv_LvQlrE-v5XbEeULHrgbqPiUNcCmUiYIic-TNal7OFPnj1Dg3hP9meQxwpAJlfDeIO6Lf1zqM3NO0sl5lBhb6VRcN_2RZ9QQ1eC0xEmsawuCCnEFhQHP77oWmlT0WkeANrCgJWVmq3b_bScUF-5pyuWDi1pd_Q-rQP47vsq7cdlDvjT_ZGRmH55-kUJnd569xt--aE2dzVUnSmrKpE0daR3NURD44jM0SO5G68DD_Ph_EV1ghjlFZgfUzURqVKFxXnhP5Kr-UjVsTZIg9KmPtDgIDxuzSnG8hZM7tW6INMO5UFJkaH0nV7yGfwEzdr7PTjACBx5NseLT3oqaK-zja3J9x1c5D5aFlwHvA08_a5YojJabwEZGjqnN1Sd5ViBXO1o9t-lYTaQ9qQEtoaBXHE2t0bACw8rHOMXbm6XJZ41hClbXdkfxC1wUjZXNWxcXWpZ3CS8";
//     tockenTest = token;

//     final fullUrl = baseurl! + url;
//     debugPrint("url:$fullUrl");
//     Map<String, String> header0 = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': isAuthorize ? 'Bearer $token' : ''
//     };
//     try {
//       switch (methode) {
//         case METHODE.get:
//           final response = await get(fullUrl, headers: header ?? header0);
//           return _returnResponse(response, isConvertToByte);
//         case METHODE.post:
//           if (body != null) {
//             final response = await post(fullUrl, json.encode(body),
//                 headers: header ?? header0);
//             return _returnResponse(response, isConvertToByte);
//           }
//           return Future.error(
//               const ErrorModel(bodyString: 'Body must be included'));

//         case METHODE.delete:
//           final response = await delete(fullUrl, headers: header ?? header0);
//           return _returnResponse(response, isConvertToByte);
//         case METHODE.update:
//           if (body != null) {
//             final response = await put(fullUrl, json.encode(body),
//                 headers: header ?? header0);
//             return _returnResponse(response, isConvertToByte);
//           }
//           return Future.error(
//               const ErrorModel(bodyString: 'Body must be included'));

//         default:
//           break;
//       }
//     } catch (e) {
//       return Future.error(e);
//     }
//   }

//   dynamic _returnResponse(Response response, bool isReturnBytes) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = isReturnBytes
//             ? response.bodyBytes
//             : json.decode(response.bodyString!);
//         return responseJson;
//       case 201:
//         var responseJson = isReturnBytes
//             ? response.bodyBytes
//             : json.decode(response.bodyString!);
//         return responseJson;
//       case 202:
//         var responseJson = isReturnBytes
//             ? response.bodyBytes
//             : json.decode(response.bodyString!);
//         return responseJson;
//       case 404:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//       case 400:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//       case 401:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//       case 403:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//       case 500:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));

//       default:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//     }
//   }
// }
