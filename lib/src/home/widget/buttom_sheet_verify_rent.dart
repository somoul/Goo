import 'package:flutter/material.dart';

void showButtomSheetVerifyRent({required BuildContext context}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return const BottomSheetScreen();
      });
}

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return AnimatedPadding(
      duration: kThemeAnimationDuration,
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Text(
                "ការបញ្ចាក់",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: Colors.white),
                          shape: BoxShape.circle),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/image2/person.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ផ្ទះរស់នៅ",
                        ),
                        Text(
                          "ដោយ ហម ហុី",
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text(
                              "ឯកសារព្រមព្រៀង",
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 18,
                              color: Colors.grey,
                            )
                          ],
                        ))
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "តម្លៃជួល",
                        ),
                        Text(
                          "\$100/ខែ",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "តម្លៃជើងសារ",
                        ),
                        Text(
                          "\$20",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ប្រភេទផ្ធះ",
                        ),
                        Text(
                          "បន្ទប់ជួល",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "លេខសម្គាល់",
                        ),
                        Text(
                          "A198",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              // GoRouter.of(context).pop();
                              // showMyDialog(context: context);
                            },
                            child: const Text(
                              "ព្រមទទួល",
                            )))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
