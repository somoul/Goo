import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/src/goo_rent_app.dart';
import 'package:goo_rent/src/home/presentation/provider/provider_arrow_details_screen.dart';
import 'package:goo_rent/src/home/presentation/widget/background_anitmation_pageview_provider/background_animation_pageview_provider.dart';
import 'package:goo_rent/src/home/presentation/widget/banner_list_index_provider/banner_list_index_provider.dart';
import 'package:goo_rent/src/home/presentation/widget/type_of_rent_provider/type_of_index_provider.dart';
import 'package:goo_rent/src/authentication/country_code/countdown_otp_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Flutter version 3.10.2
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await onCheckLanguages();
  await ScreenUtil.ensureScreenSize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ProviderArrowDetailsScreen(),
      ),
      ChangeNotifierProvider(
        create: (_) => BannerListIndexProvider(),
      ),
      ChangeNotifierProvider(create: (_) => TypeListIndexProvider()),
      ChangeNotifierProvider(
        create: (_) => BackgroundAnimationPageViewProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => OTPCountdownProvider(),
      ),
      // ChangeNotifierProvider(
      //   create: (_) => AnimationBackgroundBannerProvider(),
      // ),
    ],
    child: const GooRentApp(),
  ));
}

Future<void> onCheckLanguages() async {
  var localeStr = await LocalStorage.readLocale();
  if (localeStr != '') {
    var locale = Locale(localeStr, '');
    Get.updateLocale(locale);
  } else {
    var localeStr = Get.deviceLocale!.languageCode;
    var locale = Locale(localeStr, '');
    Get.updateLocale(locale);
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: CustomTheme.lightTheme,
//       title: 'Goo Rent',
//       navigatorKey: ContextProvider.navigatorKey,
//       initialRoute: Routes.home,
//       getPages: AppPages.pages,
//       // initialBinding: AuthBinding()
//     );
//   }
// }
