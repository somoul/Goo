import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hindText = "",
      this.labelText = "",
      this.trailingWidget = const SizedBox(),
      this.suffixIcon,
      this.color = Colors.black,
      this.maxLine = 1})
      : super(key: key);
  final String hindText;
  final String labelText;
  final Widget trailingWidget;
  final Widget? suffixIcon;
  final Color color;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText.isEmpty
            ? const SizedBox()
            : const SizedBox(
                height: 10,
              ),
        labelText.isEmpty
            ? const SizedBox()
            : Text(labelText, style: GoogleFonts.kantumruy(fontSize: 16)),
        const SizedBox(
          height: 10,
        ),
        TextField(
          maxLines: maxLine,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              suffixIcon: suffixIcon,
              hintStyle: GoogleFonts.kantumruy(fontSize: 14),
              hintText: hindText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: color)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: color))),
        ),
      ],
    );
  }
}
