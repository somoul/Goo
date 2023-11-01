import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';

class FindNewLocationScreen extends StatelessWidget {
  const FindNewLocationScreen({Key? key}) : super(key: key);
  static const String routeName = '/find_new_location_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text('ការស្វែងរកទីតាំង'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/google_map.webp',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 155,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.padding,
                vertical: AppConstant.padding * 2),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: searchText()),
                const Spacer(),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Icon(
                      Icons.gps_fixed,
                      size: 35,
                      color: Color(0xFFFFD420),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFA8A8A8).withOpacity(0.3),
                        blurRadius: 20, // soften the shadow
                        spreadRadius: 0.1, //extend the shadow
                        offset: const Offset(
                          0, // Move to right 5  horizontally
                          0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstant.padding,
                        vertical: AppConstant.padding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          fit: BoxFit.cover,
                          color: AppConstant.kPrimaryColor,
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Current Location'.tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Text(
                              'ភ្នំពេញថ្មី ភូមិថ្មី ខណ្ឌសែនសុខ ភ្នំពេញ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "រក្សាអាស័យដ្ធានរបស់អ្នក",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            // fontFamily: GoogleFonts.kantumruy().fontFamily,
                          ),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}

searchText() {
  return TextFormField(
    textAlignVertical: TextAlignVertical.center,
    autofillHints: const [AutofillHints.email],
    decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        //<-- SEE HERE
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/icons8-search-64.png',
            width: 24,
            height: 24,
            color: Colors.black.withOpacity(0.8),
          ),
          color: Colors.grey,
        ),
        fillColor: Colors.white.withOpacity(0.9),
        label: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("ស្វែងរកទីតាំង"),
        )),
  );
}
