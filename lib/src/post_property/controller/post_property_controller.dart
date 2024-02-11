import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/helper/upload_iamge.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';
import 'package:goo_rent/src/post_property/data/accessory_model.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';

class PostPropertyController extends GetxController {
  final title = ''.obs;
  final additionalInformation = ''.obs;
  final apiHelper = ApiHelper();

  final accessoryData = <AccessoryModel>[].obs;

  Future<void> getAccessories({bool showLoading = true}) async {
    if (showLoading) {
      BaseDialogLoading.show();
    }
    try {
      await apiHelper
          .onRequest(
        isAuthorize: true,
        url: "/accessories",
        methode: METHODE.get,
      )
          .then((response) {
        var data = response['data'];
        accessoryData.clear();
        data.forEach((e) {
          accessoryData.add(AccessoryModel.fromJson(e));
        });
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      if (showLoading) {
        BaseDialogLoading.dismiss();
      }
    }
  }

  ///Not use in real, just temp data to step 1
  final tempStep1 = <ColumField>[
    ColumField(
      rowField: [
        RowField(
          controller: TextEditingController(text: ''),
          format: 's',
          hint: 'Enter title',
          inputTypes: 'input',
          label: 'Title',
          value: '',
          required: true,
        ),
      ],
    ),
    ColumField(
      rowField: [
        RowField(
          controller: TextEditingController(text: ''),
          format: 's',
          isSelect: true,
          hint: 'Select Location',
          inputTypes: 'input',
          label: 'Location',
          value: '',
          required: true,
          suffixAsset: 'assets/image2/select_map.svg',
        ),
      ],
    ),
    ColumField(rowField: [
      RowField(
        controller: TextEditingController(text: ''),
        format: 'd',
        hint: 'Enter price',
        inputTypes: 'input',
        label: 'Price/Month',
        value: '',
        required: true,
      ),
    ]),
    ColumField(rowField: [
      RowField(
        controller: TextEditingController(text: ''),
        format: 's',
        hint: 'Enter additional information',
        inputTypes: 'input',
        label: 'Additional Information',
        value: '',
        maxLines: 6,
        isDisplay: false,
      ),
    ])
  ];
  final imageList = <String>[].obs;
  final uploading = false.obs;
  Future uploadImage(String path) async {
    // uploading(true);
    BaseDialogLoading.show();
    try {
      var data = await UploadFile.uploadImage(path);
      if (data != null) {
        var url = data['image_url'];
        imageList.add(url);
      }
    } catch (e) {
      rethrow;
    } finally {
      BaseDialogLoading.dismiss();
      // uploading(false);
    }
  }

  ///Select Accessories
  final selectedList = <AccessoryModel>[].obs;

  ///Step 1--------------------------------
  final fieldListStep1 = <ColumField>[].obs;

  /// Post  step 2
  final fieldListStep2 = <ColumField>[];
}
