import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showBottomTypeOfRent({required BuildContext context}) {
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
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetScreen(),
        );
      });
}

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return AnimatedPadding(
      duration: kThemeAnimationDuration,
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                    width: 80,
                    child: Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "តើលោកអ្នកចង់ដាក់អាជីវកម្មប្រភេទណាដែរ?",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "លោកអ្នកអាចជ្រើសរើសការដាក់ជួលខាងក្រោម",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // GoRouter.of(context)
                                //     .push(RepoRentPage.routeName);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        width: 1.5, color: Color(0xFF21A6F8))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/Group1.svg",
                                          width: 60,
                                          height: 60,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "ផ្ទះរស់នៅ",
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // GoRouter.of(context)
                                //     .push(CondoRentPage.routeName);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        width: 1.5, color: Color(0xFF21A6F8))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/Group.svg",
                                          width: 60,
                                          height: 60,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "ផ្ទះអាជីវកម្ម",
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 0,
                  top: 10,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.0),
                        onTap: () {
                          // GoRouter.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            "assets/icons/cross-svgrepo-com.svg",
                            width: 25.0,
                            height: 25.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
