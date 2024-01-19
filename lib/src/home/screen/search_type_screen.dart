import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import '../controler/search_type_rent_controler/search_controler.dart';

class SearchTypeScreen extends StatefulWidget {
  const SearchTypeScreen({super.key});

  @override
  State<SearchTypeScreen> createState() => _SearchTypeScreenState();
}

class _SearchTypeScreenState extends State<SearchTypeScreen> {
  final _searchTypeRentController = Get.put(SearchTypeRentController());

  @override
  void initState() {
    super.initState();

    _searchTypeRentController.onSearchTypeRen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(AppConstant.paddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
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
                          placeholder: "Looking to rent a property for rent".tr,
                          placeholderStyle: AppText.bodyLarge!.copyWith(
                              color: Colors.black26,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Container(
                            width: 0,
                          ),
                          style: AppText.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          suffixIcon: const Icon(
                            null,
                            size: 0,
                          ),
                          onChanged: (String value) {
                            _searchTypeRentController.typeSearchRent.value =
                                value;
                            _searchTypeRentController.onSearchTypeRen();
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
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "ទើបស្វែងរកថ្មី",
                      style: AppText.titleMedium,
                    ),
                    const Spacer(),
                    Text(
                      "លុបចោល",
                      style: AppText.titleSmall!
                          .copyWith(color: AppConstant.kPrimaryColor),
                    )
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _searchTypeRentController
                        .listSearchTypeRentModel.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, top: 14),
                        child: GestureDetector(
                          onTap: () {
                            _searchTypeRentController.textSearchRent.value =
                                _searchTypeRentController
                                        .listSearchTypeRentModel[index]
                                        .keyword ??
                                    "";
                            navigator!.pop(context);
                          },
                          child: Text(
                            _searchTypeRentController
                                    .listSearchTypeRentModel[index].keyword ??
                                "",
                            style: AppText.titleSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                      );
                      //  Column(
                      //   children: [

                      //   ],
                      // );
                    }),
                if (_searchTypeRentController.listSearchTypeRentModel.isEmpty)
                  const Spacer(),
                if (_searchTypeRentController.listSearchTypeRentModel.isEmpty)
                  const NullPropertyContain(),
                if (_searchTypeRentController.listSearchTypeRentModel.isEmpty)
                  const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRowText extends StatelessWidget {
  const CustomRowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "លុបចោល",
          style: AppText.titleSmall!,
        ),
      ],
    );
  }
}

class NullPropertyContain extends StatelessWidget {
  const NullPropertyContain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Spacer(),
        SizedBox(
          height: 100,
          width: 135,
          child: Image.asset("assets/icons/undraw_empty_search.png"),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "No search history".tr,
          style: AppText.bodyMedium!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
        ),
        // const Spacer(),
        // const Spacer(),
        // const Spacer(),
      ],
    );
  }
}
