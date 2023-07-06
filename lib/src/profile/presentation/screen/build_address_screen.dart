import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/src/notification/presentation/widget/custom_listtile_widget.dart';

class BuildAddressScreen extends StatelessWidget {
  const BuildAddressScreen({Key? key}) : super(key: key);
  static const String routeName = "/build_address_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "អាស្រាយដ្ធាន",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0 * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // GoRouter.of(context).push(ViewLocationScreen.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/image2/Location.svg"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "បញ្ជូលទីតាំងរបស់អ្នកត្រូវជួល",
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "អាស័យដ្ធានលោកអ្នកធ្លាប់ស្វែងរករ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const CustomListTileWidget()
            ],
          ),
        ),
      ),
    );
  }
}
