import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoPage extends StatefulWidget {
  static const String routeName = '/modified_page';
  final String? title;
  final String? value;
  const ProfileInfoPage({
    Key? key,
    this.title,
    this.value,
  }) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            widget.title ?? "",
            style: GoogleFonts.kantumruy(fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Obx(
                  () => TextField(
                    style: GoogleFonts.kantumruy(),
                    controller: profileController.textEditController.value,
                    onChanged: (val) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset(
                          ("assets/image2/closecircle.svg"),
                        ),
                        onPressed: () {
                          profileController.textEditController.value.clear();
                        },
                      ),
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
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Obx(
                  () => CustomButton(
                    title: 'Save',
                    onPressed:
                        profileController.textEditController.value.text.isEmpty
                            ? null
                            : () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
