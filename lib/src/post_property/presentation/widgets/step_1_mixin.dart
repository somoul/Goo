import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/context_provider.dart';
import 'package:goo_rent/helper/dialog.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/post_property/controller/post_property_controller.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

mixin Step1Mixin {
  final postController = Get.put(PostPropertyController());

  Widget buildUploadImages() {
    if (postController.imageList.isEmpty) {
      postController.imageList.add('');
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.gap,
        Text("Upload Image (Maximum 10 photos)".tr,
                style: AppText.titleSmall!.copyWith(fontSize: 14))
            .pt(15)
            .pb(6),
        Obx(
          () => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: postController.imageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent:
                  (MediaQuery.of(ContextProvider.context).size.width / 3) - 30,
              // childAspectRatio: 2 / 2.9,
            ),
            itemBuilder: (context, index) {
              var item = postController.imageList[index];
              if (index == 0) {
                return _buildSelectedUpload();
              }
              return _buildImageItem(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildImageItem(String url) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppConstant.kPrimaryColor.withOpacity(0.05),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ImageBuilder(fit: BoxFit.cover).network(url),
      ),
    );
  }

  Widget _buildSelectedUpload() {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        closekeyboard();
        var file = await pickImageGetFile();
        if (file != null) {
          await postController.uploadImage(file.path);
        }
      },
      child: DottedBorder(
        color: AppConstant.kPrimaryColor,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        strokeWidth: 1.2,
        dashPattern: const [4, 4],
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppConstant.kPrimaryColor.withOpacity(0.05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ImageBuilder().asset('')
              const Icon(
                Icons.camera_alt_outlined,
                color: AppConstant.kPrimaryColor,
                size: 30,
              ),
              Text(
                "Upload Image".tr,
                style: AppText.bodyMedium!
                    .copyWith(color: AppConstant.kPrimaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
