import 'package:flutter/material.dart';
import 'package:goo_rent/cores/utils/notifications_helper.dart';
import 'package:goo_rent/src/home/screen/home_screen.dart';
import 'package:goo_rent/src/home/widget/buttom_sheet_type_of_rent.dart';
import 'package:goo_rent/src/notification/presentation/screen/notification_screen.dart';
import 'package:goo_rent/src/profile/presentation/screen/my_property_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/profile_screen.dart';
import 'package:get/get.dart';
import 'cores/buttom_navigation_bar/buttom_navigation_bar.dart';
import 'cores/buttom_navigation_bar/button_navigation_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String routeName = '/main_page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  void initState() {
    _requestNotificationPermission();
    super.initState();
  }

  _requestNotificationPermission() async {
    await NotificationHelper.requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _page,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: const Color(0xFF21A6F8),
        onPressed: () {
          showBottomTypeOfRent(context: context);
          // showBottomSheetDefault(
          //     context: context,
          //     widget: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         SizedBox(
          //           height: 30,
          //           width: 30,
          //           child: Divider(
          //             color: Colors.grey.withOpacity(0.5),
          //             height: 10,
          //             thickness: 2,
          //           ),
          //         ),
          //         const Text(
          //           "តើលោកអ្នកចង់ស្នើសុំផ្សព្វផ្សាយជួលអ្វីដែរ?",
          //           style: TextStyle(fontSize: 18, color: Color(0xFF21A6F8)),
          //         ),
          //         const Text(
          //             "ដាក់ជួលប្រភេទអចលទ្រព្យណាមួយ សេវាកម្មដូចមានខាងក្រោមនេះ"),
          //         Material(
          //           elevation: 2,
          //           child: Container(
          //             margin: const EdgeInsets.all(AppConstant.padding),
          //             child: Row(
          //               children: const [
          //                 Icon(Icons.add),
          //                 Text("សម្រាប់លំនៅដ្ធាន"),
          //                 Spacer(),
          //                 Icon(Icons.add)
          //               ],
          //             ),
          //           ),
          //         ),
          //         Material(
          //           elevation: 2,
          //           child: Container(
          //             margin: const EdgeInsets.all(AppConstant.padding),
          //             child: Row(
          //               children: const [
          //                 Icon(Icons.add),
          //                 Text("សម្រាប់លំនៅដ្ធាន"),
          //                 Spacer(),
          //                 Icon(Icons.add)
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ));
        },
        tooltip: "Centre FAB",
        elevation: 5,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: ButtonNavigationGooRent(
        items: [
          BottomNavItem(
              svgPicturePath: 'assets/icons/active_home_nagivation.svg',
              label: "home".tr),
          BottomNavItem(
              svgPicturePath: 'assets/icons/sales.svg', label: "sell".tr),
          BottomNavItem(
              svgPicturePath: 'assets/icons/user.svg', label: "rent".tr),
          BottomNavItem(
              svgPicturePath: 'assets/icons/notification.svg',
              label: "notify".tr),
          BottomNavItem(
              svgPicturePath: 'assets/icons/user.svg', label: "account".tr),
        ],
        onTapChange: (index) {
          if (index == 2) {
            return;
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }

  final List<Widget> _page = const [
    HomeScreen(),
    MyPropertyPage(
      isMantenance: true,
      checkAccount: "default",
    ),
    MyPropertyPage(
      isMantenance: true,
      checkAccount: "default",
    ),
    NotificationScreen(),
    ProfileScreen(),
  ];
}
