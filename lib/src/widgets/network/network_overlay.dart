import 'package:get/get.dart';
import 'package:goo_rent/enum/network.dart';
import 'package:goo_rent/helper/image_builder.dart';
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
                        return _buildStatus(
                          status: 'No internet connection'.tr,
                          color: Colors.red,
                        );
                      // _networkStatusBanner(
                      //   color: Colors.red,
                      //   iconPath: '',
                      //   title: 'No internet connection'.tr,
                      //   content: 'Please check your connection.'.tr,
                      // );
                      case NetworkStatuses.connecting:
                        return _buildStatus(
                          status: 'Internet connecting'.tr,
                          color: const Color(0xffF6B818),
                        );
                      // _networkStatusBanner(
                      //   color: const Color(0xffF6B818),
                      //   iconPath: '',
                      //   title: 'Internet connecting'.tr,
                      //   content: 'Please wait, try to connect...'.tr,
                      // );
                      case NetworkStatuses.justConnected:
                        return _buildStatus(
                          status: 'Internet connected'.tr,
                          color: Colors.green,
                        );
                      //  _networkStatusBanner(
                      //   color: Colors.green,
                      //   iconPath: "",
                      //   title: 'Internet connected'.tr,
                      //   content: 'Your connection is back.'.tr,
                      // );
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

  _buildStatus({required String status, required Color color}) {
    return Material(
      color: Colors.black26,
      child: Center(
        child: Container(
          padding: 30.p,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Text(
            status,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget networkStatusBanner({
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
            Container(
              margin: 75.pt,
              width: double.infinity,
              padding: 20.p,
              color: color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageBuilder().asset(iconPath),
                  15.gap,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        content,
                        style: const TextStyle(color: Colors.white),
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
