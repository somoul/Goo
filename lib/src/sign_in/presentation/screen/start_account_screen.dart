import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartAccountScreen extends StatelessWidget {
  const StartAccountScreen({Key? key}) : super(key: key);
  static const String routeName = '/StartAccountScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/image2/cheif.svg"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/image2/Start your Journey.svg"),
                    const SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset("assets/image2/find.svg"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            _buildButtonLoginMedia(
                context: context,
                media: "Facebook",
                iconSrc: "assets/image2/facebook.png"),
            _buildButtonLoginMedia(
                context: context,
                media: "Google",
                iconSrc: "assets/image2/google.png"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: (MediaQuery.of(context).size.width / 2) - 40,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                Text(
                  "or",
                  style: GoogleFonts.kantumruy(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: (MediaQuery.of(context).size.width / 2) - 40,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xff21A6F8),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign with phone number",
                      style: GoogleFonts.kantumruy(
                          fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildButtonLoginMedia(
      {required BuildContext context,
      required String media,
      required String iconSrc}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconSrc),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Continues with $media",
              style: GoogleFonts.kantumruy(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
