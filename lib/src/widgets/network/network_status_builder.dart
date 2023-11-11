import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:goo_rent/enum/network.dart';
import 'package:goo_rent/src/widgets/network/internet_connection_widget.dart';
export 'package:flutter/material.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:hive_flutter/hive_flutter.dart';

class NetworkStatusFeedbackBuilder extends StatefulWidget {
  final Widget? child;
  final Widget Function(
          BuildContext context, NetworkStatuses networkStatus, Widget? child)
      builder;

  const NetworkStatusFeedbackBuilder({
    super.key,
    this.child,
    required this.builder,
  });

  @override
  State<NetworkStatusFeedbackBuilder> createState() =>
      _NetworkStatusFeedbackBuilderState();
}

class _NetworkStatusFeedbackBuilderState
    extends State<NetworkStatusFeedbackBuilder> {
  var currentStatus = ValueNotifier(NetworkStatuses.haveInternet);
  StreamSubscription? connectivitySubscription;
  Timer? connectedTimer;
  Timer? connectingTimer;
  VoidCallback? nextActionAfterConnectingTimer;
  Timer? networkChecker;

  checkNetwork() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      nextActionAfterConnectingTimer = null;
      if (currentStatus.value != NetworkStatuses.noInternet) {
        // vibrate(light: true);
        currentStatus.value = NetworkStatuses.noInternet;
      }
    } else {
      if (currentStatus.value == NetworkStatuses.noInternet) {
        currentStatus.value = NetworkStatuses.connecting;
        connectingTimer = Timer(
          const Duration(seconds: 1),
          () {
            connectingTimer = null;
            if (nextActionAfterConnectingTimer != null) {
              nextActionAfterConnectingTimer?.call();
              nextActionAfterConnectingTimer = null;
            }
          },
        );
      }
      if (await InternetConnectionWidget.hasInternet()) {
        if (currentStatus.value == NetworkStatuses.noInternet ||
            currentStatus.value == NetworkStatuses.connecting) {
          updateToJustConnected() {
            currentStatus.value = NetworkStatuses.justConnected;
            connectedTimer = Timer(const Duration(seconds: 1), () {
              currentStatus.value = NetworkStatuses.haveInternet;
            });
          }

          if (connectingTimer == null) {
            updateToJustConnected();
          } else {
            nextActionAfterConnectingTimer = updateToJustConnected;
          }
        }
      } else {
        currentStatus.value = NetworkStatuses.connecting;
      }
    }
  }

  @override
  void initState() {
    checkNetwork();
    networkChecker = Timer.periodic(const Duration(seconds: 2), (timer) {
      checkNetwork();
    });

    connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (result) async {
        checkNetwork();
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    connectedTimer?.cancel();
    networkChecker?.cancel();
    connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentStatus,
      builder: (BuildContext context, NetworkStatuses networkStatuses,
          Widget? child) {
        return widget.builder(
          context,
          networkStatuses,
          widget.child,
        );
      },
    );
  }
}
