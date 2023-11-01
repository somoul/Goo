import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:developer' as log;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/local_storage.dart';

class NotificationHelper with NotificationInteractionHandler {
  NotificationHelper._internal();
  static final instance = NotificationHelper._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static String? _messageToken;

  Future<void> onInitFirebaseNotifications() async {
    try {
      await _firebaseMessagingInitalize();
      await _setupNotificationInteractHandler();
      await _getDeviceToken();
    } on FirebaseException {
      log.log('Firebase messaging error.'.tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _firebaseMessagingInitalize() async {
    if (Platform.isIOS) {
      await _fcm.requestPermission(
        sound: true,
        badge: true,
        alert: true,
      );
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else {
      await _localNotificatonSetup();
      FirebaseMessaging.onMessage.listen(_createLocalNotification);
      FirebaseMessaging.onBackgroundMessage(_createLocalNotification);
    }
  }

  Future<void> _setupNotificationInteractHandler() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      notificationClickHandle(message.data);
    });
  }

  Future<void> _getDeviceToken() async {
    _messageToken = await _fcm.getToken();
    await LocalStorage.writeNoficationToken(_messageToken!);
  }

//* open local_notification
  Future<void> _localNotificatonSetup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSetting);
    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    Map payLoadMap = jsonDecode(notificationResponse.payload!);
    notificationClickHandle(payLoadMap);
  }

  void onSelectNotification(NotificationResponse notificationResponse) async {
    Map payLoadMap = jsonDecode(notificationResponse.payload!);
    notificationClickHandle(payLoadMap);
  }

  static Future<void> _createLocalNotification(RemoteMessage message) async {
    RemoteNotification? notificationPayload = message.notification;
    String title = notificationPayload?.title ?? '';
    String body = notificationPayload?.body ?? '';
    String dataPayload = jsonEncode(message.data);

    const androidDetail = AndroidNotificationDetails(
      'default',
      'default',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
      setAsGroupSummary: true,
    );
    const noticeDetail = NotificationDetails(android: androidDetail);
    int id = Random().nextInt(1000000000);
    try {
      await _localNotificationsPlugin.show(
        id,
        title,
        body,
        noticeDetail,
        payload: dataPayload,
      );
    } catch (e) {
      rethrow;
    }
  }

  void cancelAllNotification() {
    _localNotificationsPlugin.cancelAll();
  }

  static Future<void> updateTotalBadges(totalBadges) async {
    await FlutterAppBadger.updateBadgeCount(totalBadges);
  }
}

/// seperate logic handling from configuration
mixin NotificationInteractionHandler {
  void notificationClickHandle(Map data) async {
    var notificationType = data['notificationType'];
    String params = data['params'];
    var decodeParams = json.decode(params);

    switch (notificationType) {
      case 'sent-friend-request':
        var profileId = decodeParams['profileId'];
        confirmFriendRequestHandler(profileId);
        break;

      case 'confirmed-friend-request':
        var id = decodeParams['confirmer'];
        var requestType = decodeParams['requestType'];
        var confirmerMessage = decodeParams['confirmerMessage'];
        var profileId = requestType + id;
        confirmFriendAcceptHandler(profileId, confirmerMessage);
        break;

      case 'voice-messsage':
        var roomId = decodeParams['room']['_id'];
        var type = decodeParams['room']['type'];
        if (type == 'g') {
          goToGrouupRoomHandler(roomId);
        } else {
          goToChatRoomHandler(roomId);
        }
        break;

      case 'added-as-friend':
        var profileId = decodeParams['profileId'];
        confirmAutoFriendHandler(profileId);
        break;

      case 'send-message-to-personal':
        var roomId = decodeParams['room']['_id'];
        goToChatRoomHandler(roomId);
        break;

      case 'remove-admin-from-admin-group':
        var roomId = decodeParams['roomId'];
        goToGrouupRoomHandler(roomId);
        break;

      default:
    }
  }

  void confirmFriendRequestHandler(contactId) async {}

  void confirmFriendAcceptHandler(contactId, confirmerMessage) async {}

  void confirmAutoFriendHandler(contactId) async {}

  void goToChatRoomHandler(roomId) async {}

  void goToGrouupRoomHandler(roomId) async {}
}

