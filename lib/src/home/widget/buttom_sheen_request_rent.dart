import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'buttom_sheet_pick_date_ios_platform.dart';

void showBottomSheetRequestRentFunction({required BuildContext context}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 30,
              right: 10,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 2.5, bottom: 2.5),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    color: Colors.blue.withOpacity(0.2)),
                child: Text("៦០ដុល្លា/១ខែ",
                    style: AppText.bodySmall!.copyWith(
                        color: const Color(0xFF21A6F8), fontSize: 12)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BottomSheetScreen(),
            ),
          ],
        );
      });
}

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    int index = 0;
    return AnimatedPadding(
      duration: kThemeAnimationDuration,
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/image2/bed_room.png',
                      width: 100,
                      height: 110,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 180,
                          child: Text("បន្ទប់ជួលផ្សាឈូកមាសស្រួលរស់នៅ",
                              style: AppText.bodySmall!.copyWith(
                                  color: const Color(0xFF21A6F8),
                                  fontSize: 16))),
                      Row(
                        children: [
                          SvgPicture.asset("assets/image2/Vector1.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "លេខកូដ",
                            style: AppText.titleSmall!.copyWith(
                              color: const Color(0xFF21A6F8),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "AIB89",
                            style: TextStyle(
                                color: Color(0xFF21A6F8), fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/image2/Vector1.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "ប្រភេទ",
                            style: AppText.bodySmall,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "បន្ទប់ជួល",
                            style: AppText.bodySmall,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ត្រកូល",
                        style: AppText.bodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          hintText: "ហម",
                          hintStyle: AppText.bodySmall,
                          errorBorder: _getDecoreOutLineBorderTextField(),
                          focusedBorder: _getDecoreOutLineBorderTextField(),
                          focusedErrorBorder:
                              _getDecoreOutLineBorderTextField(),
                          disabledBorder: _getDecoreOutLineBorderTextField(),
                          enabledBorder: _getDecoreOutLineBorderTextField(),
                          border: _getDecoreOutLineBorderTextField(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ឈ្មោះ",
                        style: AppText.bodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          hintText: "ហុី",
                          hintStyle: AppText.bodySmall,
                          errorBorder: _getDecoreOutLineBorderTextField(),
                          focusedBorder: _getDecoreOutLineBorderTextField(),
                          focusedErrorBorder:
                              _getDecoreOutLineBorderTextField(),
                          disabledBorder: _getDecoreOutLineBorderTextField(),
                          enabledBorder: _getDecoreOutLineBorderTextField(),
                          border: _getDecoreOutLineBorderTextField(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "លេខទំនាក់ទំនង",
              style: AppText.bodySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: "0887821785",
                hintStyle: AppText.bodySmall,
                errorBorder: _getDecoreOutLineBorderTextField(),
                focusedBorder: _getDecoreOutLineBorderTextField(),
                focusedErrorBorder: _getDecoreOutLineBorderTextField(),
                disabledBorder: _getDecoreOutLineBorderTextField(),
                enabledBorder: _getDecoreOutLineBorderTextField(),
                border: _getDecoreOutLineBorderTextField(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "រយៈពេលជួល",
              style: AppText.bodySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: StatefulBuilder(builder: (context, setStateRent) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        longTimeToRent.length,
                        (i) => InkWell(
                          onTap: () {
                            setStateRent(() {
                              index = i;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: index == i
                                    ? const Color(0xFF21A6F8)
                                    : Colors.grey.withOpacity(0.2)),
                            child: Text(longTimeToRent[i],
                                style: AppText.bodySmall!.copyWith(
                                    fontSize: 14,
                                    color: index == i ? Colors.white : null)),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                hintText: "កំណត់រយ:ពេលជួល",
                hintStyle: AppText.bodySmall,
                errorBorder: _getDecoreOutLineBorderTextField(),
                focusedBorder: _getDecoreOutLineBorderTextField(),
                focusedErrorBorder: _getDecoreOutLineBorderTextField(),
                disabledBorder: _getDecoreOutLineBorderTextField(),
                enabledBorder: _getDecoreOutLineBorderTextField(),
                border: _getDecoreOutLineBorderTextField(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("ចាប់ផ្តើមជួល", style: AppText.bodySmall),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {
                    showButtomSheetPickDateIOSPlatForm(context: context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text("កំណត់ពេលចាប់ផ្តើមជួល", style: AppText.bodySmall),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // backgroundColor: const Color(0xFF21A6F8),
                      ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ដាក់ស្នើជួល", style: AppText.bodySmall)),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

_getDecoreOutLineBorderTextField() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(),
  );
}

List<String> longTimeToRent = ['ខែ', 'ឆ្នាំ'];
// [
//  Container(
// alignment: Alignment.center,
// width:60,
// height: 35,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: Colors.red
// ),
// child: Text("ឆ្នាំ"),
// ),
// ]
