import 'package:goo_rent/cores/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goo_rent/src/home/widget/build_button_camera_widget.dart';
import 'package:goo_rent/src/home/widget/buttom_sheet_verify_rent.dart';
import 'package:goo_rent/src/home/widget/custom_drop_down_button_widget.dart';

class RoomRentPage extends StatelessWidget {
  const RoomRentPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = "/room_rent_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "ដាក់បន្ទប់ជួល",
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
                    const Text(
                      "ប្រភេទ",
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
                      onChange: (value) {},
                      hindText: "សូមបញ្ចូលចំណងជើង",
                      labelText: "ចំណងជើង",
                    ),
                    CustomTextField(
                      onChange: (value) {},
                      hindText: "សូមបញ្ចូលតម្លៃជួល",
                      labelText: "តម្លៃ (\$)",
                    ),
                    CustomTextField(
                      onChange: (value) {},
                      hindText: "សូមបញ្ចូលតម្លៃជួល",
                      labelText: "បង់កក់មុន",
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "ខែ",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      onChange: (value) {},
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
                      onChange: (value) {},
                      hindText: "សូមបញ្ចូលជាន់របស់បន្ទប់",
                      labelText: "លេខជាន់",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "ទំហំ (ម៉ែត្រការ៉េ)",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            onChange: (value) {},
                            hindText: "សូមបញ្ចូលទំហំទទឹង",
                            labelText: "",
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomTextField(
                            onChange: (value) {},
                            hindText: "សូមបញ្ចូលទំហំបណ្តោយ",
                            labelText: "",
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(
                      onChange: (value) {},
                      hindText: "សូមបញ្ចូលជាន់របស់បន្ទប់",
                      labelText: "ចំណត់",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "ចេញចូល",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                color: Colors.grey.shade200,
                                child: const Text(
                                  "ចេញចូល ២៤ ម៉ោង",
                                ))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                color: Colors.grey.shade200,
                                child: const Text(
                                  "ចេញចូល ១២ ម៉ោង",
                                )))
                      ],
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "រូបភាព",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            "សូមដាក់រូបបន្ទប់ដែលចង់ដាក់ជួលចាប់ពី ១០ សន្លឹកចុងក្រោយ",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BuildButtonCameraWidget()
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
                    const Text(
                      "ព័ត៍មានបន្ថែម",
                      style: TextStyle(fontSize: 18),
                    ),
                    CustomTextField(
                      onChange: (value) {},
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
                  child: const Text(
                    "ដាក់ជួល",
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
