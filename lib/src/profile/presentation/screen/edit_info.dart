import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';

import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/utils/hide_keybaord.dart';

// ignore: must_be_immutable
class ProfileInfoPage extends StatefulWidget {
  final String? title;
  String? value1;
  String? value2;
  final String? hint1;
  final String? hint2;
  ProfileInfoPage({
    Key? key,
    this.title,
    this.value1,
    this.value2,
    this.hint1,
    this.hint2,
  }) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => KeyboardHeper.hideKeyborad(),
          child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              centerTitle: true,
              title: Text(
                widget.title ?? "",
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      style: AppText.bodyLarge,
                      // controller: profileController.firstValue.value,
                      autofocus: true,
                      onChanged: (val) {
                        widget.value1 = val;
                        setState(() {});
                      },
                      initialValue: widget.value1,
                      decoration: InputDecoration(
                        // suffixIcon: IconButton(
                        //   icon: SvgPicture.asset(
                        //     ("assets/image2/closecircle.svg"),
                        //   ),
                        //   onPressed: () {
                        //     profileController.firstValue.value.clear();
                        //   },
                        // ),
                        hintText: widget.hint1,
                        hintStyle:
                            AppText.bodyLarge!.copyWith(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Color(0xFF21A6F8))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 20),
                    widget.value2 != null && widget.value2 != ''
                        ? TextFormField(
                            style: AppText.bodyLarge,
                            onChanged: (val) {
                              widget.value2 = val;
                              setState(() {});
                            },
                            initialValue: widget.value2,
                            decoration: InputDecoration(
                              hintText: widget.hint2,
                              // suffixIcon: IconButton(
                              //   icon: SvgPicture.asset(
                              //     ("assets/image2/closecircle.svg"),
                              //   ),
                              //   onPressed: () =>
                              //       profileController.secondtValue.value.clear(),
                              // ),

                              hintStyle: AppText.bodyLarge!
                                  .copyWith(color: Colors.grey),

                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF21A6F8))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.paddingOf(context).bottom + 16,
          child: CustomButton(
            title: 'Save'.tr,
            onPressed: () async {
              KeyboardHeper.hideKeyborad();
              await profileController
                  .onSaveProfileInfo(
                    firstValue: widget.value1,
                    secondValue: widget.value2,
                  )
                  .then((value) => Get.back());
            },
          ),
        )
      ],
    );
  }
}
