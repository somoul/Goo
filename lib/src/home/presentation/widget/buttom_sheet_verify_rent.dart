import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                "ការបញ្ចាក់",
                style: GoogleFonts.kantumruy(
                    fontSize: 18, fontWeight: FontWeight.bold),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ផ្ទះរស់នៅ",
                          style: GoogleFonts.kantumruy(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text("ដោយ ហម ហុី",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, color: Colors.grey))
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("ឯកសារព្រមព្រៀង",
                                style: GoogleFonts.kantumruy(fontSize: 16)),
                            const Icon(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "តម្លៃជួល",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          "\$100/ខែ",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "តម្លៃជើងសារ",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          "\$20",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ប្រភេទផ្ធះ",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          "បន្ទប់ជួល",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "លេខសម្គាល់",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          "A198",
                          style: GoogleFonts.kantumruy(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                            child: Text(
                              "ព្រមទទួល",
                              style: GoogleFonts.kantumruy(
                                  color: Colors.white, fontSize: 18),
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
