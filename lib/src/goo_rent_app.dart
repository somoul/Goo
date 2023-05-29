// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:goo_rent/cores/theme/theme_data.dart';
// import 'package:goo_rent/routes/route.dart';
// import 'package:goo_rent/routes/route_name.dart';
// import 'package:goo_rent/utils/context_provider.dart';

// class GooRentApp extends StatelessWidget {
//   const GooRentApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(390, 690),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return asGetsMaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: CustomTheme.lightTheme,
//             title: 'Goo Rent',
//             navigatorKey: ContextProvider.navigatorKey,
//             initialRoute: Routes.home,
//             getPages: AppPages.pages,
//             // initialBinding: AuthBinding()
//           );
//         });
//   }
// }
