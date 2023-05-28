import 'package:get/get.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/home/presentation/screen/home_screen.dart';
import 'package:goo_rent/src/splash/presentation/screen/splash_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initialize,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    // GetPage(
    //   name: Routes.,
    //   page: () => const HomeScreen(),
    // ),
  ];
}
