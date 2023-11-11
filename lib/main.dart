import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:goo_rent/firebase_options.dart';
import 'package:goo_rent/helper/context_provider.dart';
import 'package:goo_rent/routes/route.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/locale/translator.dart';
import 'package:goo_rent/src/provider/app_ref.dart';
import 'package:goo_rent/src/splash/presentation/screen/splash_screen.dart';
import 'package:goo_rent/src/widgets/network/network_overlay.dart';
import 'package:goo_rent/theme/theme_data.dart';
import 'helper/locale_helper.dart';
// import 'package:goo_rent/utils/locale_helper.dart';

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
    return UncontrolledProviderScope(
        container: appRef,
        child: Consumer(
          builder: (context, ref, child) {
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
              builder: (context, child) {
                // final data = MediaQuery.of(context);
                return NetworkStatusOverlay(
                  child: Overlay(
                    initialEntries: [
                      OverlayEntry(builder: (_) => child!),
                    ],
                  ),
                );
                // MediaQuery(
                //   data: data.copyWith(
                //       textScaleFactor: 0.7 + data.textScaleFactor * 0.3),
                //   child: NetworkStatusOverlay(
                //     child: Overlay(
                //       initialEntries: [
                //         OverlayEntry(builder: (_) => child!),
                //       ],
                //     ),
                //   ),
                // );
              },
            );
          },
        ));

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
