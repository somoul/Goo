import 'package:get/get.dart';
import 'package:goo_rent/src/widgets/network/network_status_builder.dart';

import '../../../constant/app_text.dart';

class PostHistory extends StatelessWidget {
  const PostHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            "Sales".tr,
            style: AppText.bodyMedium!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Spacer(),
              SizedBox(
                height: 100,
                width: 135,
                child: Image.asset("assets/icons/undraw_empty_search.png"),
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                "Coming soon...".tr,
                style: AppText.bodyMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ));
  }
}
