// import 'dart:developer';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/foundation.dart';
//
// class AppBlocObserver extends BlocObserver {
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     if (bloc is Cubit) {
//       if (kDebugMode) {
//         log(change.toString());
//       }
//     }
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     if (kDebugMode) {
//       log(transition.toString());
//     }
//   }
// }
