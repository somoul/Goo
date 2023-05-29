// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseModel {
  bool isError = false;
  String? errorMessage;
  int? errorCode;
  String? errorTitle;
  dynamic data;
  ResponseModel({
    required this.isError,
    this.errorMessage,
    this.errorCode,
    this.errorTitle,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isError': isError,
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'errorTitle': errorTitle,
      'data': data,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      isError: map['isError'] as bool,
      errorMessage:
          map['errorMessage'] != null ? map['errorMessage'] as String : null,
      errorCode: map['errorCode'] != null ? map['errorCode'] as int? : null,
      errorTitle:
          map['errorTitle'] != null ? map['errorTitle'] as String : null,
      data: map['data'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
