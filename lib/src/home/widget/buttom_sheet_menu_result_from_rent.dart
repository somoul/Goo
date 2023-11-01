import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';

void showBottomSheetResultFromRent({required BuildContext context}) {
  bool priceCheck = true;
  bool locationCheck = true;
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 2),
          child: StatefulBuilder(builder: (context, setStateButtonSheet) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 20,
                    width: 40,
                    child: Divider(
                      color: Colors.grey.shade300,
                      height: 5,
                      thickness: 4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "ស្វែងរកប្រហែល",
                    style: AppText.bodyMedium,
                    // style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "កំណត់តម្លៃ",
                  style: AppText.bodySmall,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setStateButtonSheet(() {
                            priceCheck = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 40,
                          decoration: BoxDecoration(
                              color: priceCheck == true
                                  ? AppConstant.kPrimaryColor.withOpacity(0.2)
                                  : Colors.grey.shade100),
                          alignment: Alignment.center,
                          child: Text(
                            "តម្លៃមធ្យម",
                            style: AppText.bodySmall!.copyWith(
                                color: priceCheck == true
                                    ? AppConstant.kPrimaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setStateButtonSheet(() {
                            priceCheck = false;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 40,
                            decoration: BoxDecoration(
                                color: priceCheck == false
                                    ? AppConstant.kPrimaryColor.withOpacity(0.2)
                                    : Colors.grey.shade100),
                            alignment: Alignment.center,
                            child: Text(
                              "តម្លៃខ្ពស់",
                              style: AppText.bodySmall!.copyWith(
                                  color: priceCheck == false
                                      ? AppConstant.kPrimaryColor
                                      : Colors.black),
                            )),
                      ),
                    ),
                  ],
                ),
                Text(
                  "កំណត់តម្លៃ",
                  style: AppText.bodySmall,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setStateButtonSheet(() {
                            locationCheck = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 40,
                          decoration: BoxDecoration(
                              color: locationCheck == true
                                  ? AppConstant.kPrimaryColor.withOpacity(0.2)
                                  : Colors.grey.shade100),
                          alignment: Alignment.center,
                          child: Text(
                            "ទីតាំងជិត",
                            style: AppText.bodySmall!.copyWith(
                                color: locationCheck == true
                                    ? AppConstant.kPrimaryColor
                                    : Colors.black),
                            // style: TextStyle(
                            //     color: locationCheck == true
                            //         ? AppConstant.kPrimaryColor
                            //         : Colors.black)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setStateButtonSheet(() {
                            locationCheck = false;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 40,
                          decoration: BoxDecoration(
                              color: locationCheck == false
                                  ? AppConstant.kPrimaryColor.withOpacity(0.2)
                                  : Colors.grey.shade100),
                          alignment: Alignment.center,
                          child: Text(
                            "ទីតាំងឆ្ងាយ",
                            style: AppText.bodySmall!.copyWith(
                                color: locationCheck == false
                                    ? AppConstant.kPrimaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "ស្វែងរក",
                        style: AppText.bodySmall!.copyWith(color: Colors.white),
                      )),
                )
              ],
            );
          }),
        );
      });
}
