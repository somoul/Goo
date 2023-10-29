import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:goo_rent/cores/theme/theme_data.dart';
import 'package:goo_rent/cores/utils/context_provider.dart';

import 'package:goo_rent/cores/utils/locale_helper.dart';
import 'package:goo_rent/firebase_options.dart';
import 'package:goo_rent/routes/route.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/locale/translator.dart';

///Flutter version 3.10.2
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  await LocaleHelper.onCheckLanguages();
  // await ScreenUtil.ensureScreenSize();
  // await NotificationHelper.onInitializeNotification();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Goo App',
      translationsKeys: AppTranslation.translationsKeys,
      translations: Translator(),
      locale: Get.locale ?? Get.deviceLocale,
      fallbackLocale: const Locale('km', 'KH'),
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      navigatorKey: ContextProvider.navigatorKey,
      initialRoute: Routes.initialize,
      getPages: AppPages.pages,
      // initialBinding: AuthBinding()
    );
    //     ScreenUtilInit(
    //   designSize: const Size(390, 690),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   builder: (context, child) {
    //     return GetMaterialApp(
    //       title: 'Goo App',
    //       translationsKeys: AppTranslation.translationsKeys,
    //       translations: Translator(),
    //       locale: Get.locale ?? Get.deviceLocale,
    //       fallbackLocale: const Locale('km', 'KH'),
    //       debugShowCheckedModeBanner: false,
    //       theme: CustomTheme.lightTheme,
    //       navigatorKey: ContextProvider.navigatorKey,
    //       home: const SplashScreen(),
    //     );
    //   },
    // );
  }
}
