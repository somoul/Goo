// // ignore_for_file: unused_element

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui' as ui;

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:goo_rent/cores/enum/media_type.dart';
// import 'package:goo_rent/cores/utils/image_builder.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// import '../../export.dart';

// Future viewPhoto({
//   List<String> urls = const [],
//   List<String> assetPaths = const [],
//   List<String> filePaths = const [],
//   int initialIndex = 0,
// }) async {
//   Get.to(
//     curve: Curves.linear,
//     _PhotoView(
//       urls: urls,
//       assetPaths: assetPaths,
//       filePaths: filePaths,
//       initialIndex: initialIndex,
//     ),
//   );
// } 

// Future viewPhotoByProvider({
//   required List<ImageProvider> imageProviders,
//   int initialIndex = 0,
// }) async {
//   await push(
//     _PhotoView.fromProviders(
//       imageProviders: imageProviders,
//       initialIndex: initialIndex,
//     ),
//     fade: true,
//   );
// }

// class _PhotoView extends StatefulWidget {
//   final List<ImageProvider> imageProviders;
//   final int initialIndex;

//   _PhotoView({
//     Key? key,
//     List<String> urls = const [],
//     List<String> assetPaths = const [],
//     List<String> filePaths = const [],
//     required this.initialIndex,
//   })  : imageProviders = [
//           ...urls.map(
//             (e) => getImageProvider(
//               data: e,
//               source: MediaSourceTypes.network,
//               builder: null,
//             ),
//           ),
//           ...assetPaths.map(
//             (e) => getImageProvider(
//               data: e,
//               source: MediaSourceTypes.asset,
//               builder: null,
//             ),
//           ),
//           ...filePaths.map(
//             (e) => getImageProvider(
//               data: e,
//               source: MediaSourceTypes.file,
//               builder: null,
//             ),
//           ),
//         ],
//         super(key: key);

//   const _PhotoView.fromProviders({
//     Key? key,
//     required this.imageProviders,
//     required this.initialIndex,
//   }) : super(key: key);

//   @override
//   State<_PhotoView> createState() => _PhotoViewState();
// }

// class _PhotoViewState extends State<_PhotoView> {
//   late PageController pageController;
//   final ValueNotifier<bool> isDownloading = ValueNotifier<bool>(false);
//   // late StateProvider<double> opacityProvider;
//   bool didPop = false;

