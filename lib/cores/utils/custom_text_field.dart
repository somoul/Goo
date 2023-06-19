import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hindText = "",
      this.labelText = "",
      this.trailingWidget = const SizedBox(),
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.initialValue,
      required this.onChange,
      this.hintStyle,
      this.valueStyle,
      this.obscureText = false})
      : super(key: key);
  final String hindText;
  final String labelText;
  final Widget trailingWidget;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final String? initialValue;
  final Function(String) onChange;
  final TextStyle? hintStyle;
  final TextStyle? valueStyle;
  final bool? obscureText;

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
            : Text(labelText, style: AppText.titleSmall),
        SizedBox(height: labelText != '' ? 10 : 0),
        TextFormField(
          cursorColor: AppConstant.kPrimaryColor,
          cursorRadius: const Radius.circular(10),
          cursorHeight: 20,
          cursorWidth: 2,
          initialValue: initialValue ?? '',
          obscureText: obscureText ?? false,
          onChanged: onChange,
          keyboardType: textInputType,
          style: valueStyle ?? AppText.bodyMedium,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            suffixIcon: suffixIcon,
            hintStyle:
                hintStyle ?? AppText.bodyMedium!.copyWith(color: Colors.grey),
            hintText: hindText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppConstant.kPrimaryColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
