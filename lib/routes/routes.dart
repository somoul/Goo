// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/building_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/business_house_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/factory_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/land_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/office_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/repo_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/restaurants_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/shop_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/business_rental_type/stalls_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/details_screen.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/find_new_location_screen.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/location_rent_screen.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/rent_type/apartment_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/rent_type/condo_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/rent_type/home_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/rent_type/room_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/rent_type/villa_rent_page.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/result_from_rent_screen.dart';
// import 'package:goo_rent_mobile/src/home/presentation/screen/view_location_screen.dart';
// import 'package:goo_rent_mobile/src/home/presentation/widget/custom_after_loading_search_widget.dart';
// import 'package:goo_rent_mobile/src/notification/presentation/screen/notification_screen.dart';
// import 'package:goo_rent_mobile/src/profile/presentation/screen/build_address_screen.dart';
// import 'package:goo_rent_mobile/src/profile/presentation/screen/edit_profile_page.dart';
// import 'package:goo_rent_mobile/src/profile/presentation/screen/modified_page.dart';
// import 'package:goo_rent_mobile/src/profile/presentation/screen/my_property_page.dart';
// import 'package:goo_rent_mobile/src/profile/presentation/screen/problem_page.dart';
// import 'package:goo_rent_mobile/src/profile/presentation/screen/real_estate_page.dart';
// import 'package:goo_rent_mobile/src/settings/presentation/pages/multiple_language_screen.dart';
// import 'package:goo_rent_mobile/src/sign_in/presentation/screen/create_name_screen.dart';
// import 'package:goo_rent_mobile/src/sign_in/presentation/screen/create_passwrod_screen.dart';
// import 'package:goo_rent_mobile/src/sign_in/presentation/screen/sign_in_screen.dart';
// import 'package:goo_rent_mobile/src/sign_in/presentation/screen/sign_up_screen.dart';
// import 'package:goo_rent_mobile/src/sign_in/presentation/screen/start_account_screen.dart';
// import 'package:goo_rent_mobile/src/sign_in/presentation/screen/verification_otp_screen.dart';
// import 'package:goo_rent_mobile/src/splash/presentation/screen/splash_screen.dart';

