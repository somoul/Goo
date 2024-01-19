import 'package:dio/dio.dart';
import 'package:goo_rent/constant/app_string.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/helper/local_storage.dart';

final dio = Dio();

class UploadFile {
  static Future uploadImage(String path) async {
    FormData formData = FormData();
    final token = await LocalStorage.readToken();
    Map<String, String> header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var headerOpt = Options(headers: header);
    var file = await MultipartFile.fromFile(
      path,
      filename: DateTime.now().toIso8601String(),
    );
    formData = FormData.fromMap({
      "file": file,
      "secretkey": "d6993527-194c-497e-863f-62968063927e",
    });
    var response = await dio.post(
      '${AppString.baseUrl}/re3dgss923kfsalfd/upload',
      data: formData,
      options: headerOpt,
    );
    if (response.statusCode == 200) {
      BaseToast.showSuccessBaseToast('${response.data['message']}');
      return response.data['data'];
    }
    return null;
  }
}
