import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/theme/theme_data.dart';
import 'package:goo_rent/routes/route.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/goo_rent_app.dart';
import 'package:goo_rent/src/home/presentation/provider/provider_arrow_details_screen.dart';
import 'package:goo_rent/src/home/presentation/widget/background_anitmation_pageview_provider/background_animation_pageview_provider.dart';
import 'package:goo_rent/src/home/presentation/widget/banner_list_index_provider/banner_list_index_provider.dart';
import 'package:goo_rent/src/home/presentation/widget/type_of_rent_provider/type_of_index_provider.dart';
import 'package:goo_rent/src/authentication/country_code/countdown_otp_provider.dart';
import 'package:goo_rent/cores/utils/context_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      title: 'Goo Rent',
      navigatorKey: ContextProvider.navigatorKey,
      initialRoute: Routes.home,
      getPages: AppPages.pages,
      // initialBinding: AuthBinding()
    );
  }
}