// import 'dart:async';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:goo_rent/cores/utils/context_provider.dart';
// import 'package:goo_rent/cores/utils/local_storage.dart';
// import 'package:goo_rent/src/notification/presentation/screen/notification_screen.dart';

// class NotificationHelper {
//   NotificationHelper._internal();
//   static final instance = NotificationHelper._internal();

//   static final StreamController<String?> _selectNotificationStream =
//       StreamController<String?>.broadcast();
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;

//   static const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   static InitializationSettings initializationSettings =
//       const InitializationSettings(
//     android: initializationSettingsAndroid,
//   );

//   static String navigationActionId = 'static_id';

//   Future<void> initializer() async {
//     // try {
//     //   await _firebaseMessagingInitalize();
//     //   await _setupNotificationInteractHandler();
//     //   await _getDeviceToken();
//     // } on FirebaseException {
//     //   log.log('fcm error');
//     // } catch (e) {
//     //   rethrow;
//     // }
//   }

//   Future<void> onRequestNotificationPermission() async {
//     NotificationSettings settings = await _fcm.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('User granted permission'.tr);
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       debugPrint('User granted provisional permission'.tr);
//     } else {
//       debugPrint('User declined or has not accepted permission'.tr);
//     }
//   }

//   Future<void> _setupNotificationInteractHandler() async {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       notificationClickHandle(message.data);
//     });
//   }

//   static Future<void> onInitializeNotification() async {
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         switch (notificationResponse.notificationResponseType) {
//           case NotificationResponseType.selectedNotification:
//             _selectNotificationStream.add(notificationResponse.payload);
//             break;
//           case NotificationResponseType.selectedNotificationAction:
//             if (notificationResponse.actionId == navigationActionId) {
//               _selectNotificationStream.add(notificationResponse.payload);
//             }
//             break;
//         }
//       },
//       // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//     onStoreNotification();
//   }

//   static void onStoreNotification() async {
//     var token = await FirebaseMessaging.instance.getToken();
//     await LocalStorage.writeNoficationToken(token ?? '');
//   }

//   @pragma('vm:entry-point')
//   void notificationTapBackground(NotificationResponse notificationResponse) {
//     // ignore: avoid_print
//     print('notification(${notificationResponse.id}) action tapped: '
//         '${notificationResponse.actionId} with'
//         ' payload: ${notificationResponse.payload}');
//     if (notificationResponse.input?.isNotEmpty ?? false) {
//       // ignore: avoid_print
//       print(
//           'notification action tapped with input: ${notificationResponse.input}');
//     }
//   }

//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static Future<void> requestPermissions() async {
//     if (Platform.isIOS) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               MacOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//           flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>();
//       await androidImplementation?.requestPermission();
//       // final bool? granted = await androidImplementation?.requestPermission();
//       // setState(() {
//       //   _notificationsEnabled = granted ?? false;
//       // });
//     }
//   }

//   void configureDidReceiveLocalNotificationSubject() {
//     final StreamController<ReceivedNotification>
//         didReceiveLocalNotificationStream =
//         StreamController<ReceivedNotification>.broadcast();

//     didReceiveLocalNotificationStream.stream
//         .listen((ReceivedNotification receivedNotification) async {
//       await showDialog(
//         context: ContextProvider.context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: receivedNotification.title != null
//               ? Text(receivedNotification.title!)
//               : null,
//           content: receivedNotification.body != null
//               ? Text(receivedNotification.body!)
//               : null,
//           actions: <Widget>[
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               onPressed: () async {
//                 Navigator.of(context, rootNavigator: true).pop();
//                 await Navigator.of(context).push(
//                   MaterialPageRoute<void>(
//                     builder: (BuildContext context) =>
//                         const NotificationScreen(),
//                   ),
//                 );
//               },
//               child: const Text('Ok'),
//             )
//           ],
//         ),
//       );
//     });
//   }

//   static Future<void> showNotification() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await flutterLocalNotificationsPlugin.show(
//         1, 'plain title', 'plain body', notificationDetails,
//         payload: 'item x');
//   }
// }

// class ReceivedNotification {
//   ReceivedNotification({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.payload,
//   });

//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
// }
