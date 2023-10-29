import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class GeneralNewsPage extends StatelessWidget {
  const GeneralNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       Flexible(
                      //         child: Text(
                      //           "បន្ទប់សម្រាប់ជួលផ្សារទឹកថ្លា ",
                      //           //style: TextStyle(fontSize: 18),
                      //           style: GoogleFonts.kantumruy(
                      //               fontWeight: FontWeight.bold, fontSize: 22),
                      //         ),
                      //       ),
                      //       Text(
                      //         " \$90/ខែ ",
                      //         style: GoogleFonts.kantumruy(
                      //             color: const Color(
                      //               0xFF21A6F8,
                      //             ),
                      //             fontSize: 22),
                      //       ),
                      //       Text(
                      //         " ធូរថ្លៃ។",
                      //         style: GoogleFonts.kantumruy(fontSize: 18),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Container(
                        width: 320,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: const Stack(
                          children: [
                            Text(
                              "បន្ទប់សម្រាប់ជួលផ្សាទឹកថ្លាតម្លៃធូថ្លៃ។",
                              //style: TextStyle(fontSize: 18),
                              // style: GoogleFonts.kantumruy(
                              //     fontWeight: FontWeight.bold, fontSize: 17.sp),
                            ),

                            // Positioned(right: 0,top: 0,child: Row(children: [ Text(
                            //   " \$90/ខែ ",
                            //   style: GoogleFonts.kantumruy(
                            //       color: const Color(
                            //         0xFF21A6F8,
                            //       ),
                            //       fontSize: 22),
                            // ),
                            //   Text(
                            //     " ធូរថ្លៃ។",
                            //     style: GoogleFonts.kantumruy(fontSize: 18),
                            //   )],))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/code_number.png',
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "លេខកូដ",
                                    // style: GoogleFonts.kantumruy(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "AIB9",
                                    // style: GoogleFonts.kantumruy(
                                    //     color: const Color(0xFF21A6F8),
                                    //     fontSize: 16),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/safehome.svg"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "ប្រភេទ:",
                                    // style: GoogleFonts.kantumruy(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "AIB9",
                                    // style: GoogleFonts.kantumruy(
                                    //     color: const Color(0xFF21A6F8),
                                    //     fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Divider(
                        color: Color(0xFFEEEEEE),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ពត័មានទូទៅ",
                              // style: GoogleFonts.kantumruy(
                              //     color: const Color(
                              //       0xFF21A6F8,
                              //     ),
                              //     fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "• បន្ទប់ទំហំ:",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp, color: Colors.grey),
                                ),
                                Text(
                                  " 5x6 ម៉ែត្រការេ",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp,
                                  //     fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "• បង់កក់មុន ",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp, color: Colors.grey),
                                ),
                                Text(
                                  "5 ខែ",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp,
                                  //     fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "• ស្ថិតនៅជាន់: ",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp, color: Colors.grey),
                                ),
                                Text(
                                  "ផ្ទាល់ដី",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp,
                                  //     fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "• មានចំណត់:",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp, color: Colors.grey),
                                ),
                                Text(
                                  " សម្រាប់ចត",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp,
                                  //     fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "• ការចេញចូល",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp, color: Colors.grey),
                                ),
                                Text(
                                  " 24 ម៉ោង",
                                  // style: GoogleFonts.kantumruy(
                                  //     fontSize: 14.sp,
                                  //     fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Positioned(
                  top: 15,
                  right: 0,
                  child: Text(
                    " \$90/ខែ ",
                    // style: GoogleFonts.kantumruy(
                    //     color: const Color(
                    //       0xFF21A6F8,
                    //     ),
                    //     fontSize: 17),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "សម្ភារះបំពាក់ជូន",
                    // style: GoogleFonts.kantumruy(
                    //     fontSize: 18.sp,
                    //     color: const Color(
                    //       0xFF21A6F8,
                    //     )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: listEquipmentProvided
                        .map((e) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16 / 3, vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  e.icon,
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    e.nameOfEquipmentProvider,
                                    // style: GoogleFonts.kantumruy(
                                    //   fontSize: 14.sp,
                                    // ),
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ការពិពណ៍នា",
                    // style: GoogleFonts.kantumruy(
                    //     color: const Color(0xFF21A6F8), fontSize: 18.sp),
                  ),
                  Text(
                    "• បន្ទប់មានភាបស្ងប់ស្ងាត់មិនមានសំឡេងរំខាន់ពីអ្នកជិតខាង ការរស់នៅប្រកបដោយសុវត្តិភាព។",
                    // style: GoogleFonts.kantumruy(
                    //     fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "• បន្ទប់មានភាបស្ងប់ស្ងាត់មិនមានសំឡេងរំខាន់ពីអ្នកជិតខាង ការរស់នៅប្រកបដោយសុវត្តិភាព។",
                    // style: GoogleFonts.kantumruy(
                    //     fontSize: 14.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    // return SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(
    //         horizontal: AppConstant.padding, vertical: AppConstant.padding),
    //     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //       const Text(
    //         "ទីតាំងផ្ទះ",
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(
    //         height: AppConstant.padding,
    //       ),
    //
    //       /// Banner
    //       SizedBox(
    //         height: 140,
    //         width: MediaQuery.of(context).size.width,
    //         child: Stack(
    //           children: [
    //             SizedBox(
    //               width: MediaQuery.of(context).size.width,
    //               child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(10),
    //                   child: Image.asset(
    //                     'assets/images/map.webp',
    //                     fit: BoxFit.cover,
    //                   )),
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 GoRouter.of(context).push('/view_location_screen');
    //               },
    //               child: Container(
    //                 alignment: Alignment.center,
    //                 decoration: BoxDecoration(
    //                     color: Colors.black.withOpacity(0.5),
    //                     borderRadius: BorderRadius.circular(10)),
    //                 child: Column(
    //                   children: const [
    //                     SizedBox(
    //                       height: 30,
    //                     ),
    //                     Text(
    //                       "ពិនិត្យមើលទីតាំងរបស់ផ្ទះ",
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: AppConstant.padding,
    //       ),
    //       const Text(
    //         "លក្ខណះពិសេសរបស់ផ្ទះយើង",
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(
    //         height: AppConstant.padding,
    //       ),
    //       const Text(
    //           "១ ទីតាំងស្ថិតនៅជិតផ្សារផ្តស់ភាពងាយស្រួលក្នុងការរស់នៅរបស់លោកអ្នក។"),
    //       const Text(
    //           "២ បន្ទប់មានភាពស្ងប់ស្ងាត់មិនមានសំលេងរំខាន់ពីអ្នកជិតខាង ការរស់នៅប្រកបដោយសុវត្ថិភាព។"),
    //       const SizedBox(
    //         height: AppConstant.padding,
    //       ),
    //       const Text(
    //         "ការផ្តល់ជូន",
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(
    //         height: AppConstant.padding,
    //       ),
    //       const Text("១បន្ទប់ទឹកមួយដាច់ដោយឡែក។"),
    //
    //       const Text("២សម្ភារះផ្ទះបាយ។"),
    //       const Text("៣កន្លែងចត់ម៉ូតូ។"),
    //       const SizedBox(
    //         height: AppConstant.padding,
    //       ),
    //       const Text(
    //         "ការចេញចូល",
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(
    //         height: AppConstant.padding,
    //       ),
    //
    //       const Text(
    //           "ការចេញចូលសេរី ផ្តល់ជូនសោរម្នាក់មួយសម្រាប់ចេញចូលដោយខ្លួនអែង។"),
    //     ]),
    //   ),
    // );
  }
}

List<EquipmentProvided> listEquipmentProvided = [
  EquipmentProvided(
      icon: SvgPicture.asset("assets/icons/bathroom1.svg"),
      nameOfEquipmentProvider: "ឡាប៉ូលាងចាន"),
  EquipmentProvided(
      icon: Image.asset(
        "assets/icons/Fan.png",
        width: 17,
        height: 17,
      ),
      nameOfEquipmentProvider: "បន្ទប់កង្ហា"),
  EquipmentProvided(
      icon: SvgPicture.asset("assets/icons/wifi.svg"),
      nameOfEquipmentProvider: "អត់គិតថ្លៃ"),
];

class EquipmentProvided {
  final Widget icon;
  final String nameOfEquipmentProvider;

  const EquipmentProvided(
      {required this.icon, required this.nameOfEquipmentProvider});
}
