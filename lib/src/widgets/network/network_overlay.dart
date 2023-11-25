import 'package:get/get.dart';
import 'package:goo_rent/enum/network.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/home/widget/shake_widget.dart';
import 'package:goo_rent/src/provider/connection.dart';
import 'package:goo_rent/src/widgets/network/network_status_builder.dart';
import 'package:goo_rent/utils/extension/num.dart';

class NetworkStatusOverlay extends ConsumerWidget {
  final Widget child;

  const NetworkStatusOverlay({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exitEntryPoint = ref.watch(exitEntryPointProvider);
    return NetworkStatusFeedbackBuilder(
      builder: (context, status, _) {
        return Stack(
          children: [
            child,
            if (exitEntryPoint)
              Positioned.fill(
                child: Builder(
                  builder: (BuildContext context) {
                    switch (status) {
                      case NetworkStatuses.noInternet:
                        return _networkStatusBanner(
                          color: Colors.red,
                          iconPath: 'assets/image2/no-internet.png',
                          title: 'No internet connection'.tr,
                          content: 'Please check your connection.'.tr,
                        );
                      case NetworkStatuses.connecting:
                        return _networkStatusBanner(
                          color: const Color(0xffF6B818),
                          iconPath: 'assets/image2/internet-connected.png',
                          title: 'Internet connecting'.tr,
                          content: 'Please wait, try to connect...'.tr,
                        );
                      case NetworkStatuses.justConnected:
                        return _networkStatusBanner(
                          color: Colors.green,
                          iconPath: 'assets/image2/internet-connected.png',
                          title: 'Internet connected'.tr,
                          content: 'Your connection is back.'.tr,
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              )
          ],
        );
      },
    );
  }

  Widget _networkStatusBanner({
    required Color color,
    required String iconPath,
    required String title,
    required String content,
  }) {
    return Material(
      color: Colors.black54,
      child: SafeArea(
        child: Column(
          children: [
            12.gap,
            Container(
              width: double.infinity,
              padding: 15.p,
              color: color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: color == Colors.red ? 35 : 38,
                    height: color == Colors.red ? 35 : 38,
                    child: ImageBuilder().asset(iconPath),
                  ),
                  15.gap,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        content,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