//   @override
//   void initState() {
//     // opacityProvider = StateProvider((ref) => 1.0);
//     pageController = PageController(
//       initialPage: widget.initialIndex,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final key = UniqueKey();
//     final appBar = AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       leading: Center(
//         child: CustomBackButton(
//           padding: 0.p,
//           icon: Container(
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.2),
//               shape: BoxShape.circle,
//             ),
//             child: const Center(
//               child: Icon(Icons.close),
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         ValueListenableBuilder(
//           valueListenable: isDownloading,
//           builder: (BuildContext context, bool value, Widget? child) {
//             if (value) {
//               return const SizedBox.square(
//                 dimension: 50,
//                 child: Center(
//                   child: SizedBox.square(
//                     dimension: 18,
//                     child: FittedBox(
//                       fit: BoxFit.contain,
//                       child: CupertinoActivityIndicator(),
//                     ),
//                   ),
//                 ),
//               );
//             } else {
//               return IconButton(
//                 onPressed: () async {
//                   // if (await requestPermission(Permission.storage).isGranted) {
//                   //   _saveImageToGallery(context);
//                   // } else {
//                   //   toast('Please enable storage permission'.tr);
//                   // }
//                 },
//                 padding: 0.p,
//                 icon: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.2),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Center(
//                     child: Icon(Icons.download),
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//         4.gap,
//       ],
//     );
//     final galleryView = Consumer(
//       child: PhotoViewGallery(
//         backgroundDecoration: const BoxDecoration(
//           color: Colors.transparent,
//         ),
//         pageController: pageController,
//         pageOptions: [
//           for (var imageProvider in widget.imageProviders)
//             PhotoViewGalleryPageOptions(
//               heroAttributes: PhotoViewHeroAttributes(
//                 tag: imageProvider.hashCode,
//               ),
//               imageProvider: imageProvider,
//               initialScale: PhotoViewComputedScale.contained * 1,
//               maxScale: PhotoViewComputedScale.contained * 4,
//               minScale: PhotoViewComputedScale.contained * 1,
//             ),
//         ],
//       ),
//       builder: (context, ref, child) {
//         final opacity = ref.watch(opacityProvider);
//         return Transform.scale(
//           scale: opacity.clamp(0.8, 1.0),
//           child: child!,
//         );
//       },
//     );
//     final body = Dismissible(
//       onUpdate: (detail) {
//         final newOpacity = (1.0 - detail.progress).clamp(0.0, 1.0);
//         appRef.read(opacityProvider.notifier).state = newOpacity;
//         if (!didPop && newOpacity < 0.1) {
//           didPop = true;
//           pop();
//         }
//       },
//       direction: DismissDirection.vertical,
//       key: key,
//       child: galleryView,
//     );
//     return Consumer(
//       builder: (BuildContext context, WidgetRef ref, Widget? child) {
//         final opacity = ref.watch(opacityProvider);
//         return Opacity(
//           opacity: opacity < 0.1 ? 0 : 1,
//           child: Scaffold(
//             backgroundColor: Colors.black.withOpacity(opacity),
//             appBar: appBar,
//             extendBodyBehindAppBar: true,
//             body: body,
//           ),
//         );
//       },
//     );
//   }

//   String generateName() {
//     final now = DateTime.now();
//     return '${now.year}-${now.month}-${now.day}-${now.hour}:${now.minute}:${now.second}_${getRandomString(4)}';
//   }

//   Future<File> getData(ImageProvider provider, BuildContext context) async {
//     var file =
//         File(getAbsolutePathOf('temp_save_gallery_${getRandomString(4)}.png'));
//     final stream = provider.resolve(ImageConfiguration.empty);
//     final completer = Completer<File>();
//     stream.addListener(
//       ImageStreamListener(
//         (ImageInfo info, bool _) async {
//           final byteData = await info.image.toByteData(
//             format: ui.ImageByteFormat.png,
//           );
//           await file.writeAsBytes(byteData!.buffer.asUint8List());
//           completer.complete(file);
//         },
//         onError: (e, stacktrace) {
//           completer.completeError(e);
//         },
//       ),
//     );
//     return await completer.future;
//   }

//   void _saveImageToGallery(BuildContext context) async {
//     var index = pageController.page?.round();
//     if (index == null) {
//       return;
//     }

//     try {
//       isDownloading.value = true;
//       index = index.clamp(0, widget.imageProviders.length - 1).floor();
//       final file = await getData(widget.imageProviders[index], context);
//       await ImageGallerySaver.saveFile(
//         file.path,
//         name: generateName(),
//       );
//     } catch (e, stackTrace) {
//       debugPrintStack(stackTrace: stackTrace);
//       toast(e);
//     } finally {
//       toast('Downloaded successfully'.tr);
//       isDownloading.value = false;
//     }
//   }
// }

// // abstract class ImageResource {
// //   final String path;
// //
// //   ImageResource(this.path, this.provider);
// //
// //   final ImageProvider provider;
// //
// //   String generateName() {
// //     final now = DateTime.now();
// //     return '${now.year}-${now.month}-${now.day}-${now.hour}:${now.minute}:${now.second}_${getRandomString(4)}';
// //   }
// //
// //   Future<File> getData(BuildContext context) async {
// //     var file =
// //         File(getAbsolutePath('temp_save_gallery_${getRandomString(4)}.png'));
// //     final stream = provider.resolve(ImageConfiguration.empty);
// //     final completer = Completer<File>();
// //     stream.addListener(
// //       ImageStreamListener(
// //         (ImageInfo info, bool _) async {
// //           final byteData = await info.image.toByteData(
// //             format: ui.ImageByteFormat.png,
// //           );
// //           await file.writeAsBytes(byteData!.buffer.asUint8List());
// //           completer.complete(file);
// //         },
// //         onError: (e, stacktrace) {
// //           completer.completeError(e);
// //         },
// //       ),
// //     );
// //     return await completer.future;
// //   }
// //
// //   Future<dynamic> saveToGallery(BuildContext context) async {
// //     print("Try to get data");
// //     var file = await getData(context);
// //     print("Get temp file $file");
// //     return await ImageGallerySaver.saveFile(
// //       file.path,
// //       name: generateName(),
// //     );
// //   }
// // }
// //
// // class NetworkImageResource extends ImageResource {
// //   NetworkImageResource(String path)
// //       : super(
// //           path,
// //           CachedNetworkImageProvider(path),
// //         );
// //
// // // @override
// // // Future<Uint8List> getData(BuildContext context) async {
// // //   var bundle = NetworkAssetBundle(Uri.parse(super.path));
// // //   print("Bundle $bundle");
// // //   var data = (await bundle.load(super.path)).buffer.asUint8List();
// // //   print('this is data ${utf8.decode(data)}');
// // //   return data;
// // // }
// // }
// //
// // class AssetImageResource extends ImageResource {
// //   AssetImageResource(String path)
// //       : super(
// //           path,
// //           AssetImage(path),
// //         );
// //
// // // @override
// // // Future<Uint8List> getData(BuildContext context) async {
// // //   var data = (await rootBundle.load(super.path)).buffer.asUint8List();
// // //   print('this is data ${utf8.decode(data)}');
// // //   return data;
// // // }
// // }
// //
// // class FileImageResource extends ImageResource {
// //   FileImageResource(String path)
// //       : super(
// //           path,
// //           FileImage(File(path)),
// //         );
// //
// // // @override
// // // Future<Uint8List> getData(BuildContext context) async {
// // //   var data = await File(super.path).readAsBytes();
// // //   print('this is data ${utf8.decode(data)}');
// // //   return data;
// // // }
// // }

