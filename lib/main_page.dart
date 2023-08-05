import 'package:flutter/material.dart';
import 'package:goo_rent/src/home/screen/home_screen.dart';
import 'package:goo_rent/src/notification/presentation/screen/notification_screen.dart';
import 'package:goo_rent/src/post_property/presentation/screens/select_category.dart';
import 'package:goo_rent/src/profile/presentation/screen/my_property_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/profile_screen.dart';
import 'package:get/get.dart';
import 'cores/buttom_navigation_bar/buttom_navigation_bar.dart';
import 'cores/buttom_navigation_bar/button_navigation_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

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
        onPressed: () => Get.to(const SelectCategoryScreen()),
        // showBottomTypeOfRent(context: context);

        tooltip: "Rent property",
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
