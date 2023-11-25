import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InternetConnectionWidget extends ConsumerStatefulWidget {
  final Widget? child;
  final int millisecond;
  final bool delayWhenChanged;
  final Widget Function(
          BuildContext context, bool online, bool hasNetwork, Widget? child)
      builder;

  static Future<bool> hasConnectionTo(String domain) async {
    try {
      final result = await InternetAddress.lookup(domain);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<bool> hasInternet() async {
    var connections = await Future.wait([
      hasConnectionTo('google.com'),
      // hasConnectionTo('baidu.com'),
      hasConnectionTo('yandex.ru'),
    ]);
    return connections.any((connected) => connected);
  }

  const InternetConnectionWidget({
    super.key,
    this.millisecond = 1000,
    this.child,
    required this.builder,
    this.delayWhenChanged = false,
  });

  @override
  ConsumerState<InternetConnectionWidget> createState() =>
      _InternetConnectionWidgetState();
}

class _NetworkStatus {
  final bool hasInternet;
  final bool hasNetwork;

  _NetworkStatus(this.hasInternet, this.hasNetwork);

  @override
  operator ==(Object other) {
    if (other is _NetworkStatus) {
      return '$hasInternet$hasNetwork' ==
          '${other.hasInternet}${other.hasNetwork}';
    }
    return false;
  }

  @override
  int get hashCode => '$hasInternet$hasNetwork'.hashCode;
}

class _InternetConnectionWidgetState
    extends ConsumerState<InternetConnectionWidget> {
  StreamSubscription? connectivitySubscription;
  ValueNotifier<_NetworkStatus> isOnline =
      ValueNotifier(_NetworkStatus(true, true));
  Timer? timer;
  ConnectivityResult? connectivity;

  @override
  void initState() {
    InternetConnectionWidget.hasInternet().then((result) {
      isOnline.value = _NetworkStatus(true, true);
    });
    timer = Timer.periodic(
      Duration(milliseconds: widget.millisecond),
      (timer) async {
        if (await InternetConnectionWidget.hasInternet()) {
          isOnline.value = _NetworkStatus(true,
              connectivity == null || connectivity != ConnectivityResult.none);
        } else {
          isOnline.value = _NetworkStatus(false, false);
        }
      },
    );
    connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) async {
      debugPrint("Connection Status - $connectivity");
      if (result == ConnectivityResult.none) {
        isOnline.value = _NetworkStatus(false, false);
      } else {
        if (connectivity != null) {
          isOnline.value = _NetworkStatus(false, true);
        }
        Future.wait([
          InternetConnectionWidget.hasInternet(),
          Future.delayed(
            Duration(
              milliseconds: widget.delayWhenChanged ? 900 : 0,
            ),
          )
        ]).then((value) {
          isOnline.value = _NetworkStatus(value[0], true);
        });
      }
      connectivity = result;
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isOnline,
      builder: (BuildContext context, status, Widget? child) {
        return widget.builder(
            context, status.hasInternet, status.hasNetwork, child);
      },
      child: widget.child,
    );
  }
}
