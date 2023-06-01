import 'package:get/get.dart';
import 'package:goo_rent/main_page.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_in/presentation/screen/start_account_screen.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:goo_rent/src/authentication/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:goo_rent/src/splash/presentation/screen/splash_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initialize,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.authLanding,
      page: () => const AuthLanding(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const MainPage(),
    ),
  ];
}
