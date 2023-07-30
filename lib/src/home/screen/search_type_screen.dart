import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';

class SearchTypeScreen extends StatelessWidget {
  const SearchTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         // navigator?.pop();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //         size: 20,
      //         weight: 10,
      //       )),
      //   title: const Expanded(
      //     child: SizedBox(
      //       width: double.infinity,
      //       child: CupertinoSearchTextField(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.all(Radius.circular(20)),
      //           gradient: LinearGradient(
      //             begin: FractionalOffset.topCenter,
      //             end: FractionalOffset.bottomCenter,
      //             colors: [
      //               Colors.black12,
      //               Colors.black12
      //               // Colors.teal.withOpacity(0.0),
      //               // Colors.teal.withOpacity(0.8),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(AppConstant.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        navigator?.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                        size: 22,
                      )),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: CupertinoSearchTextField(
                        keyboardType: TextInputType.text,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            5.5, 8, 5.5, 8),
                        prefixInsets:
                            const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                        suffixInsets:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 5),
                        itemSize: 0,
                        placeholder: "ស្វែងរកជួលចលនទ្រព្យសម្រាប់ជួល",
                        placeholderStyle:
                            AppText.bodyLarge!.copyWith(color: Colors.black26),
                        prefixIcon: Container(
                          width: 0,
                        ),
                        suffixIcon: const Icon(
                          null,
                          size: 0,
                        ),
                        onChanged: (String value) {
                          print("====== show : $value");
                        },
                        decoration: const BoxDecoration(
                          image: null,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Color(0xffF1F1F1),
                              Color(0xffF1F1F1),
                              // Colors.teal.withOpacity(0.0),
                              // Colors.teal.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 135,
                      child:
                          Image.asset("assets/icons/undraw_empty_search.png"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "គ្មានប្រវត្តិស្វែងរក",
                      style: AppText.bodyMedium!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
