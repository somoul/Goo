import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_rent/src/profile/presentation/widget/buttom_sheet_edit_profile_photo.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildButtonCameraWidget extends StatelessWidget {
  const BuildButtonCameraWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // surfaceTintColor: ,
              //   backgroundColor: const Color(0xFFbaecff).withOpacity(0.9),
              padding: const EdgeInsets.all(0)),
          onPressed: () {
            showBottomEditProfilePhoto(
                context: context,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 10,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      "ជ្រើសរើសរូបភាព",
                      style: GoogleFonts.kantumruy(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ថតរូប",
                      style: GoogleFonts.kantumruy(
                          fontSize: 20, color: const Color(0xFF21A6F8)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ជ្រើសរើសរូបភាព",
                      style: GoogleFonts.kantumruy(
                          fontSize: 20, color: const Color(0xFF21A6F8)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 6,
                      thickness: 10,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Cancel",
                      style: GoogleFonts.kantumruy(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.camera_alt,
                color: Colors.lightBlueAccent.shade700,
                size: 30,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "ដាក់រូបទីនេះ",
                style: GoogleFonts.kantumruy(
                    color: Colors.lightBlueAccent.shade700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          )),
    );
  }
}
