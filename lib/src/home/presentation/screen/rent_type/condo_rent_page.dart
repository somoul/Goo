import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/src/home/presentation/widget/build_button_camera_widget.dart';
import 'package:goo_rent/src/home/presentation/widget/buttom_sheet_verify_rent.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_drop_down_button_widget.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_text_file.dart';
import 'package:google_fonts/google_fonts.dart';

class CondoRentPage extends StatelessWidget {
  const CondoRentPage({Key? key, this.appBarTitle = "ដាក់ជួលខុនដូ"})
      : super(key: key);
  static const String routeName = "/rent_page";
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          appBarTitle,
          style: GoogleFonts.kantumruy(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.2),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ប្រភេទ",
                      style: GoogleFonts.kantumruy(fontSize: 16),
                      //   style: TextStyle(fontSize: 16)
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomDropDownButtonWidget(
                      hintText: 'សូមជ្រើសរើសប្រភេទជួលសម្រាប់លំនៅដ្ធាន',
                      svgSrc: '',
                      itemList: [
                        'បន្ទប់ជួល',
                        'ផ្ទះជួល',
                        'ខុនដូរជួរ',
                        'អាផាតមិនជួល',
                        'វីឡាជួល',
                        'ភូមិគ្រិះជួល',
                      ],
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ចូលចំណងជើង",
                      labelText: "ចំណងជើង",
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ចូលតម្លៃជួល",
                      labelText: "តម្លៃ (\$)",
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ចូលតម្លៃជួល",
                      labelText: "បង់កក់មុន",
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "ខែ",
                            style: GoogleFonts.kantumruy(fontSize: 14),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                                "assets/icons/arrow-right-svgrepo-com.svg",
                                width: 15,
                                height: 15),
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ចូលទីតាំងក្នុង Google Map",
                      labelText: "ទីតាំង",
                      suffixIcon: IconButton(
                        onPressed: () {
                          // GoRouter.of(context)
                          //     .push(BuildAddressScreen.routeName);
                        },
                        icon: SvgPicture.asset(
                            "assets/icons/arrow-right-svgrepo-com.svg",
                            width: 15,
                            height: 15),
                      ),
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ជូលជាន់របស់បន្ទប់",
                      labelText: "លេខជាន់",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/arrow-right-svgrepo-com.svg",
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ជូលប្រភេទបន្ទប់",
                      labelText: "ប្រភេទបន្ទប់",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/arrow-right-svgrepo-com.svg",
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ចូលទំហំ",
                      labelText: "ទំហំ (ម៉ែត្រការ៉េ)",
                    ),
                    CustomTextField(
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ចូលសម្ភារ:បំពាក់",
                      labelText: "សម្ភារ:បំពាក់",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            "assets/icons/arrow-right-svgrepo-com.svg",
                            width: 15,
                            height: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "រូបភាព",
                          style: GoogleFonts.kantumruy(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            "សូមដាក់រូបបន្ទប់ដែលចង់ដាក់ជួលចាប់ពី ១០ សន្លឹកចុងក្រោយ",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.kantumruy(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const BuildButtonCameraWidget()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ព័ត៍មានបន្ថែម",
                      style: GoogleFonts.kantumruy(fontSize: 18),
                      // style: TextStyle(fontSize: 18),
                    ),
                    CustomTextField(
                      maxLine: 10,
                      color: Colors.grey.withOpacity(0.6),
                      hindText: "សូមបញ្ជូលព័ត៍មានបន្ថែម",
                      labelText: "",
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showButtomSheetVerifyRent(context: context);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: double.infinity,
                  height: 60,
                  child: Text(
                    "ដាក់ជួល",
                    style: GoogleFonts.kantumruy(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