// // GoRouter configuration
// final router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       //path: '/',
//       path: SplashScreen.routeName,
//       builder: (context, state) => const SplashScreen(),
//     ),
//     GoRoute(
//       path: MainPage.routeName,
//       builder: (context, state) => const MainPage(),
//     ),
//     GoRoute(
//       path: DetailsScreen.routeName,
//       builder: (context, state) => const DetailsScreen(),
//     ),
//     GoRoute(
//       path: ViewLocationScreen.routeName,
//       builder: (context, state) => const ViewLocationScreen(),
//     ),
//     GoRoute(
//       path: LocationRentScreen.routeName,
//       builder: (context, state) => LocationRentScreen(
//         titleAppBar: state.extra as String,
//       ),
//     ),
//     GoRoute(
//       path: SignInScreen.routeName,
//       builder: (context, state) => const SignInScreen(),
//     ),
//     GoRoute(
//       path: FindNewLocationScreen.routeName,
//       builder: (context, state) => const FindNewLocationScreen(),
//     ),
//     GoRoute(
//       path: CustomAfterLoadingSearchWidget.routeName,
//       builder: (context, state) => CustomAfterLoadingSearchWidget(
//         titleAppBar: state.extra as String,
//       ),
//     ),
//     GoRoute(
//       path: ResultFromRentScreen.routeName,
//       builder: (context, state) => const ResultFromRentScreen(),
//     ),
//     GoRoute(
//       path: EditProfilePage.routeName,
//       builder: (context, state) => const EditProfilePage(),
//     ),
//     GoRoute(
//       path: ModifiedPage.routeName,
//       builder: (context, state) {
//         final value = state.extra as ModifyField;
//         return ModifiedPage(modifyField: value);
//       },
//     ),
//     GoRoute(
//       path: MyPropertyPage.routeName,
//       builder: (context, state) {
//         String value = state.extra as String;
//         return MyPropertyPage(
//           isMantenance: false,
//           checkAccount: value,
//         );
//       },
//     ),
//     GoRoute(
//       path: ProblemPage.routeName,
//       builder: (context, state) {
//         return const ProblemPage();
//       },
//     ),
//     GoRoute(
//       path: SignOutScreen.routeName,
//       builder: (context, state) {
//         return const SignOutScreen();
//       },
//     ),
//     GoRoute(
//       path: VerificationOTPScreen.routeName,
//       builder: (context, state) {
//         return const VerificationOTPScreen();
//       },
//     ),
//     GoRoute(
//       path: CreatePasswordScreen.routeName,
//       builder: (context, state) {
//         return const CreatePasswordScreen();
//       },
//     ),
//     GoRoute(
//       path: CreateNameScreen.routeName,
//       builder: (context, state) {
//         return const CreateNameScreen();
//       },
//     ),
//     GoRoute(
//       path: MultipleLanguageScreen.routeName,
//       builder: (context, state) {
//         return const MultipleLanguageScreen();
//       },
//     ),
//     GoRoute(
//       path: BuildAddressScreen.routeName,
//       builder: (context, state) {
//         return const BuildAddressScreen();
//       },
//     ),
//     GoRoute(
//       path: RealEstatePage.routeName,
//       builder: (context, state) {
//         return const RealEstatePage();
//       },
//     ),
//     GoRoute(
//       path: CondoRentPage.routeName,
//       builder: (context, state) {
//         return const CondoRentPage();
//       },
//     ),
//     GoRoute(
//       path: HomeRentPage.routeName,
//       builder: (context, state) {
//         return const HomeRentPage();
//       },
//     ),
//     GoRoute(
//       path: RoomRentPage.routeName,
//       builder: (context, state) {
//         return const RoomRentPage();
//       },
//     ),
//     GoRoute(
//       path: ApartmentRentPage.routeName,
//       builder: (context, state) {
//         return const ApartmentRentPage();
//       },
//     ),
//     GoRoute(
//       path: VillaRentPage.routeName,
//       builder: (context, state) {
//         return const VillaRentPage();
//       },
//     ),
//     GoRoute(
//       path: RepoRentPage.routeName,
//       builder: (context, state) {
//         return const RepoRentPage();
//       },
//     ),
//     GoRoute(
//       path: StallsRentPage.routeName,
//       builder: (context, state) {
//         return const StallsRentPage();
//       },
//     ),
//     GoRoute(
//       path: OfficeRentPage.routeName,
//       builder: (context, state) {
//         return const OfficeRentPage();
//       },
//     ),
//     GoRoute(
//       path: ShopRentPage.routeName,
//       builder: (context, state) {
//         return const ShopRentPage();
//       },
//     ),
//     GoRoute(
//       path: BuildRentPage.routeName,
//       builder: (context, state) {
//         return const BuildRentPage();
//       },
//     ),
//     GoRoute(
//       path: RestaurantsRentPage.routeName,
//       builder: (context, state) {
//         return const RestaurantsRentPage();
//       },
//     ),
//     GoRoute(
//       path: LandRentPage.routeName,
//       builder: (context, state) {
//         return const LandRentPage();
//       },
//     ),
//     GoRoute(
//       path: BusinessHouseRentPage.routeName,
//       builder: (context, state) {
//         return const BusinessHouseRentPage();
//       },
//     ),
//     GoRoute(
//       path: FactoryRentPage.routeName,
//       builder: (context, state) {
//         return const FactoryRentPage();
//       },
//     ),
//     GoRoute(
//       path: StartAccountScreen.routeName,
//       builder: (context, state) {
//         return const StartAccountScreen();
//       },
//     ),
//     GoRoute(
//       path: NotificationScreen.routeName,
//       builder: (context, state) {
//         return const NotificationScreen();
//       },
//     ),
//   ],
// );
